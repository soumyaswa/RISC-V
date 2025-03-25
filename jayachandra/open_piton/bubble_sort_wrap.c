#include <stdint.h> 
#include <stdio.h> 
#include "util.h"

#define ARRAY_SIZE 10

int main(int argc, char** argv) {  
    int arr[ARRAY_SIZE] = {9, 10, 8, 7, 6, 5, 4, 3, 2, 1};  
    int i, j, temp;
    int size = ARRAY_SIZE;
    int NUM_CORES = argv[0][1];
    int elements_per_core = 3;   
    int start_index, end_index;  //These variables will store the start and end indices for each core's section of the array to sort.

    volatile static uint32_t next_ticket = 0;
    volatile static uint32_t now_serving = 0;
    uint32_t my_ticket = __sync_fetch_and_add(&next_ticket, 1);
    
    while (my_ticket != now_serving) {
        // Wait for turn
    };
    printf("Hello world, this is hart %d of %d harts!\n", argv[0][0], NUM_CORES);
    
    // Assign work to each core
    start_index = (elements_per_core * now_serving)%size;//3*3=9 //This line calculates the starting index for the current core's section of the array.
    end_index = start_index + elements_per_core; //12 //This sets the end index, based on the number of elements the core should handle.
    
    // Bubble Sort for assigned section
    for (i = start_index; i < end_index; i++) {  //This loop iterates through the section of the array assigned to the current core.
        int i_wrapped = (i >= size) ? (i - size) : i;//This line checks if i exceeds the size of the array. If it does, it wraps around by
                                                     // subtracting size .Otherwise, it simply uses i.

        for (j = start_index; j < end_index - (i - start_index) - 1; j++) {  //This is the inner loop for the bubble sort algorithm
            int j_wrapped = (j >= size) ? (j - size) : j;  //Similarly to i, this line wraps the j index around if it exceeds the array size.
            int next_index = (j + 1 >= size) ? (j + 1 - size) : (j + 1); //This line calculates the index of the next element (j + 1) while                                                                          ensuring that if j + 1 exceeds the array size, it wraps around to index 0,1.

            if (arr[j_wrapped] > arr[next_index]) {
                temp = arr[j_wrapped];
                arr[j_wrapped] = arr[next_index];
                arr[next_index] = temp;  //If the elements are out of order, it swaps them using a temporary variable temp.
            }
        }
    }

    // Print sorted section for each core
    printf("Core %d sorted section: ", argv[0][0]);
    for (i = start_index; i < end_index; i++) {
        int i_wrapped = (i >= size) ? (i - size) : i; //Wraps around the index for printing if it exceeds the array size.
        printf("%d ", arr[i_wrapped]);
    }
    printf("\n");
    __sync_fetch_and_add(&now_serving, 1);
    return 0;
}  
