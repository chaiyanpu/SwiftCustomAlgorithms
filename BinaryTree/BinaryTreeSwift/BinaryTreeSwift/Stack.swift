//
//  Stack.swift
//  2.3.3ChainTable-Swift
//
//  Created by chai on 16/11/3.
//  Copyright © 2016年 ourgame. All rights reserved.
//

import Foundation

/// Swift链表节点表示形式   只能用class，因为Swift的struct里不能包含与自己相关的属性
class ListNode<T>{  //节点的next默认为nil
    var value:T
    var next:ListNode?
    init(_ value:T) {
        self.value = value
        self.next = nil
    }
//    deinit {
//        print("被释放了")
//    }
}

class Stack<T>{
    var stack:ListNode<T>?
    init(value:ListNode<T>? = nil) {
        self.stack = value
    }
    
    func push(value:T){
        switch self.isEmpty() {
        case true:
            self.stack = ListNode(value)
        default:
            let node = ListNode(value)
            node.next = self.stack
            self.stack = node
        }
    }
    
    func top() -> T?{
        switch self.isEmpty() {
        case true:
            return nil
        default:
            let value = self.stack!.value
            return value
        }
    }
    
    @discardableResult
    open func pop() -> Stack{
        switch self.isEmpty() {
        case true:
            break
        default:
            if self.stack!.next != nil{
                self.stack = self.stack!.next
            }else{
                self.stack = nil
            }
        }
        return self
    }
    
    func isEmpty() -> Bool{
        if self.stack == nil {
            return true
        }else{
            return false
        }
    }
    
    func Clear(){
        self.stack = nil
    }
  
}
