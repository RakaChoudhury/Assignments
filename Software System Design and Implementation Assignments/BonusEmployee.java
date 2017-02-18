/**
 * Assignment-1
 * Part 2:Object-oriented programming
 * Question-: Abstract class
 */

abstract class Employee {
	private String name, address;
	protected int basicSalary;

	public String getName(){ return name;}
	public String getAddress(){ return address;}
	public int getBasicSalary(){ return basicSalary;}
	public void setAddress(String add){ address = add; }
	public void setName(String name){ this.name = name; }
	public void setBasicSalary(int  sal){ basicSalary = sal; }
	public abstract int getMonthlySalary();
}
public class BonusEmployee extends Employee {

	int monthlyBonus;
    
	//Assign some bonus amount entered by user to monthlyBonus
	public void setmonthlyBonus(int b){
		monthlyBonus = b;
	}

	//Calculate monthly salary when basic salary per month and monthly bonus are stored in basicSalary and monthlyBonus respectively
	public int getMonthlySalary(){
		return (basicSalary + monthlyBonus);
	}

	//Calculate yearly bonus when bonus per month is stored in monthlyBonus
	public int getyearlybonus(){
		return (monthlyBonus*12);
	}

	public static void main(String[] args){

		int basic= Integer.parseInt(args[0]);
		int bonus= Integer.parseInt(args[1]);
		BonusEmployee e=new BonusEmployee();
		e.setBasicSalary(basic);
		e.setmonthlyBonus(bonus);
		int monthlySalary=e.getMonthlySalary();
		int yearlyBonus=e.getyearlybonus();
		System.out.println(monthlySalary);
		System.out.println(yearlyBonus);
	}
}
