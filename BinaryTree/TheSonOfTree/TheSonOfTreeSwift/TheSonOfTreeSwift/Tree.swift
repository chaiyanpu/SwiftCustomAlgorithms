//
//  Tree.swift
//  TheSonOfTreeSwift
//
//  Created by chai on 2016/11/19.
//  Copyright © 2016年 chaiyanpu. All rights reserved.
//

import Foundation

///construct of binary tree
class BinaryTreeNode<T> {
    var value:T
    var left:BinaryTreeNode?
    var right:BinaryTreeNode?
    init(_ value:T) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}
