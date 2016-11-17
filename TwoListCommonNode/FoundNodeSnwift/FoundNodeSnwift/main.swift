//
//  main.swift
//  FoundNodeSnwift
//
//  Created by chai on 16/11/17.
//  Copyright © 2016年 chaiyanpu. All rights reserved.

//  Found node from the end of list

import Foundation

print("Hello, World!")

enum MyError:Error {
    case inputError(String)
}

//创建是个节点的链表
///creat list,10 nodes
func creatChainTable() -> ListNode<Int>{
    let listNode = ListNode(0)
    var node = ListNode(1)
    listNode.next = node
    
    for i in 2...9{
        let aNode = ListNode(i)
        node.next = aNode;
        node = node.next!;
    }
    return listNode
}
// the construct of node
//节点的构成
class ListNode<T> {
    var next:ListNode?
    var value:T
    init(_ value:T) {
        self.value = value
        self.next = nil
    }
}

///得到倒数第position个节点
///get node from the end of list
func getNodeFromTheEnd(head:ListNode<Int>,position:UInt) throws -> ListNode<Int>{
    
    if position == 0{
        throw MyError.inputError("position error")
    }
    var first = head
    var second = head
    if position == 1{
        while first.next != nil {
            first = first.next!
        }
        return first
    }
    
    for _ in 0 ..< position {
        if first.next != nil {
            first = first.next!
        }else{ //out of the range
            throw MyError.inputError("position out of the range")
        }
    }
    
    while first.next != nil {
        first = first.next!
        second = second.next!
    }

    return second
}

let list = creatChainTable()
do{
    print((try getNodeFromTheEnd(head: list, position: 0)).value)
}catch{
    print(error)
}
do{
    print((try getNodeFromTheEnd(head: list, position: 11)).value)
}catch{
    print(error)
}
do{
    print((try getNodeFromTheEnd(head: list, position: 10)).value)
}catch{
    print(error)
}
do{
    print((try getNodeFromTheEnd(head: list, position: 1)).value)
}catch{
    print(error)
}
do{
    print((try getNodeFromTheEnd(head: list, position: 5)).value)
}catch{
    print(error)
}










