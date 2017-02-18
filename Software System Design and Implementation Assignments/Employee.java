import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

/**
 * Assignment-2
 * Question-2: Employee
 */

public abstract class Employee {
	private String lastName;
	private String firstName;
	private Date employmentStartDate;

	public Employee(String lname, String fname, Date start){
		firstName = fname;
		lastName = lname;
		employmentStartDate = start;
	}

	//setters
	public void setFirstName(String fname) {
		firstName = fname;
	}
	public void setLastName(String lname) {
		lastName = lname;
	}
	public void setStart(Date start) {                                 
		employmentStartDate = start;
	}

	//getters
	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}
	public Date getStart() {
		return employmentStartDate;
	}

	public abstract int getSalaryPerPayPeriod();
	public abstract int calculateVacationHours();
}

class FullTimeEmployee extends Employee
{
	int monthlySalary;
	public FullTimeEmployee(String lname, String fname, Date start2) {
		super(lname, fname,start2);
	}
    
	//setters
	public void setMonthlySalary(int sal) {

		monthlySalary=sal;
	}

	//getters
	public int getmonthlySalary() {

		return monthlySalary;
	}
	
	@Override
	public int getSalaryPerPayPeriod() {

		return monthlySalary;
	}

	@Override
	public int calculateVacationHours() {
	
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date currentDate = new Date();

		long diff =(currentDate.getTime()-getStart().getTime()); 
		
		long diffDays = diff / (24 * 60 * 60 * 1000);
		long yearsOfService=diffDays /365 ;
		
		//instead of directly comparing the 2 years,number of days has been used to cover boundary conditions
		
		if(yearsOfService<2)
			return 40;
		else if(yearsOfService>=2 && yearsOfService<5)
			return 80;
		else if(yearsOfService>=5 && yearsOfService<10)
			return 120;
		else if(yearsOfService>=10)
			return 160;
		else
			return 0;
	}
}

class HourlyEmployee extends Employee
{
	int hourlyRate,hoursWorked;
	
	public HourlyEmployee(String lname, String fname, Date start1) {
		super(lname, fname, start1);
	}

	//setters
	public void setHourlyRate(int rate) {

		hourlyRate=rate;
	}
	public void setHoursWorked(int hours) {

		hoursWorked=hours;
	}

	//getters
	public int gethourlyRate() {

		return hourlyRate;
	}
	public int gethoursWorked() {

		return hoursWorked;
	}

	@Override
	public int getSalaryPerPayPeriod() {

		return hourlyRate*hoursWorked;
	}

	@Override
	public int calculateVacationHours() {
		return 0;
	}

}

class EmployeeDemo{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String fn1,fn2,ln1,ln2;
		Date start1,start2,temp=null;
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");

		//Input full time employee details
		System.out.println("Please enter full time employee's first name:");
		fn1=sc.nextLine();
		System.out.println("Please enter full time employee's last name:");
		ln1=sc.nextLine();
		System.out.println("Please enter full time employee's monthly salary:");
		int sal=sc.nextInt();
		System.out.println("Please enter full time employee's start date(mm/dd/yyyy):");
		try
		{
			temp= (Date) df.parse(sc.next());
		}
		catch(ParseException e)
		{
			System.out.println("Please enter a valid date! Format is mm/dd/yyyy");
		}

		start1 = new Date(temp.getTime());
		
		//Input H  ourly employee details
		System.out.println("Please enter hourly employee's first name:");
		fn2=sc.nextLine();
		fn2=sc.nextLine();
		System.out.println("Please enter hourly employee's last name:");
		ln2=sc.nextLine();
		System.out.println("Please enter hourly employee's hourly rate:");
		int rate=sc.nextInt();
		System.out.println("Please enter hourly employee's number of hours worked:");
		int hours=sc.nextInt();
		System.out.println("Please enter hourly employee's start date(mm/dd/yyyy):");
		try
		{
			temp= (Date) df.parse(sc.next());
		}
		catch(ParseException e)
		{
			System.out.println("Please enter a valid date! Format is mm/dd/yyyy");
		}

		start2 = new Date(temp.getTime());

		FullTimeEmployee e1=new FullTimeEmployee(fn1,ln1,start1);
		e1.setMonthlySalary(sal);

		HourlyEmployee e2=new HourlyEmployee(fn2,ln2,start2);
		e2.setHourlyRate(rate);
		e2.setHoursWorked(hours);
		
		System.out.println("Full time employee's salary per pay period="+e1.getSalaryPerPayPeriod());
		System.out.println("Full time employee's vacation hours="+e1.calculateVacationHours());
		System.out.println("Hourly employee's salary per pay period="+e2.getSalaryPerPayPeriod());
		System.out.println("Hourly employee's vacation hours="+e2.calculateVacationHours());

	}
}