//
//  main.cpp
//  MinNumbersOfArray
//
//  Created by chai on 2016/12/13.
//  Copyright © 2016年 chaiyanpu. All rights reserved.
//  get least numbers in a array.

#include <iostream>
#include <exception>

///exception
class MyError {
    const char* const data;
public:
    MyError(const char* const msg = 0):data(msg){}
};

///exchange data
void swap(int* first,int *second){
    *first = *first ^ *second;
    *second = *first ^ *second;
    *first = *first ^ *second;
}

///按照关键数前后排序
int partition(int data[],int length,int start,int end){
    if (data == NULL || length <= 0 || start < 0 || end >= length){
        return 0; //error
    }
    int index = data[end];
    int small = start - 1;
    for (index = start; index < end; ++ index) {
        if (data[index] < data[end]){
            ++ small;
            if (small != index){
                swap(&data[index],&data[small]);
            }
        }
    }
    ++ small;
    swap(&data[small],&data[end]);
    return small;
}

/*get least k numbers in a array.
* para@ array:
* para@ length: the length of array
* para@ output:target utput
* para@ k:k
*/
void getLeastNumbersInaArray(int *array,int length,int *output,int k){
    if (array == NULL || output == NULL || k > length || length <= 0 || k <= 0){
        throw MyError("error");
    }
    int start = 0;
    int end = length - 1;
    int index = partition(array, length, start, end);
    while (index != k -1) {
        if (index > k - 1){
            end = index - 1;
            index = partition(array, length, start, end);
        }else{
            start = index + 1;
            index = partition(array, length, start, end);
        }
    }
    
    for (int i = 0; i < k; ++ i) {
        output[i] = array[i];
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    int array[10] = {1,4,7,8,89,2,44,4,334,68};
    int k = 5;
    int output[k];
    getLeastNumbersInaArray(array, 10, output, 5);
    for (int i = 0; i < k ; i ++) {
        printf("%d ",output[i]);
    }
    printf("\n");
    return 0;
}


