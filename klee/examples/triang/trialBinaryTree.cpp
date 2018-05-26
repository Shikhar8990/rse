/* Program to find distance between n1 and n2 using 
   one traversal */
#include <iostream>
#include <deque>
using namespace std;
 
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
 
// Returns level of key k if it is present in tree, 
// otherwise returns -1
int findLevel(Node *root, int k, int level) {
  // Base Case
  if (root == NULL)
    return -1;
	//cout<<"Searching Node: "<<root->key<<endl;
  // If key is present at root, or in left subtree
  // or right subtree, return true;
  if (root->key == k)
    return level;

  int l = findLevel(root->left, k, level+1);
  return (l != -1)? l : findLevel(root->right, k, level+1);
}
 
// This function returns pointer to LCA of two given
// values n1 and n2. It also sets d1, d2 and dist if 
// one key is not ancestor of other
// d1 --> To store distance of n1 from root
// d2 --> To store distance of n2 from root
// lvl --> Level (or distance from root) of current node
// dist --> To store distance between n1 and n2
Node *findDistUtil(Node* root, int n1, int n2, int &d1, 
                            int &d2, int &dist, int lvl) {
    // Base case
    if (root == NULL) return NULL;
 
    // If either n1 or n2 matches with root's key, report
    // the presence by returning root (Note that if a key is
    // ancestor of other, then the ancestor key becomes LCA
		//cout<<"Calling Node "<<root->key<<endl;
    if (root->key == n1)
    {
         d1 = lvl;
		     //cout<<"Return1 Node "<<root->key<<endl;
         return root;
    }
    if (root->key == n2)
    {
         d2 = lvl;
		     //cout<<"Return2 Node "<<root->key<<endl;
         return root;
    }
 
    // Look for n1 and n2 in left and right subtrees
    Node *left_lca  = findDistUtil(root->left, n1, n2, 
                                   d1, d2, dist, lvl+1);
    Node *right_lca = findDistUtil(root->right, n1, n2,
                                   d1, d2, dist, lvl+1);
 
    // If both of the above calls return Non-NULL, then
    // one key is present in once subtree and other is 
    // present in other. So this node is the LCA
    if (left_lca && right_lca)
    {
        dist = d1 + d2 - 2*lvl;
		    //cout<<"Return3 Node "<<root->key<<endl;
        return root;
    }
 
    // Otherwise check if left subtree or right subtree 
    // is LCA
    Node *ff =  (left_lca != NULL)? left_lca: right_lca;
    if (root != NULL)
      //cout<<"Return4 Node "<<root->key<<endl;
    return ff;
} 

int printPath(Node *lca, int n1) {
  int inPath=0;
  if(lca!=NULL) {
    inPath = printPath(lca->left, n1);
    if (inPath==1) {
      //cout<<"Path: "<<lca->key<<endl;
      return 1;
    }
    inPath = printPath(lca->right, n1);
    if (inPath==1) {
      //cout<<"Path: "<<lca->key<<endl;
      return 1;
    }
  }
  if(lca!=NULL) {
    if(lca->key == n1) {
      //cout<<"Path: "<<n1<<endl;
      return 1;
    }
    else {
      return 0;
    }
  }
}

int printPathNew(Node *lca, int n1, int& found, deque<int>& trace) {
  int inPath=0;
  if(lca!=NULL) {
    inPath = printPathNew(lca->left, n1, found, trace);
    if (inPath==1) {
      cout<<"Path: "<<lca->key<<endl;
      trace.push_front(lca->key);
      return 1;
    }
    inPath = printPathNew(lca->right, n1, found, trace);
    if (inPath==1) {
      cout<<"Path: "<<lca->key<<endl;
      trace.push_front(lca->key);
      return 1;
    }
  }
  if(lca!=NULL) {
    if(lca->key == n1) {
      cout<<"Path: "<<n1<<endl;
      trace.push_front(n1);
      found = 1;
      return 1;
    }
    else {
      return 0;
    }
  }
}

void printTrace(deque<int>& trace) {
  for(auto itt = trace.begin(); itt != trace.end(); ++itt)
    cout<<*itt<<" ";
  cout<<endl;
}

bool findInTrace(deque<int>& trace, int key) {

  for(auto it = trace.begin(); it != trace.end(); ++it) {
    if(key==*it) {
      return true;
    }
  }
  return false;
}

