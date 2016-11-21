//
//  main.swift
//  MergeTwoSoredListSwift
//
//  Created by chai on 2016/11/21.
//  Copyright © 2016年 chaiyanpu. All rights reserved.

// Merge two sorted list
// 将两个有序链表排序，生成新链表

import Foundation

print("Hello, World!")

//ListNiode
class ListNode<T>{
    var value:T
    var next:ListNode?
    init(_ value:T){
        self.value = value;
        self.next = nil;
    }
}

///Merge two sorted list
func mergeTwoSortedList(_ first:ListNode<Int>?,_ second:ListNode<Int>?) -> ListNode<Int>?{
    guard first != nil else{
        return second ?? nil;
    }
    guard second != nil else{
        return first ?? nil
    }
    var newHead:ListNode<Int>?
    if let one = first,let two = second{
        if one.value < two.value{
            newHead = one
            newHead!.next = mergeTwoSortedList(one.next, two)
        }else{
            newHead = two
            newHead!.next = mergeTwoSortedList(one,two.next)
        }
    }
    return newHead
}

//MARK: - TEST
///创建链表
func creatChainTable(_ count:Int) -> ListNode<Int>{
    let listNode = ListNode(0)
    var node = ListNode(1)
    listNode.next = node
    
    for i in 2...count{
        let aNode = ListNode(i)
        node.next = aNode;
        node = node.next!;
    }
    return listNode
}
///printf List
func printList(_ head:ListNode<Int>?){
    var node:ListNode<Int>? = head
    while node != nil  {
        print(node!.value)
        node = node!.next
    }
}
//test
print(mergeTwoSortedList(ListNode(1), nil)?.value ?? -1)
print(mergeTwoSortedList(nil, ListNode(2))?.value ?? -1)
printList(mergeTwoSortedList(creatChainTable(5), creatChainTable(10)) ?? nil)





