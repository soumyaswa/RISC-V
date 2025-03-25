#include <stdint.h>
#include <stdio.h>
//#include "util.h"

void bubbleSort(int arr[], int start, int end, int segmentSize) {
    //printf("segmentSize = %d, start_idx = %d, end_idx = %d", segmentSize, start, end);
    for (int i = 0; i < segmentSize; i++) {
        for (int j = start; j < end - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                // swap arr[j] and arr[j+1]
                int tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
            }
        }
    }
}

void parallelBubbleSort(int arr[], int size, int id, int core_num, int extraSeg, int segmentSize){
    int newsegmentSize;
    int start, end;
    start = id * segmentSize;

    if (extraSeg == 1 && id == core_num - 1) {
        newsegmentSize = segmentSize + (size % core_num);
        end = start + newsegmentSize;
        bubbleSort(arr, start, end, newsegmentSize);
    }
    else {
        end = (id + 1) * segmentSize;
        bubbleSort(arr, start, end, segmentSize);
    }
}

int main(int argc, char** argv) {
    // synchronization variables
    volatile static uint32_t next_ticket = 0;
    volatile static uint32_t now_serving = 0;
    volatile static uint32_t flag = 0;
    volatile static uint32_t sync_f = 0;
    volatile static uint32_t count = 0;
    static uint32_t iter = 1;

    volatile static uint32_t array[13] = {9, 4, 2, 3, 6, 1, 10,  5, 13 , 7, 8, 0, 11};

    uint32_t id, core_num;
    int i;
    uint32_t extraSeg = 0;
    int size = sizeof(array) / sizeof(array[0]); // size = 12
    id = argv[0][0];
    core_num = argv[0][1];
    int segmentSize = size /core_num;
     // TODO check if argv will be changed on master branch.
    
    

    printf("id = %d and core_num = %d\n", id, core_num);

    if (size % core_num != 0) {// last segment will have more element
        extraSeg = 1;
    }

    while(flag != 1) {
     uint32_t my_ticket = __sync_fetch_and_add(&next_ticket, 1);
     count = 0;
        sync_f = 0;
        // synchronize with other cores and wait until it is this core's turn
        while (my_ticket != now_serving) {
        };

        if (id == 0) {
            // print the array every time we enter this loop
            printf("iter = %d \n", iter);
            for (i = 0; i < size; i++)
                printf("%d \t", array[i]);
            printf("\n");
        }

        parallelBubbleSort(array, size, id, core_num, extraSeg, segmentSize);
        printf("Printing arrays from %d core\n", argv[0][0]);

        // I am done
        __sync_fetch_and_add(&now_serving, 1);

        while (now_serving != core_num) { // wait for all cores to finish task
        };

        if (id == 0) { // printing sorted array from core 0
            printf("BEG2 \n");
            for (i = 0; i < size; i++) {
                printf("%d \t", array[i]);
            }
            printf("\n");
           for (i = 1; i < core_num; i++) {
                if (array[(i * segmentSize) - 1] > array[i * segmentSize]){
                    int tmp = array[(i * segmentSize) - 1];
                    array[(i * segmentSize) - 1] = array[i * segmentSize];
                    array[i * segmentSize] = tmp;
                    count++;
                }
            }
            sync_f = 1;  //sync flag
          
        }

        while (sync_f == 0) {
        }; // implementing wait for other cores

        if (count == 0) {
            flag = 1; // if there is no boundary elements to sort, set the flag and exit this loop
        }
        
        // re-initializing the ticket values before each iteration
        now_serving = 0;
        next_ticket = 0;
        iter++;
    }
    printf("\n");
    return 0;

}


