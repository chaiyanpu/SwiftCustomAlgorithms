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



