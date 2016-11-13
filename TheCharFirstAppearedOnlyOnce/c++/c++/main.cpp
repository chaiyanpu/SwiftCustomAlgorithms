//
//  main.cpp
//  c++
//
//  Created by chai on 16/11/13.
//  Copyright © 2016年 ourgame. All rights reserved.
//

#include <iostream>
///输入一串字符 得到第一个只出现一次的字符
char getTheCharFirstAppearedOnlyOnce(char *aStr){
    
    if (aStr == NULL){
        return '\0';
    }
    
    const int tableSize = 256;
    unsigned int hashTable[tableSize];
    
    for (unsigned int i = 0; i < tableSize;  ++ i) {
        hashTable[i] = 0;
    }
    
    char * key = aStr;
    
    while (*(key) != '\0') {
        hashTable[*(key++)] ++;
    }
    
    key = aStr;
    
    while (*key != '\0') {
        if (hashTable[*key] == 1){
            return *key;
        }
        key ++;
    }
    return '\0';
}


///反转链表并输出反转后的头节点
struct ListNode{
    int value;
    ListNode *next;
};
//反转链表并输出反转后的头节点(不死你头节点的值，是反转后的头节点)
ListNode* exchangeList(ListNode * head){
    ListNode * exchangeHead = NULL;
    ListNode * node = head;
    ListNode * pPrev = NULL;
    
    while (node != NULL) {
        ListNode * next = node->next;
        if (next == NULL){
            exchangeHead = node;
        }
        node->next = pPrev;
        pPrev = node;
        node = next;
    }
    return exchangeHead;
}


int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    char ch = getTheCharFirstAppearedOnlyOnce("dlkfgquwygfuyqwfuyqwgeuofgqwytfcgdnhq");
    printf("%c\n",ch);
    
    return 0;
}


