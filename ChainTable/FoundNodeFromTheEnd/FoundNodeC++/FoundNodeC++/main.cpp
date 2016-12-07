//
//  main.cpp
//  FoundNodeC++
//
//  Created by chai on 16/11/17.
//  Copyright © 2016年 chaiyanpu. All rights reserved.
//

#include <iostream>
#include <exception>
struct ListNode {
    int value;
    ListNode *next;
};
/////create list,10 nodes
ListNode* creatChainTable(){
    ListNode *listNode = new ListNode();
    //    listNode->nodeValue = 0;
    ListNode *node = new ListNode();
    listNode->next = node;
    node->value = 1;
    
    for (int i = 2; i < 10 ; i++){
        ListNode *aNode = new ListNode();
        aNode->value = i;
        node->next = aNode;
        node = node->next;
    }
    return listNode;
}
///Found the node from the end in a list
ListNode * getNodeFrowTheEnd(ListNode * head,unsigned int position){
    
    if (head == NULL || position == 0){
        return NULL;
    }
    
    //we need two pointer
    ListNode *first = head;
    ListNode *second = head;
    int n = position;
    if (n == 1){
        while (first->next != NULL) {
            first = first->next;
        }
        return  first;
    }
    
    while (n > 1) {
        if (first->next != NULL){
            first = first->next;
        }else{
            return NULL;
        }
        n --;
    }
    
    while (first->next != NULL) {
        first = first->next;
        second = second->next;
    }
    
    return second;
}

void print(ListNode * aNode){
    if (aNode != NULL){
        printf("%d\n",aNode->value);
    }else{
        printf("inputError\n");
    }
}


int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    //create list,10 nodes
    ListNode * listNode = creatChainTable();
    
    ListNode * aNode = getNodeFrowTheEnd(listNode, 11);
    print(aNode);
    aNode = getNodeFrowTheEnd(listNode, 0);
    print(aNode);
    aNode = getNodeFrowTheEnd(listNode, 10);
    print(aNode);
    aNode = getNodeFrowTheEnd(listNode, 1);
    print(aNode);
    aNode = getNodeFrowTheEnd(listNode, 5);
     print(aNode);
    return 0;
}
