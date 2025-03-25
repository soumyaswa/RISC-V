#include <stdio.h>
#include <stdint.h>
#include "util.h"

#define R1 4  
#define C1 3  
#define R2 3  
#define C2 4  

int main(int argc, char** argv) {
    int A[R1][C1] = { { 1, 2, 3 }, 
                      { 4, 5, 6 }, 
                      { 7, 8, 9 }, 
                      { 10, 11, 12 } };

    int B[R2][C2] = { { 1, 4, 7, 10 }, 
                      { 2, 5, 8, 11 }, 
                      { 3, 6, 9, 12 } };

    static int C[R1][C2] = { 0 };  // Initialize result matrix with zeros

    volatile static uint32_t next_ticket = 0;
    volatile static uint32_t now_serving = 0;
   
    uint32_t id = argv[0][0];       
    uint32_t core_num = argv[0][1]; 

    uint32_t my_ticket = __sync_fetch_and_add(&next_ticket, 1);
    while (my_ticket != now_serving) {}; 

    if (C1 != R2) {
            printf("Matrix multiplication can't be done\n");
      }
  
    else{
    printf("This is core %d:\n",id);
    for (int i = id ; i < R1; i+=core_num) {   //i=0,2 ,i=0,1,2,3
        for (int j = 0; j < C2; j++) {      //j=0,1,2,3
            for (int k = 0; k < C1; k++) {  //k=0,1,2
                C[i][j] += A[i][k] * B[k][j];
            }
           printf("%d ", C[i][j]); 
        }
        
       printf("\n"); 
    }
    
  }
  
    __sync_fetch_and_add(&now_serving, 1);
  
  //synchronization to ensure all cores finish before printing
  while (now_serving != core_num) {}; 

    if (id == 0) {
        printf("\nResultant Matrix:\n");
        for (int i = 0; i < R1; i++) {
            for (int j = 0; j < C2; j++) {
                printf("%d ", C[i][j]);
            }
            printf("\n");
        }
    }

   now_serving = 0;
   next_ticket = 0;
   
    printf("\n");
    return 0;
}
