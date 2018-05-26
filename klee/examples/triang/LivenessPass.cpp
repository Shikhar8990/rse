#include "LivenessPass.h"

bool LivenessPass::runOnFunction(Function &F) {

  unordered_map<string, int> bblock2Id;
  unordered_map<int, string> Id2bblock;
  int bbCount = 0;


  std::string fileName = "mapFile";
  errs() << "Output to: " << fileName << "\n";
  std::string ErrSt;
  raw_fd_ostream outFile(fileName.c_str(), ErrSt, llvm::sys::fs::OpenFlags::F_Append);
 
  Module *M = F.getParent();
  for (Function::iterator i = F.begin(), e = F.end(); i != e; ++i) {
    bblock2Id[i->getName()] = bbCount;
    Id2bblock[bbCount] = i->getName();
    bbCount++;
  }

  /*for(auto it = bblock2Id.begin(); it != bblock2Id.end(); ++it) {
    errs()<<"Name: "<<it->first<<" Id: "<<it->second<<"\n";
  }*/
  outFile<<"Func "<<F.getName()<<"\n";
  errs()<<"Size: "<<Id2bblock.size()<<"\n";
  for(int x = 0; x < Id2bblock.size(); x++) {
    errs()<<x<<" "<<Id2bblock[x]<<"\n";
    outFile<<x<<" "<<Id2bblock[x]<<"\n";
  }
  outFile<<"ENDMAP\n";
  errs()<<"-----\n";

  Function *func_inc = dyn_cast<Function> (M->getOrInsertFunction("rec_path", Type::getVoidTy(M->getContext()), Type::getInt32Ty(M->getContext()), NULL));

  for (Function::iterator i = F.begin(), e = F.end(); i != e; ++i) {
    const Twine NameStr="";
    APInt jj(32, bblock2Id[i->getName()]);
    Value *init_arg_values_ff[] = {Constant::getIntegerValue(Type::getInt32Ty(M->getContext()), jj)};
    CallInst *call_rec = CallInst::Create(func_inc, init_arg_values_ff, NameStr);
    auto inst = i->begin();
    call_rec->insertBefore(inst);
  }

  return false;
}

char LivenessPass::ID = 0;
static RegisterPass<LivenessPass> X("path", "BasicBlock Path");