void genrateSubgraph(Node *lca, deque<int>& ltrace, deque<int>& rtrace) {
  if(lca!=NULL) {
    cout<<"SubNode: "<<lca->key<<endl;
    bool lfound = findInTrace(ltrace,lca->key);
    bool rfound = findInTrace(rtrace,lca->key);
    
    if(lfound) {
      bool leftChildInTrace = false;
      if((lca->left)!=NULL) {
        leftChildInTrace = findInTrace(ltrace, (lca->left)->key);
      } else {
        leftChildInTrace = false;
      }
      bool rightChildInTrace = false;
      if((lca->right)!=NULL) {
        rightChildInTrace = findInTrace(ltrace, (lca->right)->key);
      } else {
        rightChildInTrace = false;
      }
      if(leftChildInTrace) {
        cout<<"left child in left trace"<<endl;
        if(lca->left!=NULL) genrateSubgraph(lca->left, ltrace, rtrace);
        if(lca->right!=NULL) genrateSubgraph(lca->right, ltrace, rtrace);
      }
      else if(rightChildInTrace) {
        cout<<"right child in left trace"<<endl;
        if(lca->right!=NULL) genrateSubgraph(lca->right, ltrace, rtrace);
      }
    } else if(rfound) {
      bool leftChildInTrace = false;
      if((lca->left)!=NULL) {
          leftChildInTrace = findInTrace(rtrace, (lca->left)->key);
      } else {
          leftChildInTrace = false;
      }
      bool rightChildInTrace = false;
      if((lca->right)!=NULL) {
          rightChildInTrace = findInTrace(rtrace, (lca->right)->key);
      } else {
          rightChildInTrace = false;
      }
      if(leftChildInTrace) {
        cout<<"left child in right trace"<<endl;
        if(lca->left!=NULL) genrateSubgraph(lca->left, ltrace, rtrace);
      }
      else if(rightChildInTrace) {
        cout<<"right child in right trace"<<endl;
        if(lca->left!=NULL) genrateSubgraph(lca->left, ltrace, rtrace);
        if(lca->right!=NULL) genrateSubgraph(lca->right, ltrace, rtrace);
      }
    } else {
      cout<<"no child in no trace"<<endl;
      if(lca->left!=NULL) genrateSubgraph(lca->left, ltrace, rtrace);
      if(lca->right!=NULL) genrateSubgraph(lca->right, ltrace, rtrace);
    }
  }
} 

// The main function that returns distance between n1
// and n2. This function returns -1 if either n1 or n2
// is not present in Binary Tree.
int findDistance(Node *root, int n1, int n2)
{
    // Initialize d1 (distance of n1 from root), d2 
    // (distance of n2 from root) and dist(distance 
    // between n1 and n2)
    int d1 = -1, d2 = -1, dist;
    Node *lca = findDistUtil(root, n1, n2, d1, d2,
                                          dist, 1);
 
    cout<<"LCA: "<<lca->key<<endl;
    printPath(lca, n1);
    printPath(lca, n2);
    cout<<"New way to do it"<<endl;
    int found=0;
    deque<int> trace_left;
    deque<int> trace_right;
    printPathNew(lca->left, n1, found, trace_left);
    if(found==1) {
      cout<<"Found key in the left graph "<<n1<<endl;
      printTrace(trace_left);
    }
    found = 0;
    printPathNew(lca->right, n1, found, trace_right);
    if(found==1) {
      cout<<"Found key in the right graph "<<n1<<endl;
      printTrace(trace_right);
    }

    found = 0;
    printPathNew(lca->left, n2, found, trace_left);
    if(found==1) {
      cout<<"Found key in the left graph "<<n2<<endl;
      printTrace(trace_left);
    }
    found = 0;
    printPathNew(lca->right, n2, found, trace_right);
    if(found==1) {
      cout<<"Found key in the right graph "<<n2<<endl;
      printTrace(trace_right);
    }

    genrateSubgraph(lca, trace_left, trace_right);

    // If both n1 and n2 were present in Binary 
    // Tree, return dist
    if (d1 != -1 && d2 != -1)
        return dist;
 
    // If n1 is ancestor of n2, consider n1 as root 
    // and find level of n2 in subtree rooted with n1
    if (d1 != -1)
    {
        dist = findLevel(lca, n2, 0);
        return dist;
    }
 
    // If n2 is ancestor of n1, consider n2 as root 
    // and find level of n1 in subtree rooted with n2
    if (d2 != -1)
    {
        dist = findLevel(lca, n1, 0);
        return dist;
    }
 
    return -1;
}
 
// Driver program to test above functions
int main()
{
    // Let us create binary tree given in the
    // above example
    Node * root = newNode(1);
    root->left = newNode(2);
    root->right = newNode(3);
    root->left->left = newNode(4);
    root->left->right = newNode(5);
    root->right->left = newNode(6);
    root->right->right = newNode(7);
    root->right->left->right = newNode(8);
		cout << "Dist(4, 7) = " << findDistance(root, 4, 7)<<endl;
		cout<<"Done \n";
    return 0;
}
