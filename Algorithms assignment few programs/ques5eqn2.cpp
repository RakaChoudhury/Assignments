/* k=1,2,3,4,...,10 is given
   let x_{i} be a positive integer and x_{i}≤100.
   Find all the solutions for each of the following equations. 
   x1³+x2³+x3³=kx1x2x3 */    
#include <iostream>

using namespace std;

int main()
{
   int count=0;
   //Loop to track k from 1 to 10
   for(int k=1;k<=10;k++)
   {
       //Loop to track x1 from 1 to 100
       for(int x1=1;x1<=100;x1++)
       {
           //Loop to track x2 from 1 to 100
           for(int x2=1;x2<=100;x2++)
           {
               //Loop to track x3 from 1 to 100
               for(int x3=1;x3<=100;x3++)
                {
                   if(((x1*x1*x1)+(x2*x2*x2)+(x3*x3*x3)-(k*x1*x2*x3))==0)
                   {
                        cout<<"\n k="<<k<<",x1="<<x1<<",x2="<<x2<<",x3="<<x3;
                        count++;
                   }
                }
           }
       }
   }
   cout<<"\ncount="<<count;
   return 0;
}