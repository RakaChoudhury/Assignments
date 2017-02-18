/**
 *Assignment-1
 * Part 2: Object-oriented programming
 * Question-1:Interface 
*/

interface AdvancedArithmetic{
	int divisor_sum(int n);
}

public class Calculator implements AdvancedArithmetic {
	public static void main(String[] args) {

		int num1= Integer.parseInt(args[0]);
		if(num1>1000)
		{	
			//Value of n must be at most 1000
			System.out.println("Entered number should be less than or equal to 1000.");
			System.exit(0);
		}
		Calculator c=new Calculator();
		int result=c.divisor_sum(num1);
		System.out.println(result);
	}

	public int divisor_sum(int n) {
		int divisorMax = (int)Math.sqrt(n);
		int sum=0;
		for(int i = 1; i <= divisorMax; i++)
		{
			//Add i to sum if i is a divisor of given number.
			//If number divided by i is not i itself,then that other number is a divisor of n too.In that case,add n/i to sum.
			if(n % i == 0)
			{
				sum += i;
				int temp = n/i;
				if(temp!=i)
					sum+=temp;
			}
		}
		return sum;
	}
}