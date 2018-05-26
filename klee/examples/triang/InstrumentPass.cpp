#define DEBUG_TYPE "InstrumentPass"

#include "InstrumentPass.h"
#include "llvm/IR/Module.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/ADT/SmallVector.h"


#include <vector>
#include <queue>
#include <stack>
#include <unordered_set>
#include <unordered_map>

using namespace ee382v;
using namespace llvm;
using namespace std;

unordered_map<string, int> loopIdmap;
unsigned int loopId=0;

bool InstrumentPass::runOnLoop(llvm::Loop* loop, llvm::LPPassManager& lpm)
{
  unordered_map<string, vector<pair<string, int>>> fwd_map;
  unordered_map<string, vector<pair<string, int>>> bck_map;
  unordered_map<string, int> num_path;
  unordered_map<string, int> resolved;

  LoopInfo& loopInfo = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
	DominatorTree& domTree = getAnalysis<DominatorTreeWrapperPass>().getDomTree();
  auto* dt = &domTree;
  auto* li = &loopInfo;
  Module *M = loop->getLoopPreheader()->getParent()->getParent(); 
  auto& subloop_vec = loop->getSubLoops();

  /******************************************/
  /************Innermost Loop****************/
  /******************************************/
  if(subloop_vec.size() == 0) {
    auto loopIt = loopIdmap.find(loop->getHeader()->getName());
    if(loopIt == loopIdmap.end()) {
      //new loop
      loopId++;
      loopIdmap[loop->getHeader()->getName()] = loopId;
    }
    auto Loop_BBList = loop->getBlocks();
    
    /*-----Sample ALgorithm-------*/
    errs() << "----------ALGORITHM-------------\n";
    /*Populate the forward and backward loops*/
    for(auto curr_inst = Loop_BBList.begin(); curr_inst!=Loop_BBList.end(); ++curr_inst) {
      //auto* curr_inst = loop->getHeader();
      //init num path values
      num_path[(*curr_inst)->getName()] = 0;
      if((*curr_inst) != loop->getLoopLatch()) {
        errs()<< " Now processing for current inst " << (*curr_inst)->getName() <<"\n";
        std::vector<pair<string, int>> fvec;
        const TerminatorInst *curr_term = (*curr_inst)->getTerminator();
        for (unsigned I = 0, NSucc = curr_term->getNumSuccessors(); I < NSucc; ++I) {
          BasicBlock *Succ = curr_term->getSuccessor(I);
          errs()<<" Contained in Loop "<<loop->contains(Succ);
          Succ->dump();
          if(loop->contains(Succ)) {    
          /*populate backward map*/
          auto map_it = bck_map.find(Succ->getName());
          /*if empty*/
          if(map_it == bck_map.end()) {
            std::vector<pair<string, int>> bvec;
            pair<string,int> new_p((*curr_inst)->getName(),0);
            bvec.push_back(new_p);
            //new entry
            bck_map[Succ->getName()] = bvec;
          } else {
            pair<string,int> new_p((*curr_inst)->getName(),0);
            map_it->second.push_back(new_p);
          }

          /*Queue Up forward map*/
          pair<string,int> new_fp(Succ->getName(),0);
          fvec.push_back(new_fp);          
          }
        }
        fwd_map[(*curr_inst)->getName()] = fvec;
      }
    }

    /*******************Exit Logic*************************/
    for(auto it = Loop_BBList.begin(); it!=Loop_BBList.end(); ++it) {
      if(loop->isLoopExiting(*it)) {
        /*Exit should be the child of all blocks which exit the loop*/
        errs() << "Exiting block \n";
        (*it)->dump();
        auto f_fwd = fwd_map.find((*it)->getName());
        if(f_fwd != fwd_map.end()) {
          pair<string,int> new_fdd("Exit",0);
          (*f_fwd).second.push_back(new_fdd);
        }
  
        /*Populating Exits parents in the BCK map*/
        auto f_bwd = bck_map.find("Exit");
        if(f_bwd == bck_map.end()) {
          pair<string,int> new_bdd((*it)->getName(),0);
          std::vector<pair<string, int>> bvec;
          bvec.push_back(new_bdd);
          bck_map["Exit"] = bvec;
        }
        else {
          pair<string,int> new_bdd((*it)->getName(),0);
          (*f_bwd).second.push_back(new_bdd);
        }
      }
      if((*it)->getName().compare(loop->getLoopLatch()->getName()) == 0) {
        /*Exit should also be the child of loop latch*/
        pair<string,int> new_fdd("Exit",0);
        std::vector<pair<string, int>> nvec;
        nvec.push_back(new_fdd);
        fwd_map[loop->getLoopLatch()->getName()] = nvec;

        /*Populating Exits parents in the BCK map*/
        auto f_bwd = bck_map.find("Exit");
        if(f_bwd == bck_map.end()) {
          pair<string,int> new_bdd(loop->getLoopLatch()->getName(),0);
          std::vector<pair<string, int>> bvec;
          bvec.push_back(new_bdd);
          bck_map["Exit"] = bvec;
        }
        else {
          pair<string,int> new_bdd(loop->getLoopLatch()->getName(),0);
          (*f_bwd).second.push_back(new_bdd);
        }
      }
    }
    
    /******************************************************/
    /**************** Path Resolution *********************/
    /******************************************************/
    //vector<string> resolved;
    int num = 1;
    int new_num = 0;
    deque<string> to_be_done;
    //here
    //to_be_done.push_front(loop->getLoopLatch()->getName());
    to_be_done.push_front("Exit");
    while(!to_be_done.empty()) {
      new_num=0;
      while(num > 0) {
        string  current_bb = to_be_done.back(); 
        to_be_done.pop_back();
        //here
        //if(current_bb.compare(loop->getLoopLatch()->getName())==0) {
        if(current_bb.compare("Exit")==0) {
          num_path[current_bb] = 1;
          errs() << " Resolved " << current_bb << "   " << num_path[current_bb] << "\n";
          resolved[current_bb] = 1; 
        }
        else {
          if(resolved.find(current_bb) == resolved.end()) { 
            auto map_it2 = fwd_map.find(current_bb);
            for(auto it = map_it2->second.begin(); it != map_it2->second.end(); ++it) {
              string bb = (*it).first;
              (*it).second = num_path[current_bb];
              //num_path[current_bb] = num_path[bb] + num_path[current_bb];
              //FIXME
              //current_bb - parent and bb - children
              auto git = bck_map.find(bb);
              if(git != bck_map.end()) {
                for(auto it4 = git->second.begin(); it4 != git->second.end(); ++it4) {
                  string bb3 = (*it4).first;
                  if(current_bb.compare(bb3)==0) {
                    (*it4).second = num_path[current_bb];
                  }
                }
              }  
              //end FIXME 
              num_path[current_bb] = num_path[bb] + num_path[current_bb];
            }
            errs() << " Resolved " << current_bb << "   " << num_path[current_bb] << "\n";
            resolved[current_bb] = 1;
          }
        }
        num--;
        auto map_it = bck_map.find(current_bb);
        if(current_bb.compare(loop->getHeader()->getName())!=0) {
          if(map_it == bck_map.end()) {
            errs() << " ERROR - Basic Block not found " << current_bb << "\n";
          } 
          else {
            errs() << " To be done Next ";  
            for(auto it = map_it->second.begin(); it != map_it->second.end(); ++it) {
              string bb = (*it).first;
              bool res = true;
              /*iterate the forward map to see if the successors are resolved*/
              auto map_it2 = fwd_map.find(bb);
              for(auto it4 = map_it2->second.begin(); it4 != map_it2->second.end(); ++it4) {
                string bb3 = (*it4).first;
                if(resolved.find(bb3) == resolved.end())
                  res = false;
              }
              if(res) {
                to_be_done.push_front(bb);
                new_num++;
                errs() << bb ;
              }
            }
            errs() << "\n---------------------\n"; 
          }
        }
      }
      num = new_num;
    }


    /******************************************************/
    /************** Debug Map Print ***********************/
    /******************************************************/

    errs() << "------fwd map-------\n";
    for (auto iter = fwd_map.begin(); iter != fwd_map.end(); iter++) {
      errs() << "Key: " << iter->first << "\n" << "Values: \n";
      for (auto list_iter = iter->second.begin(); list_iter != iter->second.end(); list_iter++)
        errs() << " " << (*list_iter).first << "    " << (*list_iter).second << "\n";
    }
    errs() << "-------back map--------\n";
    for (auto iter = bck_map.begin(); iter != fwd_map.end(); iter++) {
      errs() << "Key: " << iter->first << "\n" << "Values: \n";
      for (auto list_iter = iter->second.begin(); list_iter != iter->second.end(); list_iter++)
        errs() << " " << (*list_iter).first << "    " << (*list_iter).second << "\n";
    }
    errs() << "-------pathNUM---------\n";
    for (auto iter = num_path.begin(); iter != num_path.end(); iter++) {
      errs() << " " << (*iter).first << "    " << (*iter).second << "\n"; 
    }
    errs() << "----------END ALGORITHM-------------\n";

    /******************************************************/
    /*************** Dump Path Desc ***********************/
    /******************************************************/

    string header = loop->getHeader()->getName();
    string exit = "Exit";
    int num_Path = num_path[header]-1;
    while(num_Path >= 0) {
      deque<string> sequence;
      string current_bb = loop->getHeader()->getName();
      int curr_path = num_Path;
      //errs() << " new Path " << "\n";
      while(current_bb.compare("Exit") != 0) {
        //errs() << " hello " << current_bb << "\n";
        auto sad = fwd_map.find(current_bb);
        int max_weight = 0;
        string next_node;
        for(auto list_iter = sad->second.begin(); list_iter != sad->second.end(); list_iter++) {
          if((((*list_iter).second) >= max_weight) && (((*list_iter).second) <= curr_path)) {
            max_weight = ((*list_iter).second);
            next_node = ((*list_iter).first);
          }
        }
        sequence.push_front(current_bb);
        current_bb = next_node;
        if(next_node.compare("Exit")==0) {
          sequence.push_front(current_bb);
        }
        //errs() << " hello next node " << next_node << "  " <<current_bb << "\n";
        curr_path = curr_path-max_weight;
      }
      printf("%i  %i  ", loopIdmap[loop->getHeader()->getName()], num_Path);
      while(!sequence.empty()) {
        if(sequence.back().compare("Exit")) {
          errs() << sequence.back() << "->";
          printf("%s->", sequence.back().c_str());
        }
        else {
          errs() << sequence.back();
          printf("%s", sequence.back().c_str());
        }
        sequence.pop_back();
      }
      errs()<<"\n";
      printf("\n");
      num_Path--;
    }

    /******************************************************/
    /************** Call runtime functions ****************/
    /******************************************************/

    Function *func_init = dyn_cast<Function> (M->getOrInsertFunction("init_path_reg", Type::getVoidTy(M->getContext()), 
                                              Type::getInt32Ty(M->getContext()), NULL));
    Function *func_final = dyn_cast<Function> (M->getOrInsertFunction("finalize_path_reg", Type::getVoidTy(M->getContext()),
                                               Type::getInt32Ty(M->getContext()), NULL));
    Function *func_final2 = dyn_cast<Function> (M->getOrInsertFunction("finalize_path_reg", Type::getVoidTy(M->getContext()),
                                                Type::getInt32Ty(M->getContext()), NULL));
    Function *func_inc = dyn_cast<Function> (M->getOrInsertFunction("inc_path_reg", Type::getVoidTy(M->getContext()),
                                             Type::getInt32Ty(M->getContext()), Type::getInt32Ty(M->getContext()), NULL));
    Function *func_inc2 = dyn_cast<Function> (M->getOrInsertFunction("inc_path_reg", Type::getVoidTy(M->getContext()),
                                              Type::getInt32Ty(M->getContext()), Type::getInt32Ty(M->getContext()), NULL));

    /******************************************************/
    /* Insert Instrumentation to call the runtime library */
    /******************************************************/

    /******Init Path*******/
    APInt jj1(32, loopIdmap[loop->getHeader()->getName()]);
    Value *init_arg_values[] = {Constant::getIntegerValue(Type::getInt32Ty(M->getContext()), jj1)};
    const Twine NameStr="";
    CallInst *call_init = CallInst::Create(func_init, init_arg_values, NameStr);
    call_init->insertBefore(loop->getHeader()->getFirstNonPHI());

    /******Finalize Path******/
    APInt jj2(32, loopIdmap[loop->getHeader()->getName()]);
    Value *init_arg_values_f[] = {Constant::getIntegerValue(Type::getInt32Ty(M->getContext()), jj2)};
    CallInst *call_final = CallInst::Create(func_final, init_arg_values_f, NameStr);
    auto* latch = loop->getLoopLatch();
	  call_final->insertBefore(latch->getTerminator());

    for(auto it = Loop_BBList.begin(); it!=Loop_BBList.end(); ++it) {
      /*if((((*it)->getName()).compare(loop->getHeader()->getName())) && 
        (((*it)->getName()).compare(loop->getLoopLatch()->getName()))) {
        continue;
      }*/
      string currBB = (*it)->getName();
      //printf(" %s ->", currBB.c_str());
      auto it_fwd = fwd_map.find(currBB);
      if(it_fwd == fwd_map.end()) {
        //errs() << "ERROS BB not found " << currBB << "\n";
      }
      else {
        TerminatorInst *TInst = (*it)->getTerminator();  
        for (unsigned I = 0, NSucc = TInst->getNumSuccessors(); I < NSucc; ++I) {
          BasicBlock *Succ = TInst->getSuccessor(I);

          /*FIXME*/
          /*Find the value of edge going from this BB to exit*/
          if(!loop->contains(Succ)) {
            auto fit = fwd_map.find((*it)->getName());
            for(auto it4 = fit->second.begin(); it4 != fit->second.end(); ++it4) {
              string bb3 = (*it4).first;
              if(bb3.compare("Exit")==0) {

                APInt jj33(32, (*it4).second);
                //errs() << " herwe " << (*it4).second << "   " << bb3 << "\n";
                APInt jj44(32, loopIdmap[loop->getHeader()->getName()]);
                Value *init_arg_values_jr[] = {Constant::getIntegerValue(Type::getInt32Ty(M->getContext()), jj44),
                                               Constant::getIntegerValue(Type::getInt32Ty(M->getContext()), jj33)};
                CallInst *call_inc2 = CallInst::Create(func_inc2, init_arg_values_jr, NameStr);
                call_inc2->insertBefore((Succ)->getFirstNonPHI());

                APInt jj2f(32, loopIdmap[loop->getHeader()->getName()]);
                Value *init_arg_values_ff[] = {Constant::getIntegerValue(Type::getInt32Ty(M->getContext()), jj2f)};
                CallInst *call_final2 = CallInst::Create(func_final2, init_arg_values_ff, NameStr);
                call_final2->insertAfter((Succ)->getFirstNonPHI());
              }
            }
          }
          /*END FIXME*/

          string childBB = Succ->getName();
          for(auto itt = it_fwd->second.begin(); itt != it_fwd->second.end(); ++itt) {
            string bb = (*itt).first;
            if(childBB.compare(bb)==0) {
              unsigned int path = (*itt).second;
              APInt jj3(32, path);
              APInt jj4(32, loopIdmap[loop->getHeader()->getName()]); 
              //errs() << " Parent BB " <<currBB<<"  ChilBB and Num "<<bb<<"   "<<path<<"\n";
              Value *init_arg_values_j[] = {Constant::getIntegerValue(Type::getInt32Ty(M->getContext()), jj4), 
                                            Constant::getIntegerValue(Type::getInt32Ty(M->getContext()), jj3)};
              CallInst *call_inc = CallInst::Create(func_inc, init_arg_values_j, NameStr);
              //call_inc->insertBefore((*it)->getTerminator());
              call_inc->insertBefore(Succ->getFirstNonPHI());  
            }
          }
        }
      }
    }
 
    /******************************************************/
    /**************END Instrumentation Code****************/ 
    /******************************************************/ 

    auto* func = loop->getLoopLatch()->getParent();
    
    //BasicBlock* Exit;
    //auto* Exit = BasicBlock::Create(M->getContext(), "Exit", func, nullptr);
    //auto* Exit = SplitEdge(latch, loop->getHeader(), dt, li);
    //Exit->setName("Exit");
  
    //errs() <<"------- Terminators --------\n";
    /*TerminatorInst *TInst = loop->getHeader()->getTerminator();
    for (unsigned I = 0, NSucc = TInst->getNumSuccessors(); I < NSucc; ++I) {
      BasicBlock *Succ = TInst->getSuccessor(I);
      //Succ->dump();
      //errs() << " here33 " <<loop->contains(Succ);
      if(!(loop->contains(Succ))) {
        TInst->setSuccessor(I,  Exit );
      }
    }*/
    
    /*errs() <<"------fdfdfdf---------\n";  

    const TerminatorInst *TInst1 = loop->getHeader()->getTerminator();  
    for (unsigned I = 0, NSucc = TInst1->getNumSuccessors(); I < NSucc; ++I) {
      BasicBlock *Succ = TInst1->getSuccessor(I);
      errs() << Succ->getName() << "  ";
      //errs() << " here33 " <<loop->contains(Succ);
    }*/

    auto num_Blocks = loop->getNumBlocks();
    //auto* succ = Exit->getSingleSuccessor();
    //auto* pred = Exit->getSinglePredecessor();
    
    //errs() << " NumBlocks " << num_Blocks <<"\n";
    //errs() << " BackEdges into header " << loop->getNumBackEdges() <<"\n";
    //errs() << " Basic Block List \n";
    for(auto it = Loop_BBList.begin(); it!=Loop_BBList.end(); ++it) {
      (*it)->dump();
      errs()<<" ------ \n";
    }
    //auto* Exit = BasicBlock::Create(M->getContext(), "Exit", func, nullptr);
    //pseudo_exitBB->moveAfter(loop->getLoopLatch());    
  
    /*errs() << " Innermost Loop ";
    loop->dump();
    errs() << "\n";*/
  }
	//DomTreeNode *node = domTree.getNode(loop->getHeader());
	//FunctionType *FunTy = FunctionType::get(Type::getVoidTy(M->getContext()), 
  //                                        Type::getInt32Ty(M->getContext()), NULL);
	//FunctionType *FunTy = FunctionType::get(Type::getVoidTy(Context), 
  //                                        Type::getInt32Ty(Context), NULL);
	// Function *Function = dyn_cast<Function> ( MP->getOrInsertFunction(...) );
  //ModuleProvider *MP = NULL;
  //Function *Function = dyn_cast<Function>(M->getOrInsertFunction(
  //to MP = loop->getParent() 
  //auto* lid = loop->getLoopID();
  /* if(func == NULL)
    errs() <<" Hereee " << lid << "\n";
  APInt jj1(32, 4);
	Value *init_arg_values[] = {Constant::getIntegerValue(Type::getInt32Ty(M->getContext()), jj1)};
  const Twine NameStr="";
  //if(depth == 2) {
    call->insertBefore(loop->getHeader()->getFirstNonPHI());
  //}

  */
  return false;
}

void InstrumentPass::getAnalysisUsage(AnalysisUsage &AU) const
{
	AU.addRequired<LoopInfoWrapperPass>();
  AU.addRequired<DominatorTreeWrapperPass>();
	AU.addRequiredTransitive<DominatorTreeWrapperPass>();
	AU.setPreservesCFG();
}

char InstrumentPass::ID = 0;
static RegisterPass<InstrumentPass> X("epp", "Efficient Path Profiling Instrument Pass.");
