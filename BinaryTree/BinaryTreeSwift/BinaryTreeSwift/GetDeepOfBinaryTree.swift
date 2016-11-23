//
//  GetDeepOfBinaryTree.swift
//  BinaryTreeSwift
//
//  Created by chai on 2016/11/23.
//  Copyright © 2016年 ourgame. All rights reserved.
//

import Foundation

func getDeep(_ tree:BinaryTreeNode<Int>?) -> Int{
    if tree == nil{
        return 0
    }
    return max(getDeep(tree?.left) + 1, getDeep(tree?.right) + 1)
}


