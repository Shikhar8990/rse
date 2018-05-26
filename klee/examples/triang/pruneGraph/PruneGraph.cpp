#include "PruneGraph.h"


// A Binary Tree Node
struct Node
{
    struct Node *left, *right;
    int key;
};

// Utility function to create a new tree Node
Node* newNode(int key)
{
    Node *temp = new Node;
    temp->key = key;
    temp->left = temp->right = NULL;
    return temp;
}

Node* findInGraph(Node* root, int value) {
  if(root != NULL) {
    if (root->key == value) {
      return root; 
    }
  }
  return findInGraph(root->left, value);
  return findInGraph(root->right, value);
}

bool PruneGraph::runOnFunction(Function &F) {
  
  string fname = F.getName();
  string mainf = "main";
  unordered_map<string, int> bblock2Id;
  unordered_map<int, string> Id2bblock;
  Module *M = F.getParent();

  //only look at non main functions
  if(strcmp(fname.c_str(),mainf.c_str()) != 0) {

    unordered_map<string, int> bblock2Id;
    unordered_map<int, string> Id2bblock;
    int bbCount = 0;
  
    //here giving a numerical id to each basic block
    for (Function::iterator i = F.begin(), e = F.end(); i != e; ++i) {
      bblock2Id[i->getName()] = bbCount;
      Id2bblock[bbCount] = i->getName();
      bbCount++;
    }

    //dummy code to read a file
    std::string fileName = "pathFile";
    OwningPtr<MemoryBuffer> Buf; 
    MemoryBuffer::getFileOrSTDIN(fileName, Buf);
    MemoryBuffer *file = Buf.take();
    std::string data = file->getBuffer();
    errs() << data;

  	//Making the tree here
    //First Creating a node for the first instruction in the basic block
    auto firstBBRef = LLVMGetFirstBasicBlock(wrap(&F));
    auto firstBBP = dyn_cast<BasicBlock>(unwrap(firstBBRef));
    errs()<<"First Basic Block: "<<firstBBP->getName()<<"\n";
    //Node * root = newNode(bblock2Id[firstBBP->getName()]);

		for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
  		errs() << "Basicblock " << bb->getName() << "\n";
      //creat a node for each basic block
      Node* newBlock = newNode(bblock2Id[bb->getName()]); 
      auto lastI = LLVMGetLastInstruction(wrap(bb));
      auto lastInst = unwrap(lastI);
      auto instP = dyn_cast<Instruction>(lastInst);
      errs()<<*lastInst<<"  "<<instP->isTerminator()<<"\n";
      const TerminatorInst *curr_term = bb->getTerminator();
      errs()<<"Terminators \n";
      for (unsigned I = 0, NSucc = curr_term->getNumSuccessors(); I < NSucc; ++I) {
        BasicBlock *Succ = curr_term->getSuccessor(I);
        errs()<<Succ->getName()<<"\n";
        if (bblock2Id[Succ->getName()]>0) {
          errs()<<"Found \n";
        } else {
          errs()<<"!!!Not!!! \n";
        }
      }
    }
 
  }
  return false;
}

char PruneGraph::ID = 0;
static RegisterPass<PruneGraph> X("prune", "pruneGraph");
