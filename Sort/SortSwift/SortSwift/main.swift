//
//  main.swift
//  SortSwift
//
//  Created by chai on 16/11/7.
//  Copyright © 2016年 ourgame. All rights reserved.
//

import Foundation

print("Hello, World!")
var arr:[Int] = [3,4,2,5,9,7,6,0,1,8]

//冒泡排序
print("冒泡排序")
sortWithPop(&arr)
print(arr)
print("--------")

//快速排序
print("快速排序")
quickSort(&arr, left: 0, right: 9)
print(arr)
print("--------")

//归并排序 稳定的排序方式
print("归并排序")
print(mergeSort(array: arr))
print("--------")
