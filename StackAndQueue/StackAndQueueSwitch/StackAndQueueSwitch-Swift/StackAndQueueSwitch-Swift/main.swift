//
//  main.swift
//  StackAndQueueSwitch-Swift
//
//  Created by chai on 16/11/6.
//  Copyright © 2016年 ourgame. All rights reserved.
//

import Foundation

print("Hello, World!")
//MARK:Swift队列的实现，建议用Array
///Swift队列的实现，建议用Array,很方便 例如这样
class Queue<T>{
    var array = [T]()
    var count:Int{
        return array.count
    }
    func push(value:T){
        array.append(value);
    }
    func pop(){
        array.removeFirst()
    }
    
    func front() -> T?{
        if array.count > 0{
            let value = array.first
            return value
        }else{
            return nil
        }
    }
}

//MARK:两个栈实现队列
///队列的实现也可以这样，用栈实现
class MyQueue<T>{
    private var stackOne:Stack<T>
    private var stackTwo:Stack<T>
    init() {
        self.stackOne = Stack<T>()
        self.stackTwo = Stack<T>()
    }
    @discardableResult
    func push(_ value:T) -> MyQueue<T>{
        self.stackOne.push(value: value)
        return self
    }
    func front() -> T?{
        self.shift()
        let value = self.stackTwo.top()
        return value;
    }
    @discardableResult
    func pop() -> T?{
        self.shift()
        defer{
            self.stackTwo.pop()
        }
        let value = self.stackTwo.top()
        return value;
    }
    
    private func shift(){
        if self.stackTwo.isEmpty() == true{
            while self.stackOne.isEmpty() != true {
                let value = self.stackOne.top()
                self.stackTwo.push(value: value!)
                self.stackOne.pop()
            }
        }

    }
}

//MARK:两个队列实现栈
///两个队列实现栈
class MyStack<T>{
    private var queueOne:Queue<T>
    private var queueTwo:Queue<T>
    init() {
        self.queueOne = Queue<T>()
        self.queueTwo = Queue<T>()
    }
    
    func top() -> T{
        while queueOne.count != 1 {
            let value = queueOne.front()
            queueOne.pop()
            queueTwo.push(value:value!)
        }
        let value = queueOne.front()
        queueTwo.push(value: value!)
        queueOne.pop()
        queueSwitch()

        return value!
    }
    
    @discardableResult
    func pop() -> T{
        while queueOne.count != 1 {
            let value = queueOne.front()
            queueOne.pop()
            queueTwo.push(value:value!)
        }
        let value = queueOne.front()
        queueOne.pop()
        queueSwitch()
        return value!
    }
    @discardableResult
    func push(_ value:T) -> MyStack{
        self.queueOne.push(value: value)
        return self
    }
    
    private func queueSwitch(){
        let tmpQueue = queueOne
        queueOne = queueTwo
        queueTwo = tmpQueue
    }
}


//Mark:两个栈实现队列测试
print("两个栈实现队列测试")
let queue = MyQueue<Int>()
queue.push(1).push(2).push(3).push(4)
print(queue.front())
queue.pop()
queue.push(5).push(6)
print(queue.front())

//MARK:两个队列实现栈测试
print("两个队列实现栈测试")
let stack = MyStack<Int>()
stack.push(1).push(2).push(3).push(4)
print(stack.top())
print(stack.pop())
stack.push(5)
print(stack.top())
print(stack.pop())


