//
//  main.cpp
//  TheSonOfTreeC++
//
//  Created by chai on 2016/11/18.
//  Copyright © 2016年 chaiyanpu. All rights reserved.

//  Judging whether a binary tree is the son of another
//  判断一个二叉树是否是另一个的子树

#include <iostream>
#include <stack>


///construct of binary tree
struct BinaryTreeNode {
    int value;
    BinaryTreeNode *left;
    BinaryTreeNode *right;
};

bool isHasCommonValue(BinaryTreeNode * first,BinaryTreeNode *second);

//  判断一个二叉树是否是另一个的子树
///Judging whether a binary tree is the son of another
bool getAnswerWith(BinaryTreeNode * first,BinaryTreeNode * second){
    //遍历first二叉树，找到first节点与second根节点值相同的节点
    //这里运用压栈的方式遍历二叉树
    std::stack<BinaryTreeNode *> myStack;
    BinaryTreeNode * tree = first;
    bool answer = false;
    while (myStack.size() != 0 || tree != NULL) {
        if (tree != NULL){
            myStack.push(tree);
            if (tree->value == second->value){
                answer = isHasCommonValue(tree, second);
            }
            tree = tree->left;
        }else{
            tree = myStack.top()->right;
            myStack.pop();
        }
    }
    return answer;
}

bool isHasCommonValue(BinaryTreeNode * first,BinaryTreeNode *second){
    if (second == NULL){ return true;}
    if (first == NULL) { return false;}
    if (second->value != first->value){ return false;}
    return (isHasCommonValue(first->left, second->left) && (isHasCommonValue(first->right, second->right)));
}











int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
