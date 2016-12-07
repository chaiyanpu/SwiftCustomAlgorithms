//
//  main.cpp
//  C++
//
//  Created by chai on 16/11/16.
//  Copyright © 2016年 chaiyanpu. All rights reserved.
//

#include <iostream>
#include <exception>
///求两个链表共同的第一个节点
/*
 思路：需要两个指针，先得到长链表比短链表长的步数n，然后先将第一个指针指向长链表的第n个节点，
 然后两个指针同时开始遍历,直到两个节点相同，得到第一个共同节点
 */
struct ListNode{
    int value;
    ListNode *next;
};

int getListLength(ListNode *node){
    int i = 0;
    ListNode *pNode = node;
    while (pNode != NULL) {
        pNode = pNode->next;
        i ++;
    }
    return i;
}
///求两个链表共同的第一个节点
ListNode * getFirstCommonNode(ListNode *firstNode,ListNode *secondNode){
    
    int firstLen = getListLength(firstNode);
    int secondLen = getListLength(secondNode);
    ListNode *longListNode;
    ListNode *shortListNode;
    int n = abs(firstLen - secondLen);
    //先比较两个链表的长度
    if (firstLen > secondLen){
        longListNode = firstNode;
        shortListNode = secondNode;
    }else{
        longListNode = secondNode;
        shortListNode = firstNode;
    }
    
    //先遍历长
    while (n > 0) {
        longListNode = longListNode->next;
        n --;
    }
    
    //同时遍历
    while (longListNode != NULL && shortListNode != NULL) {
        if (longListNode == shortListNode){
            return longListNode;
        }else{
            longListNode = longListNode->next;
            shortListNode = shortListNode->next;
        }
    }
    
    throw "not found";
}

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    return 0;
}
