#include <stdint.h> 
#include <stdio.h> 
#include "util.h" 

  int main(int argc, char** argv) {  
  int arr[] = {5,4,3,2,1};  
  int i, j;
  int size = sizeof(arr) / sizeof(arr[0]);
  int isSorted;  // Flag to check if sorting is completed

  volatile static uint32_t amo_cnt = 0; 
   while(argv[0][0] != amo_cnt );
     printf("Hello world, this is hart %d of %d harts of pyramid \n", argv[0][0], argv[0][1]);
     
      for (i = 0; i < size - 1; i++) {
        isSorted = 1;  // Assume array is sorted

        for (j = 0; j < size - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                // swap logic
                arr[j]     =  arr[j] + arr[j + 1];  //5+4=9
                arr[j + 1] =  arr[j] - arr[j + 1];  //9-4=5
                arr[j]     =  arr[j] - arr[j + 1];  //9-5=4
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
     ATOMIC_OP(amo_cnt, 1, add, w);    
    return 0;
}
