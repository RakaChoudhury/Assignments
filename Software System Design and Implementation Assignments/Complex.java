import java.util.Scanner;

/**
 * Assignment-2
 * Question-2: Complex number
 */

public class Complex {
	private double real;
	private double img;

	public static Complex createComplex(String str){
		//Takes string representation of complex number and constructs a corresponding complex number
		
		String[] parts = str.split("\\+");
		String part2 = parts[1];
		String[] temp = parts[1].split("i");

		Complex c=new Complex(Integer.parseInt(parts[0]),Integer.parseInt(temp[0]));
		return c;
	}

	private Complex(double real, double imag){
		this.real= real;
		this.img=imag;
	}

	public double getReal(){
		//Returns real part of the complex number
		
		return real; 
	}

	public double getImaginary(){
		//Returns imaginary part of the complex number
		
		return img; 
	}

	public Complex add(Complex rhs) {
		//Returns sum of 2 complex numbers
		
		double real=rhs.real+this.getReal();
		double img=rhs.img+this.getImaginary();
		Complex sum=new Complex(real, img);
		return sum;
	}

	public Complex subtract(Complex rhs) {
		//Returns difference of 2 complex numbers
		
		double real=rhs.real-this.getReal();
		double img=rhs.img-this.getImaginary();
		Complex difference=new Complex(real, img);
		return difference; 
	}

	public Boolean equals(Complex rhs) {
		//Checks if 2 complex numbers are equal
		
		if((this.real==rhs.real) && (this.img==rhs.img))
			return true;
		else 
			return false;
	}

	public String toString() {
		//Display complex number in appropriate format
		
		if(img<0)
			return real + " "+ img + "i"; 
		else
			return real + "+" + img + "i"; 
	}
}
class ComplexDemo{
	public static void main(String[] args) {
		
		//(i) Creates two complex numbers with parameters obtained from the user
		Complex c1=Complex.createComplex(args[0]);
		Complex c2=Complex.createComplex(args[1]);
		
		Scanner sc = new Scanner(System.in);
		
		//(ii) Demonstrates the working of the add, subtract, equals and toString functions on them.
		System.out.println("You may perform one of the following opperations:");
		System.out.println("1. Add\n 2. Subtract first entered number from second entered number \n 3. Subtract second entered number from first entered number \n 4.Check equality \n 5. Exit");
		int choice;
		do{
			System.out.println("Please enter operation number:");
			choice=sc.nextInt();
		
			switch(choice)
			{
				case 1:Complex sum=c1.add(c2);
				System.out.println(sum.toString());
				break;
				
				case 2:Complex diff1=c1.subtract(c2);
				System.out.println(diff1.toString());
				break;
				
				case 3:Complex diff2=c2.subtract(c1);
				System.out.println(diff2.toString());
				break;
				
				case 4:Boolean res=c1.equals(c2);
				if(res==true)
					System.out.println("Entered complex numbers are equal.");
				else
					System.out.println("Entered complex numbers are not equal.");
				break;
				
				case 5:
					System.out.println("Exiting.");
					System.exit(0);
					
				default:
					System.out.println("Invalid Input.Please enter an integer from 1 to 4.");
					break;
			}
		}while(choice!=5);
	}
}