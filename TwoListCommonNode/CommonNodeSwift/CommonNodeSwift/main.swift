//
//  main.swift
//  CommonNodeSwift
//
//  Created by chai on 16/11/16.
//  Copyright © 2016年 chaiyanpu. All rights reserved.
//  求两个链表共同的第一个节点

import Foundation
enum NotFound:Error {
    case notFound(String)
}
print("Hello, World!")
//求两个链表共同的第一个节点
/*
 思路：需要两个指针，先得到长链表比短链表长的步数n，然后先将第一个指针指向长链表的第n个节点，
 然后两个指针同时开始遍历,直到两个节点相同，得到第一个共同节点
 */
class ListNode<T>:NSObject{

    var value:T
    var next:ListNode<T>?
    init(_ value:T) {
        self.value = value
        self.next = nil
    }
    
}

func getFirstCommonNode(firstNode:ListNode<Int>,secondNode:ListNode<Int>) throws -> ListNode<Int>{
    
    let firstLen = getLenth(listNode: firstNode)
    let secondLen = getLenth(listNode: secondNode)
    var longListNdoe:ListNode<Int>? = firstNode
    var shortListNode:ListNode<Int>? = secondNode
    var n = abs(firstLen - secondLen)
    if firstLen < secondLen{
        longListNdoe = secondNode
        shortListNode = firstNode
    }
    
    while n > 0 {
        n -= 1
        longListNdoe = longListNdoe?.next
    }
    
    for _ in 0 ..< secondLen{
        if (longListNdoe != nil && shortListNode != nil){
            if (longListNdoe!) == (shortListNode!){
                return longListNdoe!
            }else{
                longListNdoe = longListNdoe?.next
                shortListNode = shortListNode?.next
            }
        }else{
            break
        }
    }
    throw NotFound.notFound("not found")
}

func getLenth(listNode:ListNode<Int>) -> Int32{
    
    var node:ListNode<Int>? = listNode
    var i:Int32 = 0
    while node != nil  {
        i += 1
        node = node?.next
    }
    return i
}

///创建链表
var list:ListNode<Int> = ListNode(100)
func creatChainTable() -> ListNode<Int>{
    let listNode = ListNode(0)
    var node = ListNode(1)
    listNode.next = node
    
    for i in 2...3{
        let aNode = ListNode(i)
        node.next = aNode;
        node = node.next!;
    }
    node.next = list
    return listNode
}

var list1:ListNode<Int> = creatChainTable();  //创建链表
var list2:ListNode<Int> = creatChainTable();  //创建链表
do {
  let node = try getFirstCommonNode(firstNode: list1, secondNode: list2)
    print(node.value)
}catch{
    print(error)
}

