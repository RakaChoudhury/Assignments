import java.util.Arrays;
/**
 * Assignment-1
 * Part 1: Basic data structures 
 * Question-1:Game of Thrones Puzzle 
 */

public class ques1 {
	public static void main(String[] args){
        //String temp is created using join function used to handle multiple words (with spaces in between) that might have been entered as arguments
		String temp = String.join("", args);
		checkAnagram(temp);
	}
	static void checkAnagram(String str)
	{
		//Initially setting a boolean variable named 'anagram' as true

		boolean anagram = true;

		if(str.length()!= ("silent").length())
		{
			//Setting boolean variable-anagram as false if the lengths of the 2 strings don't match
			anagram = false;
		}
		else
		{
			//Converting the string "SILENT" to character array - s1array
			char[] s1Array = new String("silent").toCharArray();
			//Changing the case of characters of str and converting it to character array - s2array
			char[] s2Array = str.toLowerCase().toCharArray();

			//Sorting both s1Array and s2Array

			Arrays.sort(s1Array);
			Arrays.sort(s2Array);

			//Checking whether s1Array and s2Array are equal
			anagram = Arrays.equals(s1Array, s2Array);
		}

		//Result

		if(anagram)
			System.out.println("YES");
		else
			System.out.println("NO");
	}
}

