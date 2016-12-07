//
//  main.swift
//  SwiftCode
//
//  Created by chai on 16/11/15.
//  Copyright © 2016年 chaiyanpu. All rights reserved.
//

import Foundation
enum InputError:Error {
    case inputError(String)
}
struct MyHashTable{  //只是做了下线程安全处理😳
    var lock:NSLock
    var elements:[Character:Int]
    init() {
        self.lock = NSLock()
        self.elements = [:]
    }
    subscript(char: Character) -> Int? {
        get {
            lock.lock()
            defer {
                lock.unlock()
            }
            return elements[char]
        }
        set {
            lock.lock()
            defer {
                lock.unlock()
            }
            elements[char] = newValue
        }
    }
}
///输入一个字符串，返回一个第一个只出现一次的字符
func getFirstCharFromAString(string:String) throws ->  Character{
    
    var hashTable = MyHashTable()
    for ch in string.characters {
        if hashTable[ch] != nil {
            (hashTable[ch])! += 1
        }else{
            hashTable[ch] = 1
        }
    }
    
    for (key,_) in hashTable.elements{
        if hashTable[key] == 1{
            return key
        }
    }
    throw InputError.inputError("not found")
    
}


//TODO: -
///反转链表输出头节点
class ListNode<T>{
    var value:T
    var next:ListNode?
    init(_ value:T) {
        self.value = value
        self.next = nil
    }
}

func exchangeListAndPrint(headNode:ListNode<Int>) -> ListNode<Int>?{
    
    if headNode.next == nil {
        return headNode
    }
    var originalNode:ListNode<Int>? = headNode
    var newNode:ListNode<Int>? = nil
    while originalNode != nil {
        let newN = originalNode
        originalNode = originalNode!.next ?? nil
        newN!.next = newNode
        newNode = newN!
    }
    return newNode ?? nil
}

//输入一个字符串，返回一个第一个只出现一次的字符
do{
    let c = try getFirstCharFromAString(string: "werhvuybecuybqwubcuqbuew")
    print(c)
}catch{
    print(error)
}

do{
    let c = try getFirstCharFromAString(string: "aabbccddeeffggjjhhyyttrr")
    print(c)
}catch{
    print(error)
}

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
var list:ListNode<Int> = creatChainTable();  //创建链表
//反转链表输出头节点
let node = exchangeListAndPrint(headNode:list)
print(node?.value)



