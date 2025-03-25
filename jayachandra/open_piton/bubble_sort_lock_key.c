#include <stdint.h> 
#include <stdio.h> 
#include "util.h" 
  
  
  int main(int argc, char** argv) {  
  int arr[] = {5,4,3,2,1};  
  int i, j;
  int size = sizeof(arr) / sizeof(arr[0]);
  int isSorted;  // Flag to check if sorting is completed

  volatile static uint32_t next_ticket = 0;
  volatile static uint32_t now_serving = 0;
  uint32_t my_ticket = __sync_fetch_and_add(&next_ticket, 1);
 
  while(my_ticket != now_serving){
  };  
  printf("Hello world, this is hart %d of %d harts!\n", argv[0][0], argv[0][1]);
  
  for (i = 0; i < size - 1; i++) {
        isSorted = 1;  // Assume array is sorted

        for (j = 0; j < size - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                // swap logic
                arr[j]     =  arr[j] + arr[j + 1];  //5+4=9
                arr[j + 1] =  arr[j] - arr[j + 1];  //9-4=5
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
    __sync_fetch_and_add(&now_serving, 1);   
    return 0;
}
