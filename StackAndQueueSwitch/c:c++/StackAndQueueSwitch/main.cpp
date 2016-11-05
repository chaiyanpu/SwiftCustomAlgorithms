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

///两个栈实现一个队列   实现进队列和出队列的功能
using namespace std;
class myQueue{
    public:
    myQueue();  //初始化
    ~myQueue();  //释放
    
    void appendTail(int value);  //定义
    int popHead();               //
     
    private:
    stack<int> stackOne;
    stack<int> stackTwo;
};


void myQueue::appendTail(int value){   //实现入列
    
}


int myQueue::popHead(){  //实现出列
    
    
    
    return 1;
}
















int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
