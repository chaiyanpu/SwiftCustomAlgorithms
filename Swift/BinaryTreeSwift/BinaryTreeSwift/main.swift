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
    var value:T
    var left:BinaryTreeNode?
    var right:BinaryTreeNode?
    init(_ value:T) {
        self.value = value;
        self.left = nil
        self.right = nil
    }
}

///build tree with preorder and inorder  根据前序和中序创建二叉树
func buildBinaryTree(_ preorder:[Int]?,inorder:[Int]?) throws ->  BinaryTreeNode<Int>?{
    
    if (preorder == nil || inorder == nil || preorder?.count != inorder?.count){
        throw InputError.error("InputError")
    }
    do{
        let root = try buildBinaryTreefunc(preorder!, inorder: inorder!)
        return root
    }catch{
        throw error
    }
    
}
///build tree with preorder and inorder  根据前序和中序创建二叉树
func buildBinaryTreefunc(_ preorder:[Int],inorder:[Int]) throws -> BinaryTreeNode<Int>?{
    
    //寻找root节点
    let rootValue = preorder[0]
    let root = BinaryTreeNode(rootValue)
    
    if preorder.count == 1{
        return root
    }
    
    //在中序遍历中找到根节点
    var n:Int?
    for i in 0 ..< (inorder.count){
        if inorder[i] == rootValue{
            n = i + 1
        }
    }
    if n == nil {
        throw InputError.error("InputError")
    }
    
    let length = n! - 1
    if length > 0{
        //构建左子树   输入定点的数组   
//        ArraySlice   注意preorder[1 ... n! + 1]生成的是这个东西
        let preorder = Array(preorder[1 ... length])
        let inorder = Array(inorder[0 ... length - 1])
        do {
            root.left = try buildBinaryTreefunc(preorder, inorder: inorder)
        }catch{
            throw error
        }
    }
    
    if length < inorder.count - 1{
        //构建右子树
        let array = preorder[length + 1 ... preorder.endIndex - 1]
        let preorder = Array(array)
        let inorder = Array(inorder[length + 1 ... inorder.endIndex - 1])
        do {
            root.right = try buildBinaryTreefunc(preorder, inorder: inorder)
        }catch{
            throw error
        }
    }
    
    return root
    
}

let preorder = [1,2,4,7,3,5,6,8]
let inorder = [4,7,2,1,5,3,8,6]
do {
    let root = try buildBinaryTree(preorder, inorder: inorder)
    print("%d------",root?.left?.value);
    print("%d------",root?.left?.left?.value);
    print("%d------",root?.left?.left?.right?.value);

}catch{
    print(error)
}




