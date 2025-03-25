
#include <stdint.h> 
#include <stdio.h> 
#include "util.h"

#define ARRAY_SIZE 4 // Adjust size based on requirements

int main(int argc, char** argv) {  
    int arr[ARRAY_SIZE] = {4,3,2,1};  
    int i, j, temp;
    int size = ARRAY_SIZE;
    int NUM_CORES=argv[0][1];
    int start_index, end_index;

    volatile static uint32_t next_ticket = 0;
    volatile static uint32_t now_serving = 0;
    uint32_t my_ticket = __sync_fetch_and_add(&next_ticket, 1);
    
    int elements_per_core =size / NUM_CORES; 
    int remainder = size % NUM_CORES; //2
    int count = elements_per_core; //2

for (int i = 0; i < remainder; i++) {
    if (now_serving == i) {
        count++;
        break;
    }
}
    
    while (my_ticket != now_serving) {
        // Wait for turn
    };
    printf("Hello world, this is hart %d of %d harts!\n", argv[0][0], NUM_CORES);
    
    // Assign work to each core
    start_index =count*argv[0][0];
    end_index =start_index+count;

    // Bubble Sort for assigned section
    for (i = start_index; i < end_index; i++) {
        for (j = start_index; j < end_index - (i - start_index) - 1; j++) {
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }

    // Print sorted section for each core
    printf("Core %d sorted section: ", argv[0][0]);
    for (i = start_index; i < end_index; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    __sync_fetch_and_add(&now_serving, 1);
    return 0;
}


