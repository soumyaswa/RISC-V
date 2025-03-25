#include <stdint.h> 
#include <stdio.h> 
#include "util.h" 
int main(int argc, char** argv) {   

  int n = 10; 
  int static n1 = 0, n2 = 1, n3 ;  
    
  volatile static uint32_t next_ticket = 0;
  volatile static uint32_t now_serving = 0;
  uint32_t my_ticket = __sync_fetch_and_add(&next_ticket, 1); 
  
  while(my_ticket != now_serving){
  };  
          
  if(argv[0][0] == 0) {
  printf("This is hart %d of %d harts!\n", argv[0][0], argv[0][1]);  
  printf("Fibonacci Series for first %d numbers :\n", n/2);
  for (int i = 0; i < n/2; i++) {
   printf("%d\n", n1);
   n3 = n1 + n2;
   n1 = n2;
   n2 = n3;
   }
  }
  else {
  printf("This is hart %d of %d harts!\n", argv[0][0], argv[0][1]);  
  printf("Fibonacci Series for second %d numbers :\n", n/2);
  for (int i = 0; i < n/2; i++) {
   printf("%d\n", n1);
   n3 = n1 + n2;
   n1= n2;
   n2 = n3;
   }
  }
  __sync_fetch_and_add(&now_serving, 1);   
           
  return 0;                             
}

