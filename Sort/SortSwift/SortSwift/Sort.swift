//
//  Pop.swift
//  SortSwift
//
//  Created by chai on 16/11/7.
//  Copyright © 2016年 ourgame. All rights reserved.
//

import Foundation

///冒泡排序
func sortWithPop(_ array:inout [Int]){
    
    let length = array.count
    for i in 0 ..< length - 1{
        for j in 0 ..< length - i - 1{
            if array[j] > array[j + 1]{
                array[j] = array[j+1] ^ array[j]
                array[j+1] = array[j+1] ^ array[j]
                array[j] = array[j+1] ^ array[j]
            }
        }
    }
    for i in 0 ..< array.count {
        print(array[i])
    }
  
}

///快速排序
func quickSort(_ array:inout [Int],left:Int,right:Int){
    
    if left >= right{
        return   //结束
    }
    func swiftPosition(_ key:Int,low:inout Int, high:inout Int, greater:Bool){
        if low < high{
            for _ in low ..< high{
                if greater == true{
                    if key < array[high]{
                        high -= 1
                    }
                }else{
                    if key > array[low]{
                        low += 1
                    }
                }
                break
            }
        }
    }
    //获取关键点
    let key = array[left];
    var low = left;
    var high = right;
    
    for _ in low ..< high {
        swiftPosition(key, low: &low, high: &high, greater: true)
        array[low] = array[high]
        swiftPosition(key, low: &low, high: &high, greater: false)
        array[high] = array[low]
    }
    
    array[low] = key;  //key值归位
    
    quickSort(&array, left: left, right: low - 1)
    quickSort(&array, left: low + 1, right: right)
    
}


///归并排序  稳定的排序方式
func mergeSort(){
    
}


