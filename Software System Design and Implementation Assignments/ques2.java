/**
 * Assignment-1
 * Part 1: Basic data structures 
 * Question-2:Sherlock’s Square 
 *
 */
public class ques2 {
	public static void main(String[] args) {
		int num1,num2,count=0;
		try{
			if(args[0]==null);
		}
		catch(ArrayIndexOutOfBoundsException e){
			System.out.println("Please enter 2 valid numbers as command line parameters.");
			System.exit(0);
		}
		num1= Integer.parseInt(args[0]);
		num2= Integer.parseInt(args[1]);
		//swap the 2 numbers if user entered the greater number as first argument
		if(num1>num2)
		{
			num1 = num1 + num2;
			num2 = num1 - num2;
			num1 = num1 - num2;
		}
		for(int i=num1;i<=num2;i++) {
			int sqrt = ((int) Math.sqrt(i));
			if(sqrt*sqrt == i)
				count++;		
		}
		System.out.println(count);
	}
}
