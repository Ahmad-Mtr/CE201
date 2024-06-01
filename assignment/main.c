#include<stdio.h>
#include<conio.h>
#include<math.h>
#include<stdlib.h>
//Function Definitions
int modulus(int x, int y){
  int mod = 0;
  if (y == 0){
  printf("\nError: Please enter another value of Y.");
  }
  mod = x % y;
  return mod;
}

int power(int x, int y){
 int p;
 p = pow(x,y);
 return p;
}

// Global variabels
int Loop = 1;

// Main Program
int main(){
  int X;
  int Y;
  char operation;
  int Results;
  printf("\nPlease enter first number : ");
  scanf("%d",&X);
  printf("\nPlease enter second number : ");
  scanf("\n%d",&Y);
  while(Loop){
     printf("\nPlease enter the operation : ");
     scanf("\n%c",&operation);
     switch(operation){
        case '%': 
          Results = modulus(X,Y);
          printf("%u mod %u = %u \n",X,Y,Results);
          break;

        case '^': 
          Results = power(X,Y);
          printf("\n%u to the power %u = %u \n",X,Y,Results);
          break;
        case 'q':
          exit(0);
         break;
        
        default : 
          system("cls");
     }
  }
}
