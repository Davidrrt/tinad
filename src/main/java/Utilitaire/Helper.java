package Utilitaire;

public class Helper {
	public static boolean isLetterWithSpaceOnly(String string){
		string=string.trim();		
		int i=0;
		while(i<string.length()){
			if(!Character.isLetter(string.charAt(i))){
				if(string.charAt(i)==' '){
					i++;
				}else{
				return false;}
			}else{
				i++;
			}
		}
		return true;
	}
	public static boolean isLetterAndDigitWithSpaceOnly(String string){
		string=string.trim();		
		int i=0;
		while(i<string.length()){
			if(!Character.isLetter(string.charAt(i))){
				if(string.charAt(i)==' ' || Character.isDigit(string.charAt(i))){
					i++;
				}else{
				return false;}
			}else{
				i++;
			}
		}
		return true;
	}
}
