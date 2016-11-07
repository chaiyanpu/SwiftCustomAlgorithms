//
//  main.cpp
//  SortC
//
//  Created by chai on 16/11/7.
//  Copyright © 2016年 ourgame. All rights reserved.
//

#include <iostream>


///选择排序



///冒泡排序   稳定的排序方式
void sortWithPop(int arr[],int length){
    int i, j ,tmp;
    for (i = 0 ; i < length - 1; i++){
        for (j = 0 ;j < length - 1 - i ;j++){
            if (arr[j] < arr[j + 1]){
                tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
            }
        }
    }
    
    for (int i = 0;i < 10 ; i++){
        printf("%d",arr[i]);
    }
    printf("\n");
}

///快速排序
void quickSort(int *arr,int low,int high){
    
    if (low >= high){
        return;  //证明已经完成排序了
    }
    
    //先找到第一个点
    int key = arr[low];
    int left = low;
    int right = high;
    
    while (left < right) {
        while (left < right && key <= arr[right]) {
            right --;
        }
        arr[left] = arr[right];
        
        while (left < right && key >= arr[left]) {
            left ++;
        }
        
        arr[right] = arr[left];
  
    }
    arr[right] = key;
    quickSort(arr, low, left - 1);
    quickSort(arr, left + 1, high);
}

///堆排序






///归并排序   稳定的排序方式







int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    int arr[10] = {3,4,2,5,9,7,6,0,1,8};
    sortWithPop(arr, 10);
    quickSort(arr, 0, 9);
    for (int i = 0;i < 10 ; i++){
        printf("%d",arr[i]);
    }
    printf("\n");
    return 0;
}
