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
//  判断一个二叉树是否是另一个的子树
///Judging whether a binary tree is the son of another
func getAnswerWithSwift(_ first:BinaryTreeNode<Int>,second:BinaryTreeNode<Int>?) -> Bool{
    
    if second == nil {
        return true
    }
    
    let stack:Stack<BinaryTreeNode<Int>> = Stack()
    var answer:Bool = false
    var tree:BinaryTreeNode<Int>? = first
    while !stack.isEmpty() || tree != nil  {
        if let aTree = tree {
            stack.push(value: aTree)
            if aTree.value == second!.value{
                answer = isHasCommonValue(aTree,second)
            }
            tree = aTree.left
        }else{
            tree = stack.top()?.right
            stack.pop()
        }
    }
    
    return answer
}

func isHasCommonValue(_ first:BinaryTreeNode<Int>?,_ second:BinaryTreeNode<Int>?) -> Bool{
    if second == nil{ return true}
    if first == nil { return false}
    if first!.value != second!.value{return false}
    return (isHasCommonValue(first!.left,second!.left) && isHasCommonValue(first!.right,second!.right))
}

//创建第一个二叉树
let tree1 = BinaryTreeNode(1)
tree1.left = BinaryTreeNode(2)
tree1.left?.left = BinaryTreeNode(3)
tree1.left?.left?.left = BinaryTreeNode(4)
tree1.left?.left?.right = BinaryTreeNode(5)
tree1.left?.right = BinaryTreeNode(6)
tree1.left?.right?.left = BinaryTreeNode(7)
tree1.left?.right?.right = BinaryTreeNode(8)
tree1.right = BinaryTreeNode(9)
tree1.right?.left = BinaryTreeNode(10)
tree1.right?.right = BinaryTreeNode(11)
//创建第二个二叉树
let tree2 = BinaryTreeNode(1)
tree2.left = BinaryTreeNode(2)
tree2.left?.left = BinaryTreeNode(3)
tree2.left?.left?.left = BinaryTreeNode(4)
tree2.left?.left?.right = BinaryTreeNode(5)
tree2.left?.right = BinaryTreeNode(6)
tree2.left?.right?.left = BinaryTreeNode(7)
tree2.left?.right?.right = BinaryTreeNode(8)
tree2.right = BinaryTreeNode(9)
tree2.right?.left = BinaryTreeNode(10)
tree2.right?.right = BinaryTreeNode(11)

//第三个
let tree3 = BinaryTreeNode(3)
tree3.left = BinaryTreeNode(4)
tree3.right = BinaryTreeNode(5)


let tree4 = BinaryTreeNode(3)
tree4.left = BinaryTreeNode(4)
tree4.right = BinaryTreeNode(6)

let tree5 = BinaryTreeNode(5)

let tree6:BinaryTreeNode<Int>? = nil

print(getAnswerWithSwift(tree1, second: tree2))
print(getAnswerWithSwift(tree1, second: tree3))
print(getAnswerWithSwift(tree1, second: tree4))
print(getAnswerWithSwift(tree1, second: tree5))
print(getAnswerWithSwift(tree1, second: tree6))

//extension BinaryTreeNode where T:Equatable {
//    static func ==(lhs: BinaryTreeNode<T>, rhs: BinaryTreeNode<T>) -> Bool{
//        if lhs.value != rhs.value{
//            return false
//        }
//        return (isNil(lhs:lhs.left,rhs:rhs.left) && isNil(lhs:lhs.right,rhs:rhs.right))
//    }
//    
//    static func isNil(lhs:BinaryTreeNode<T>?,rhs:BinaryTreeNode<T>?) -> Bool{
//        if rhs == nil {
//            return true
//        }
//        if lhs == nil {
//            return false
//        }
//        return rhs! == lhs!
//    }
//}

////  判断一个二叉树是否是另一个的子树
/////Judging whether a binary tree is the son of another
//func getAnswerWith(_ first:BinaryTreeNode<Int>,second:BinaryTreeNode<Int>?) -> Bool{
//    
//    if second == nil {
//        return true
//    }
//    
//    let stack:Stack<BinaryTreeNode<Int>> = Stack()
//    var answer:Bool = false
//    var tree:BinaryTreeNode<Int>? = first
//    while !stack.isEmpty() || tree != nil  {
//        if let aTree = tree {
//            stack.push(value: aTree)
//            if aTree.value == second!.value{
//                answer = (aTree == second!)
//            }
//            tree = aTree.left
//        }else{
//            tree = stack.top()?.right
//            stack.pop()
//        }
//    }
//    
//    return answer
//}
