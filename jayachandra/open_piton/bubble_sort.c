/*#include <stdint.h>
#include <stdio.h>
#include "util.h"

int main() {
   // int arr[] = {5, 4, 3, 2, 1}; 
    int arr[] = {5, 1, 2, 3, 4};  
    int temp, i, j;
    int size = sizeof(arr) / sizeof(arr[0]);
    int sorted = 0;  // Flag to check if sorting is completed
    // Bubble Sort
    for (i = 0; i < size - 1; i++) {
        int swapped = 0;  // Flag to track if any swap occurs during the current pass
        for (j = 0; j < size - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                swapped = 1;  // Swap occurred
            }
        }
        if (swapped == 0) {
            sorted = 1;  // Sorting is completed as no swaps occurred
            break;  // Early termination if the array is sorted
        }
    }
    // Print sorted array
    printf("Sorted Array: ");
    for (i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    // Check and display if the sorting is completed
    if (sorted) {
        printf("\nSorting completed in fewer iterations.\n");
    } else {
        printf("\nSorting was required till the last iteration.\n");
    }
    return 0;
}

*/
#include <stdint.h>
#include <stdio.h>
#include "util.h"

int main() {
  //int arr[] = {5, 1, 2, 3, 4}; 
    int arr[] = {5,4,3,2,1};  
    int i, j;
    int size = sizeof(arr) / sizeof(arr[0]); //size=5*32/1*32=5
    int isSorted;  // Flag to check if sorting is completed

    // Bubble Sort with  swap and alternative flag logic
    for (i = 0; i < size - 1; i++) {
        isSorted = 1;  //  array is sorted

        for (j = 0; j < size - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                // swap logic
                arr[j]     =  arr[j] + arr[j + 1];
                arr[j + 1] =  arr[j] - arr[j + 1];
                arr[j]     =  arr[j] - arr[j + 1];
                isSorted = 0;  // Set flag to 0 since a swap happened
            }
        }
        if (isSorted) {
            break;  // Exit early if no swaps were made
        }
    }
    // Print sorted array
    printf("Sorted Array: ");
    for (i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    // Check and display if the sorting is completed
    if (isSorted) {
        printf("\nSorting completed in fewer iterations.\n");
    } else {
        printf("\nSorting was required till the last iteration.\n");
    }
    return 0;
}