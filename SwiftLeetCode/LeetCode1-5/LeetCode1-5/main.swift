//
//  main.swift
//  LeetCode1-5
//
//  Created by chai on 2017/2/6.
//  Copyright © 2017年 chaiyanpu. All rights reserved.
//

import Foundation

print("Hello, World!")

/* 1.Two Sum
    Q:
    Given an array of integers, return indices of the two numbers such that they add up to a specific target.
    You may assume that each input would have exactly one solution, and you may not use the same element twice.
    A:
    利用字典，将数组的值做为key，index做为value。根据需要的目标值，在字典中查询是否存在目标，返回结果。
 */
class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic:[Int:Int] = [:]
        var targetArr:[Int] = []
        for i in 0 ..< nums.count{
            if dic[nums[i]] == nil {
                dic[nums[i]] = i
            }
            let n = target - nums[i]
            if dic[n] != nil {
                targetArr.append(i)
                targetArr.append(dic[n]!)
                return targetArr
            }
        }
        return targetArr
    }
}


/* 2.Add Two Numbers
    Q:
    You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
    You may assume the two numbers do not contain any leading zero, except the number 0 itself.
    A:
    两个指针同时往下走，将链表节点的值相加，添加入新的链表，判断是否需要进位，直到节点遍历完毕且不需要进位为止。
 */
//list
 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
            self.val = val
            self.next = nil
    }
}
class AddTwoNumbers {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let head:ListNode = ListNode(0)
        var end:ListNode = head
        var changeNum:Int = 0
        while true {
            if l1 != nil{
                changeNum += l1!.val
                l1 = l1!.next
            }
            if l2 != nil{
                changeNum += l2!.val
                l2 = l2!.next
            }
            //赋值
            end.val = changeNum % 10
            changeNum /= 10
            //判断
            guard l1 != nil || l2 != nil || changeNum != 0 else{
                break
            }
            //往下移位
            end.next = ListNode(0)
            end = end.next!
        }
        return head
    }
}


