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
    time:O(n)
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
    time:O(n)
    两个指针同时往下走，将链表节点的值相加，添加入新的链表，判断是否需要进位，直到节点遍历完毕且不需要进位为止。
 */
//ListNode
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


/* 3.Add Two Numbers
 Q:
 Given a string, find the length of the longest substring without repeating characters.
 A:
 使用一个哈希表，记录字符的索引。遍历，当检测到相同的时候，并且将字典中的重复之前的包括第一个重复的字符的值设为false，求出不重复的length，将length记录下来并与max比较。
 */
class LengthOfLongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var max:Int = 0
        var start:Int = 0
        var end:Int = 0
        var dic:[Character:Bool] = [:]
        for c in s.characters {
            if dic[c] == nil || dic[c] == false {
                dic[c] = true;//遍历标记
                end += 1;
            }else{
                let index = s.index(s.startIndex, offsetBy: start)
                while s[index] != c {
                    dic[s[index]] = false //表示已经遍历并被计算过的，其实没有作用
                    start += 1;
                }
                start += 1
                end += 1
            }
            max = max > end - start ? max : end - start
        }
        return max
    }
}


/* 4.Median of Two Sorted Arrays
 Q:
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 A:
 二分法，比较好
 */
class MedianOfTwoSortedArrays{
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        let k = (m + n)/2
        if 0 == ((m + n) & 1) { //偶数
            return (findKth(nums1,nums2,0,0,m,n,k)+findKth(nums1,nums2,0,0,m,n,k+1))/2
        }else{
            return findKth(nums1,nums2,0,0,m,n,k+1)
        }
    }
    
    func findKth(_ nums1:[Int],_ nums2:[Int],_ start1:Int,_ start2:Int,_ length1:Int,_ lenght2:Int,_ k:Int) -> Double{
        if length1 > lenght2{
            return findKth(nums2, nums1, start2, start1, lenght2, length1, k)
        }
        if 0 == length1{
            return Double(nums2[start2 + k - 1])
        }
        if 1 == k{
            return Double(min(nums2[start2], nums1[start1]))
        }
        let p1 = Int(min(k/2, length1))
        let p2 = k - p1
        if nums1[start1 + p1 - 1] < nums2[start2 + p2 - 1] {
            return findKth(nums1, nums2, start1 + p1, start2, length1 - p1, lenght2, k - p1)
        }else if nums1[start1 + p1 - 1] > nums2[start2 + p2 - 1]{
            return findKth(nums1, nums2, start1, start2 + p2, length1, lenght2 - p2, k - p2)
        }else{
            return Double(nums1[start1 + p1 - 1])
        }
    }
}

/* 5.Longest Palindromic Substring
 Q:
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 A:
    有个马拉车（Manacher's Algorithm）算法，看起来很晦涩，以后再看。
 */
class LongestPalindromicSubstring{
    func longestPalindrome(_ s: String) -> String {
        
        return ""
    }
}







