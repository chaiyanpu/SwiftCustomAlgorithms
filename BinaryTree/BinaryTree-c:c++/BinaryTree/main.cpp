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
struct BinaryTreeNode{
    int value;
    BinaryTreeNode *left = NULL;
    BinaryTreeNode *right = NULL;
};

BinaryTreeNode * buildBinaryTreeNodeFunc(
                                         int * startPreorder,
                                         int * endPreorder,
                                         int * startInorder,
                                         int * endInorder );

///根据前序遍历和中序便利重建二叉树
BinaryTreeNode * buildBinaryTreeNode(int * preorder,int * inorder,int length){
    
    if (preorder == NULL || inorder == NULL || length < 0){
        return NULL;
    }
    
    return buildBinaryTreeNodeFunc(preorder,
                                   preorder + length - 1,
                                   inorder,
                                   inorder + length - 1);
}

BinaryTreeNode * buildBinaryTreeNodeFunc(
                                         int * startPreorder,
                                         int * endPreorder,
                                         int * startInorder,
                                         int * endInorder ){
    int rootValue = startPreorder[0];//根节点值
    BinaryTreeNode * root = new BinaryTreeNode();
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
        root->left = buildBinaryTreeNodeFunc(startPreorder + 1,
                                              startPreorder + length,
                                              startInorder,
                                              startInorder + length - 1);
    }
    if (length < endInorder - startInorder){
        //构建右子树
        root->right = buildBinaryTreeNodeFunc(startPreorder + length + 1,
                                               endPreorder,
                                               startInorder + length + 1,
                                               endInorder);//这个的范围应该是一样的
    }
    
    return root;
}

//MARK:前序遍历二叉树
///前序遍历二叉树
void preorderBinaryTree(BinaryTreeNode * tree){
    
    BinaryTreeNode * node = tree;
    std::stack<BinaryTreeNode *> aStack;

    while (aStack.size() > 0 || node != NULL) {
        if (node != NULL){
            printf("%d",node->value);
            aStack.push(node);
            node = node->left;
        }else{
            node = (aStack.top())->right;
            aStack.pop();
        }
    }
}

/// get deep length of a binary tree.
int getDeepWithABinaryTree(BinaryTreeNode * tree){
    if (tree == NULL){
        return  0;
    }
    int leftLen = getDeepWithABinaryTree(tree->left);
    int rightLen = getDeepWithABinaryTree(tree->right);
    return leftLen > rightLen ? leftLen + 1 : rightLen + 1;
}

/// Judging whether a binary tree is blance binary tree. 思路：后序遍历,使用递归
bool isBalanced(BinaryTreeNode *head,int * deepLength);
bool judgeBlanceBinaryTree(BinaryTreeNode * head){
    
    int deepLength = 0;
    return isBalanced(head,&deepLength);

}
bool isBalanced(BinaryTreeNode *head,int * deepLength){
    
    if (head == NULL){
        *deepLength = 0;
        return  true;
    }
    
    int left,right;
    if (isBalanced(head->left, &left) && isBalanced(head->right, &right)){
        int i = abs(left - right);
        if (i <= 1){
            *deepLength = 1 + (left > right ? left : right);//深度++
            return true;
        }else{
            return false;
        }
    }
    return false;
}


int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    int length = 8;
    int preorder[8] = {1,2,4,7,3,5,6,8};
    int inorder[8] = {4,7,2,1,5,3,8,6};
    printf("build binary tree\n");
    BinaryTreeNode * binaryTreeNode = buildBinaryTreeNode(preorder, inorder, length);
    
    printf("%d------",binaryTreeNode->left->value);
    printf("%d------",binaryTreeNode->left->left->value);
    printf("%d------\n",binaryTreeNode->left->left->right->value);
    printf("\n");
    //前序遍历二叉树
    printf("preorder binary tree:\n");
    preorderBinaryTree(binaryTreeNode);
     printf("\n");printf("\n");
    //得到二叉树的深度
    printf("the deep of binary tree is %d\n",getDeepWithABinaryTree(binaryTreeNode));
    
    //判断二叉树是不是平衡二叉树
    printf("printf 1 is a blance binary tree,0 not: %d\n",judgeBlanceBinaryTree(binaryTreeNode));
    
    
    return 0;
}


