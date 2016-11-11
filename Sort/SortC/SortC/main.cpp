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
//TODO:




void mergeS(int targetArray[],int tmpArray[],int startIndex,int midIndex,int endIndex){
    int i = startIndex,j = midIndex,k = startIndex;
    
    while (i != midIndex + 1 && j != endIndex + 1) {
        if (targetArray[i] > targetArray[j]){
            tmpArray[k++] = targetArray[j++];
            
        }else{
            tmpArray[k++] = targetArray[j++];
            
        }
        while ( i != midIndex) {
            tmpArray[k++] = targetArray[i++];
            
        }
        
        while (j != endIndex + 1) {
            tmpArray[k++] = targetArray[j++];
        }
        for (i = startIndex; i <= endIndex; i ++){
            targetArray[i] = tmpArray[i];
        }
        
    }
    
}
///归并排序   稳定的排序方式
void mergeSort(int targetArray[],int tmpArray[],int startindex,int endIndex){
    int midIndex;
    if (startindex < endIndex){
        midIndex = (startindex + endIndex)/2;
        mergeSort(targetArray, tmpArray, startindex, midIndex);
        mergeSort(targetArray, tmpArray, midIndex + 1, endIndex);
        mergeS(targetArray, tmpArray, startindex, midIndex, endIndex);
    }
}




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
    int tmpArray[8];
    mergeSort(arr, tmpArray, 0, 9);
    for (int i = 0;i < 10 ; i++){
        printf("%d",arr[i]);
    }
    return 0;
}
