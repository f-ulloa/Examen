#include <iostream>
using namespace std;

int binarySearch(int arr[], int arrayLength, int element){
    int leftPivotIndex = 0;
    int rigthPivotIndex = arrayLength-1;

    while(leftPivotIndex < rigthPivotIndex){
        int midIndex = (leftPivotIndex + rigthPivotIndex) / 2;
        if(arr[midIndex] == element) return midIndex;
        else if(arr[midIndex] < element) leftPivotIndex ++;
        else if(arr[midIndex] > element) rigthPivotIndex ++;
    }

    return -1;
}

int main(){
    int arr[] = {1, 10, 40, 30, 22, 3, 221};
    cout << binarySearch(arr, 7, 40);
    return 0;
}