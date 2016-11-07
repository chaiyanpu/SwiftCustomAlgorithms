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
sortWithPop(&arr)
print("--------")

//快速排序
quickSort(&arr, left: 0, right: 9)
for i in 0 ..< arr.count{
    print(arr[i])
}
