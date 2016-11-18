//
//  main.swift
//  TheSonOfTreeSwift
//
//  Created by chai on 2016/11/18.
//  Copyright © 2016年 chaiyanpu. All rights reserved.
//
//  Judging whether a binary tree is the son of another,Swift
//  判断一个二叉树是否是另一个的子树,Swift


import Foundation

print("Hello, World!")

///construct of binary tree
class BinaryTree<T:Equatable> {
    var value:T
    var left:BinaryTree?
    var right:BinaryTree?
    init(_ value:T) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
}
extension BinaryTree where T:Equatable {
    
    static func ==(lhs: BinaryTree<T>, rhs: BinaryTree<T>) -> Bool{
        if lhs.value != rhs.value{
            return false
        }
        return (isNil(lhs:lhs.left,rhs:rhs.left) && isNil(lhs:lhs.right,rhs:rhs.right))
        //(lhs.left == rhs.left) && (lhs.right == rhs.right)
    }
    
    static func isNil(lhs:BinaryTree<T>?,rhs:BinaryTree<T>?) -> Bool{
        if rhs == nil {
            return true
        }
        if lhs == nil {
            return false
        }
        return rhs! == lhs!
    }

}
//  判断一个二叉树是否是另一个的子树
///Judging whether a binary tree is the son of another
func getAnswerWith(_ first:BinaryTree<Int>,second:BinaryTree<Int>?) -> Bool{
    
    if second == nil {
        return true
    }
    
    let stack:Stack<BinaryTree<Int>> = Stack()
    var answer:Bool = false
    var tree:BinaryTree<Int>? = first
    while !stack.isEmpty() || tree != nil  {
        if let aTree = tree {
            stack.push(value: aTree)
            if aTree.value == second!.value{
                answer = (aTree == second!)
            }
            tree = aTree.left
        }else{
            tree = stack.top()?.right
            stack.pop()
        }
    }
    
    return answer
}
//创建第一个二叉树
let tree1 = BinaryTree(1)
tree1.left = BinaryTree(2)
tree1.left?.left = BinaryTree(3)
tree1.left?.left?.left = BinaryTree(4)
tree1.left?.left?.right = BinaryTree(5)
tree1.left?.right = BinaryTree(6)
tree1.left?.right?.left = BinaryTree(7)
tree1.left?.right?.right = BinaryTree(8)
tree1.right = BinaryTree(9)
tree1.right?.left = BinaryTree(10)
tree1.right?.right = BinaryTree(11)
//创建第二个二叉树
let tree2 = BinaryTree(1)
tree2.left = BinaryTree(2)
tree2.left?.left = BinaryTree(3)
tree2.left?.left?.left = BinaryTree(4)
tree2.left?.left?.right = BinaryTree(5)
tree2.left?.right = BinaryTree(6)
tree2.left?.right?.left = BinaryTree(7)
tree2.left?.right?.right = BinaryTree(8)
tree2.right = BinaryTree(9)
tree2.right?.left = BinaryTree(10)
tree2.right?.right = BinaryTree(11)

//第三个
let tree3 = BinaryTree(3)
tree3.left = BinaryTree(4)
tree3.right = BinaryTree(5)


let tree4 = BinaryTree(3)
tree4.left = BinaryTree(4)
tree4.right = BinaryTree(6)

let tree5 = BinaryTree(5)

let tree6:BinaryTree<Int>? = nil

print(getAnswerWith(tree1, second: tree2))
print(getAnswerWith(tree1, second: tree3))
print(getAnswerWith(tree1, second: tree4))
print(getAnswerWith(tree1, second: tree5))
print(getAnswerWith(tree1, second: tree6))

