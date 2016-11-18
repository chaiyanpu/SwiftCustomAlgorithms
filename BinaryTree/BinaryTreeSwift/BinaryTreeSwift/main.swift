//
//  main.swift
//  BinaryTreeSwift
//
//  Created by chai on 16/11/4.
//  Copyright © 2016年 ourgame. All rights reserved.
//
///build tree with preorder and inorder  根据前序和中序创建二叉树


import Foundation

enum InputError:Error{
    case error(String)
    case wtf
}

///the tree of node    树的节点
class BinaryTreeNode<T>{
    var value:T?
    var left:BinaryTreeNode?
    var right:BinaryTreeNode?
    init(_ value:T) {
        self.value = value;
        self.left = nil
        self.right = nil
    }
 }

//MARK: build tree with preorder and inorder  根据前序和中序创建二叉树
let preorder = [1,2,4,7,3,5,6,8]
let inorder = [4,7,2,1,5,3,8,6]
print("根据前序和中序创建二叉树")
do {
    let root = try buildBinaryTree(preorder, inorder: inorder)
    print("%d------",root?.left?.value ?? 0);
    print("%d------",root?.left?.left?.value);
    print("%d------",root?.left?.left?.right?.value);
    
}catch{
    print(error)
}

//MARK:二叉树的前序遍历
print("二叉树的前序遍历")
let tree = BinaryTreeNode(1)
tree.left = BinaryTreeNode(2)
tree.left?.left = BinaryTreeNode(3)
tree.left?.left?.left = BinaryTreeNode(4)
tree.left?.left?.right = BinaryTreeNode(5)
tree.left?.right = BinaryTreeNode(6)
tree.left?.right?.left = BinaryTreeNode(7)
tree.left?.right?.right = BinaryTreeNode(8)
tree.right = BinaryTreeNode(9)
tree.right?.left = BinaryTreeNode(10)
tree.right?.right = BinaryTreeNode(11)
do {
    try preorderBinary(tree: tree)
}catch{
    print(error)
}







