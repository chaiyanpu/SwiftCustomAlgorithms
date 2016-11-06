//
//  main.cpp
//  StackAndQueueSwitch
//
//  Created by chai on 16/11/5.
//  Copyright © 2016年 ourgame. All rights reserved.
//

#include <iostream>
#include <stack>
#include <queue>
#include <exception>
//MARK:两个栈实现一个队列   实现进队列和出队列的功能
///两个栈实现一个队列   实现进队列和出队列的功能
using namespace std;
class myQueue{
    public:
    myQueue();  //初始化
    ~myQueue();  //释放
    
    void appendTail(int value);
    int popHead();
     
    private:
    stack<int> stackOne;
    stack<int> stackTwo;
};


void myQueue::appendTail(int value){   //实现入列
    stackOne.push(value);
}

int myQueue::popHead(){  //实现出列
    if (stackTwo.size() <= 0){
        while (stackOne.size() > 0) {
            int data = stackOne.top();
            stackOne.pop();
            stackTwo.push(data);
        }
    }
    if (stackTwo.size() <= 0){
        throw "error";
    }
        
    int top = stackTwo.top();
    stackTwo.pop();
    return top;
}

//MARK:两个队列实现栈
///两个队列实现栈
class myStack{
public:
    myStack();
    ~myStack();

    int myStackPop();
    void myStackpush(int value);
    
private:
    queue<int> queueOne;
    queue<int> queueTwo;
    
    void shift(){
        while (queueOne.size() != 1){
            int value = queueOne.front();
            queueTwo.push(value);
            queueOne.pop();
        }

    }
};

int myStack::myStackPop(){
    if (queueOne.size() <= 0){
        throw "popEror";
    }
    shift();//队列里剩最后一个
    int value = queueOne.front();
    queueOne.pop();
    
    //交换队列
    queue<int> tmpQueue = queueOne;
    queueOne = queueTwo;
    queueTwo = queueOne;
    
    return value;
}

void myStack::myStackpush(int value){
    queueOne.push(value);
}



int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
