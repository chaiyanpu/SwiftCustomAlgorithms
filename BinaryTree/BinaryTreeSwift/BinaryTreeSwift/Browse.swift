//
//  File.swift
//  BinaryTreeSwift
//
//  Created by chai on 16/11/6.
//  Copyright © 2016年 ourgame. All rights reserved.
//

import Foundation

///前序遍历二叉树
func preorderBinary(tree:BinaryTreeNode<Int>?) throws {   //栈的运用
    if tree == nil {
        throw InputError.error("error")  //error
    }
    let stack:Stack<BinaryTreeNode<Int>> = Stack()
    var node = tree;
    while !(stack.isEmpty()) || node != nil {
        if let _ = node {
            stack.push(value: node!)
            print(node!.value)
            node = node!.left
        }else{
            node = stack.top()?.right
            _ = stack.pop()
        }
    }
}



