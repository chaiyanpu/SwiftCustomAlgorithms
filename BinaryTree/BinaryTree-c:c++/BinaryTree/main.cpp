//
//  main.cpp
//  BinaryTree
//
//  Created by chai on 16/11/4.
//  Copyright © 2016年 ourgame. All rights reserved.
//

#include <iostream>
#include <exception>
#include <stack>
//using namespace std;

///二叉树的结构
struct BinaryTreenode{
    int value;
    BinaryTreenode *pLeft = NULL;
    BinaryTreenode *pRight = NULL;
};

BinaryTreenode * buildBinaryTreenodeFunc(
                                         int * startPreorder,
                                         int * endPreorder,
                                         int * startInorder,
                                         int * endInorder );

///根据前序遍历和中序便利重建二叉树
BinaryTreenode * buildBinaryTreenode(int * preorder,int * inorder,int length){
    
    if (preorder == NULL || inorder == NULL || length < 0){
        return NULL;
    }
    
    return buildBinaryTreenodeFunc(preorder,
                                   preorder + length - 1,
                                   inorder,
                                   inorder + length - 1);
}

BinaryTreenode * buildBinaryTreenodeFunc(
                                         int * startPreorder,
                                         int * endPreorder,
                                         int * startInorder,
                                         int * endInorder ){
    int rootValue = startPreorder[0];//根节点值
    BinaryTreenode * root = new BinaryTreenode();
    root->value = rootValue;
    
    if (startPreorder == endInorder){  //只有根节点
        if (* startPreorder == * endInorder){
            return  root;
        }else{
            throw 0; //error
        }
    }
    
    //在中序遍历中找到根节点的值
    int * rootInorder = startInorder;
    while (rootInorder <= endInorder && *rootInorder != rootValue) {
        rootInorder ++;
    }
    
    if (rootInorder == endInorder && *rootInorder != rootValue){
        
    }
    
    int length = (int)(rootInorder - startInorder);
    
    if (length > 0){
        //构建左子树
        root->pLeft = buildBinaryTreenodeFunc(startPreorder + 1,
                                              startPreorder + length,
                                              startInorder,
                                              startInorder + length - 1);
    }
    if (length < endInorder - startInorder){
        //构建右子树
        root->pRight = buildBinaryTreenodeFunc(startPreorder + length + 1,
                                               endPreorder,
                                               startInorder + length + 1,
                                               endInorder);//这个的范围应该是一样的
    }
    
    return root;
}

//MARK:前序遍历二叉树
///前序遍历二叉树
void preorderBinaryTree(BinaryTreenode * tree){
    
    BinaryTreenode * node = tree;
    std::stack<BinaryTreenode *> aStack;

    while (aStack.size() > 0 || node != NULL) {
        if (node != NULL){
            printf("%d",node->value);
            aStack.push(node);
            node = node->pLeft;
        }else{
            node = (aStack.top())->pRight;
            aStack.pop();
        }
    }

}


int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    int length = 8;
    int preorder[8] = {1,2,4,7,3,5,6,8};
    int inorder[8] = {4,7,2,1,5,3,8,6};
    BinaryTreenode * binaryTreenode = buildBinaryTreenode(preorder, inorder, length);
    
    printf("%d------",binaryTreenode->pLeft->value);
    printf("%d------",binaryTreenode->pLeft->pLeft->value);
    printf("%d------",binaryTreenode->pLeft->pLeft->pRight->value);
    
    
    //前序遍历二叉树
    preorderBinaryTree(binaryTreenode);
    
    
    return 0;
}


