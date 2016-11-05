//
//  main.cpp
//  offer
//
//  Created by chai on 16/11/3.
//  Copyright © 2016年 ourgame. All rights reserved.
//

#include <iostream>
#include <stack>

///链表节点
struct ListNode {
    int nodeValue;
    ListNode * nextNode;
};

///创建十个节点的链表
ListNode* creatChainTable(){
    ListNode *listNode = new ListNode();
    //    listNode->nodeValue = 0;
    ListNode *node = new ListNode();
    listNode->nextNode = node;
    node->nodeValue = 1;
    
    for (int i = 2; i < 10 ; i++){
        ListNode *aNode = new ListNode();
        aNode->nodeValue = i;
        node->nextNode = aNode;
        node = node->nextNode;
    }
    return listNode;
}

///添加一个节点到链尾
void addListNodeToTail(ListNode *pHead,int value){
    
    ListNode *needToAddNode = new ListNode();
    needToAddNode->nodeValue = value;
    needToAddNode->nextNode = NULL;
    
    if (pHead == NULL){
        pHead = needToAddNode;
        return;
    }
    
    while (pHead->nextNode != NULL) {
        pHead = pHead->nextNode;
    }
    pHead->nextNode = needToAddNode;
    
}

///找到含有某值的节点并删除
bool removeNode(ListNode *listNode,int value){
    bool isHad = false;
    ListNode *neeToDelete  = NULL;
    if (listNode == NULL){
        return false;
    }
    if (listNode->nodeValue == value){
        isHad = true;
        neeToDelete = listNode;
        listNode = listNode -> nextNode;
        printf("%d\n",listNode->nodeValue);
        
    }else{
        while (listNode->nextNode != NULL && listNode->nextNode->nodeValue != value){
            listNode = listNode->nextNode;
        }
        if (listNode->nextNode != NULL && listNode->nextNode->nodeValue == value){
            isHad = true;
            neeToDelete = listNode ->nextNode;
            listNode -> nextNode = listNode -> nextNode -> nextNode;
        }
    }
    
    if (neeToDelete){
        delete neeToDelete;
        neeToDelete = NULL;
    }
    
    return isHad;
}


//／反转链表到栈里   不用递归
void PrintListReversingly(ListNode * pHead){
    
    std::stack<ListNode*> nodes;   //需要导入<stack>头文件
    ListNode *pNode = pHead;
    while (pNode != NULL) {
        nodes.push(pNode);
        pNode = pNode -> nextNode;
    }
    while (nodes.empty() != true) {
        ListNode * node = nodes.top();
        printf("%d\t",node->nodeValue);
        nodes.pop();
    }
    printf("\n");
}

///反向打印链表，递归
void PrintListReversinglyRecurrence(ListNode * pHead){
    
    if(pHead != NULL){
        if (pHead -> nextNode != NULL){
            PrintListReversinglyRecurrence(pHead -> nextNode);
        }
        printf("%d\t",pHead->nodeValue);
    }
//    printf("\n");
}

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    ListNode * listNode = creatChainTable();  //创建链表
    
    addListNodeToTail(listNode,10);    //尾部添加节点
    
    bool isDelete = removeNode(listNode,5);   //删除某value的节点
    printf("%d,1 is deleted\n",isDelete);
    
    PrintListReversingly(listNode);      //反向打印节点
    
    PrintListReversinglyRecurrence(listNode);   //反向打印节点  递归
    
    return 0;
}






















