//
//  main.cpp
//  MergeTwoSortedListC++
//
//  Created by chai on 2016/11/21.
//  Copyright © 2016年 chaiyanpu. All rights reserved.

//  Merge two sorted list
//  合并两个已经排序的链表，得到的链表仍然是排序的

#include <iostream>

struct ListNode{
    int value;
    ListNode *next;
};


///Merge two sorted list
ListNode * mergeTwoList(ListNode *first,ListNode *second){
    if (first == NULL){  return second;}
    else if(second == NULL){ return first;}
    
    ListNode * newHead = NULL;
    
    if (first->value < second->value){
        newHead = first;
        newHead->next = mergeTwoList(first->next, second);
    }else{
        newHead = second;
        newHead->next = mergeTwoList(first, second->next);
    }
    return newHead;
}

//TEST:
///创建十个节点的链表
ListNode* creatChainTable(int nodecount){
    ListNode *listNode = new ListNode();
    //    listNode->nodeValue = 0;
    ListNode *node = new ListNode();
    listNode->next = node;
    node->value = 1;
    
    for (int i = 2; i < nodecount ; i++){
        ListNode *aNode = new ListNode();
        aNode->value = i;
        node->next = aNode;
        node = node->next;
    }
    return listNode;
}
//打印链表
//printf List
void printfListNode(ListNode *head){
    ListNode *node = head;
    while (node != NULL) {
        printf("%d-",node->value);
        node = node->next;
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    //TEST
    ListNode *list1 = NULL;
    ListNode *list2 = new ListNode();
    list2->value = 1;
    
    ListNode * node1 = mergeTwoList(list1, list2);
    printf("%d\n",node1->value);
    
    ListNode *node2 = mergeTwoList(list2, list1);
    printf("%d\n",node2->value);
    
    ListNode *list3 = creatChainTable(5);
    ListNode *list4 = creatChainTable(10);
    
    node1 = mergeTwoList(list3, list4);
    printfListNode(node1);
    return 0;
    
}
