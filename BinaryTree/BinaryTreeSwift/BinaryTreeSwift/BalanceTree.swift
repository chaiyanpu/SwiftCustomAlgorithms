//
//  BalanceTree.swift
//  BinaryTreeSwift
//
//  Created by chai on 2016/11/24.
//  Copyright © 2016年 ourgame. All rights reserved.

// Judging whether a binary tree is blance binary tree.

import Foundation

/// 判断一棵树是否是平衡二叉树 思路：后序遍历,使用递归
func judgeBalanceTree(_ head:BinaryTreeNode<Int>) -> Bool{
    
    var i = 0;
    return isBalance(head,&i)
}
func isBalance(_ head:BinaryTreeNode<Int>?,_ deep:inout Int) -> Bool {
    
    guard head != nil else{ deep = 0; return true}
    
    var i = 0;
    var j = 0;
    if (isBalance(head?.left, &i) && isBalance(head?.right, &j)){
        if abs(i - j) <= 1{
            deep = 1 + (i > j ? i : j)
            return true
        }
    }
    return false
}
