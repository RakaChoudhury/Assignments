/* k=1,2,3,4,...,10 is given
   let x_{i} be a positive integer and x_{i}≤100.
   Find all the solutions for each of the following equations. 
   x1³+x2³=kx1x2 */    x1³+x2³+x3³=kx1x2x3
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
           //Loop to track x2 from 1 to x1.Checking till x1 will be sufficient.
		   //Checking till 100 is not needed for this equation.Solutions in that range can be directly written.
		   for(int x2=1;x2<=x1;x2++)
           {
               if(((x1*x1*x1)+(x2*x2*x2)-(k*x1*x2))==0)
               {
                    cout<<"\n k="<<k<<",x1="<<x1<<",x2="<<x2;
                    count++;
					//Solution x1=2,x2=4 and x1=4,x2=2 are different solutions.So,both should be considered.
					//But x1=2,x2=2 and x1=2,x2=2 are same.So,these repetitions need to be removed.
                    if(x1!=x2)
                    {   cout<<"\n k="<<k<<",x1="<<x2<<",x2="<<x1;
                        count++;
                    }
                    
               }
           }
       }
   }
   cout<<"\ncount="<<count;
   return 0;
}

