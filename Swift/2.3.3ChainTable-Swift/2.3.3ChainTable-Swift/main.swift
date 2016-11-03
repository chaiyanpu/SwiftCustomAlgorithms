//
//  main.swift
//  2.3.3ChainTable-Swift
//
//  Created by chai on 16/11/3.
//  Copyright © 2016年 ourgame. All rights reserved.
//

import Foundation

print("Hello, World!")

///创建十个节点的链表
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

///添加一个节点到链尾
func addListNodeToTail(_ pHead: ListNode<Int>?,value:Int){
    var pHead = pHead
    let newNode = ListNode(value)
    if pHead == nil{
        pHead = newNode
        return
    }
    
    while pHead!.next != nil {
        pHead = pHead!.next!
    }
    
    pHead!.next = newNode
    
}

///找到含有某值的节点并删除
func removeNode(_ listNode:ListNode<Int>?,value:Int) -> Bool{
    var listNode = listNode
    var isDelete = false
    
    if listNode != nil {
        if listNode?.value == value{  //如果第一个就是
            listNode = listNode?.next  //不用释放了，应为没有引用
            return true
        }
        while listNode?.next != nil && listNode?.next?.value != value {
            listNode = listNode?.next
        }
        if listNode?.next != nil && listNode?.next?.value == value{
            listNode?.next = listNode?.next?.next
            isDelete = true
        }
        
    }
    
    return isDelete
}

//／反向打印链表   不用递归
func PrintListReversingly(_ pHead:ListNode<Int>?){ //这里需要用到栈
    
    /*Swift里没有栈，需要自己实，Apple文档里有用数组实现的方式，这里是用链表来实现的*/
    let stack = Stack<ListNode<Int>>()
    var pHead = pHead
    while (pHead != nil) {
        stack.push(value: pHead!)
        pHead = pHead?.next
    }
    while !stack.isEmpty() {
        let node = stack.top()
        print("\(node!.value)")
        stack.pop()
    }
    print("--------")
}

///反向打印链表，递归
func PrintListReversinglyRecurrence(_ pHead:ListNode<Int>?){
    if pHead != nil {
        if pHead?.next != nil {
            PrintListReversinglyRecurrence(pHead!.next)
        }
        print("\(pHead!.value)")
    
    }

}


var listNode:ListNode<Int> = creatChainTable();  //创建链表

addListNodeToTail(listNode,value: 10);    //尾部添加节点

var isDelete = removeNode(listNode,value: 5);   //删除某value的节点
print("\(isDelete),true is deleted\n");

PrintListReversingly(listNode);      //反向打印节点

PrintListReversinglyRecurrence(listNode);   //反向打印节点  递归
