package Utilitaire;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
 
public class DateUtil {    
    @SuppressWarnings("serial")
	private static List<SimpleDateFormat> dateFormats = new ArrayList<SimpleDateFormat>() {
	{
        add(new SimpleDateFormat("yyyy-M-dd hh:mm:ss a"));
        add(new SimpleDateFormat("dd-M-yyyy hh:mm:ss a"));       
        add(new SimpleDateFormat("yyyy/MM/dd"));
        add(new SimpleDateFormat("yyyy-MM-dd"));       
        add(new SimpleDateFormat("dd-MM-yyyy"));  
        add(new SimpleDateFormat("dd/MM/yyyy"));
        add(new SimpleDateFormat("dd MM yyyy"));
    }
    }; 
    @SuppressWarnings("serial")
	private static List<SimpleDateFormat> 
    timeFormats = new ArrayList<SimpleDateFormat>() {
		{
	       add(new SimpleDateFormat("hh:mm a"));
	       add(new SimpleDateFormat("HH:mm"));
		}
    };
    private static String[] mois=new String[] {"Janvier","Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Decembre"};
    /*---------------*\
     * FORMATTER MOIS  
    \*---------------*/
    public static String formatMonth(int month) throws Exception {
    	if(month>0 && month <13) {
    		return mois[month-1];
    	}throw new Exception("Mois invalide!");    	
    }
    public static int formatMonth(String month) throws Exception {
    	month=month.trim();
    	int i=0;
    	while(i<mois.length) {
    		if(mois[i].compareToIgnoreCase(month)==0) {
    			return i+1;
    		}i++;
    	}throw new Exception("Mois invalide!");
    }
    public static String dateFormatter(Date date) throws Exception {
    	Calendar calendar=Calendar.getInstance();
    	calendar.setTime(date);    	
    	return calendar.get(Calendar.DATE)+" "+formatMonth(calendar.get(Calendar.MONTH)+1)+" "+calendar.get(Calendar.YEAR);
    }
    public static Date dateFormatter(String date) throws Exception { 
    	for(int i=0;i<mois.length;i++) {
    		/*System.out.println(date.toLowerCase());
    		System.out.println(String.valueOf(formatMonth(mois[i])));
    		System.out.println(mois[i].toLowerCase());*/
    		date=date.toLowerCase().replace(mois[i].toLowerCase(), String.valueOf(formatMonth(mois[i])));
    	}//System.out.println(date);
    	return convertToDateWithException(date);
    }
    /*--------------------------------------------*\
     * NOMBRE DE MOIS ENTRE DEUX DATES     
    \*--------------------------------------------*/    
    public static int getMonthNumbersBetweenTwoDates(Date dateDebut, Date dateFin) {
    	Calendar calendarDebut=Calendar.getInstance();
    	Calendar calendarFin= Calendar.getInstance();
    	calendarDebut.setTime(dateDebut);
    	calendarFin.setTime(dateFin);  
    	int nbrMoisDansAnneeDifferrent= Math.abs(calendarFin.get(Calendar.YEAR)-calendarDebut.get(Calendar.YEAR))*12;    	
    	int nbrMoisDansUneAnnee= Math.abs(calendarFin.get(Calendar.MONTH)-calendarDebut.get(Calendar.MONTH))+1;    	
		return nbrMoisDansAnneeDifferrent+nbrMoisDansUneAnnee;    	
    }
    /*--------------------------------------------*\
     * TESTEUR DE FORMAT DE DATE
     * TOUS LES FORMES DE DATE EXISTANT COMPATIBLE
    \*--------------------------------------------*/    
       public static Date convertToDate(Object input){
        Date date = null;
        if(null == input) {
            return null;
        }
        for (SimpleDateFormat format : dateFormats){
            try {
            	format.setLenient(false);            
                date =new java.sql.Date(format.parse((String)input).getTime());
                
            }catch (ParseException e) {                
            }catch(ClassCastException ce){         	
            }
            if (date != null) {
                break;
            }
        } 
        return date;
       }
       /*---------------------------------------------\*
        * TESTEUR DE FORMAT DE DATE RETURN EXCEPTION 
        * TOUS LES FORMES DE DATE EXISTANT COMPATIBLE
        * 
       \*---------------------------------------------*/
       public static Date convertToDateWithException(String input) throws Exception{
           Date date = null;
           if(null == input) {
               return null;
           }
           for (SimpleDateFormat format : dateFormats){
               try {
               		format.setLenient(false);            	
                    date = new java.sql.Date(format.parse(input).getTime());
               }catch (ParseException e) {
            	  
               }catch(ClassCastException ce){         	
               }
               if (date != null) {
                   break;
               }
           } 
           if(date==null){
        	   throw new Exception("Format de date invalide!");
           }
           return date;
       }
       /*------------*\
        * TESTEUR DE FORMAT D'HEUR
       \*------------*/
       public static Date convertToTime(Object input) throws Exception{
           Date date = null;
           if(null == input) {
               return null;
           }
           for (SimpleDateFormat format : timeFormats){
               try {
               	format.setLenient(false);
                   date = new java.sql.Date(format.parse((String)input).getTime());
               }catch (ParseException e) {
            	  
               }catch(ClassCastException ce){         	
               }
               if (date != null) {
                   break;
               }
           }          
           return date;
       }
       
       public static Time convertToTime(String input) throws Exception{
           Time time = null;
           if(null == input) {
               return null;
           }
           for (SimpleDateFormat format : timeFormats){
               try {
               	format.setLenient(false);
               	time = new java.sql.Time(format.parse(input).getTime());
               }catch (ParseException e) {
            	  
               }catch(ClassCastException ce){         	
               }
               if (time != null) {
                   break;
               }
           }           
           return time;
       }
       public static Time convertToTimeWithException(String input) throws Exception{
           Time time = null;
           if(null == input) {
               return null;
           }
           for (SimpleDateFormat format : timeFormats){
               try {
               	format.setLenient(false);
               	time = new java.sql.Time(format.parse(input).getTime());
               }catch (ParseException e) {
            	  
               }catch(ClassCastException ce){         	
               }
               if (time != null) {
                   break;
               }
           } 
           if(time == null){
        	   throw new Exception("L'heur que vous taper n'existe pas");
           }
           return time;
       }
       /*---------------------------------------*\
        * order list of date
       \*---------------------------------------*/
   public static ArrayList<Date> orderDates(ArrayList<Date> dateList) {	 
	   for(int i=0; i<dateList.size()-1; i++) {
		   while(dateList.get(i).after(dateList.get(i+1))) {
			   
		   }
	   }	   
	   return null;
   }
       /*---------------------------------------*\
        * lister date dans une semaine
       \*---------------------------------------*/
    public static ArrayList<Date> getDaysOfWeek(Date day) {
    	ArrayList<Date> ret=new ArrayList<Date>();
    	Calendar calendar= Calendar.getInstance();
    			 calendar.setTime(day);
    	Calendar temp = Calendar.getInstance();
    			 temp.setTime(day);
    			 System.out.println(temp.get(Calendar.DAY_OF_WEEK));
    			 for(int i=temp.get(Calendar.DAY_OF_WEEK)-1 ; i>0; i--){    				 
    				 ret.add(new Date(calendar.getTime().getTime()));        				 
    				 calendar.set(Calendar.DATE,calendar.get(Calendar.DATE)-1);    				
    			 }
    			 for(int i=temp.get(Calendar.DAY_OF_WEEK) ; i<6; i++) {    				
    				 temp.set(Calendar.DATE,temp.get(Calendar.DATE)+1);   	
    				 ret.add(new Date(temp.getTime().getTime()));
    			 }
    			 if(temp.get(Calendar.DAY_OF_WEEK)==7)ret.remove(0);
    			 Collections.sort(ret, new Comparator<Date>(){    				   
    		            @Override
    		            public int compare(Date o1, Date o2) {
    		                return o1.compareTo(o2);
    		            }
		         });
    	return ret;
    }
	    /*---------------------------------------*\
	     * CONVERT MINUTE TO HOUR
	    \*---------------------------------------*/
    public static long convertMinuteToHours(long minute) {
		return minute/60;    	
    }
       /*---------------------------------------*\
        * TEST DATE WEEK END
       \*---------------------------------------*/
    public static boolean weekend(Date date)	{   
    	Calendar calendrier=Calendar.getInstance();
			calendrier.setTime(date);
   		if(calendrier.get(Calendar.DAY_OF_WEEK)== Calendar.SUNDAY || calendrier.get(Calendar.DAY_OF_WEEK)==Calendar.SATURDAY){
   			return true;
   		}return false;
   	}
    /*---------------------------------------*\
     * RETOURNE LES DATES ENTRE DEUX DATES SANS WEEKEND
    \*---------------------------------------*/
    public static ArrayList<Date>getDateBetweenIntervalDateWithOutWeekEnd(Date startDate,Date endDate){
    	ArrayList<Date> ret=new ArrayList<Date>();    	
    	//{{ 
    	Calendar calendarStart=Calendar.getInstance(),
    			 calendarEnd=Calendar.getInstance();
	    		 calendarStart.setTime(startDate);
	    		 calendarEnd.setTime(endDate);	    		 
		 //}}
		    	while(calendarStart.before(calendarEnd)){
		    		calendarStart.set(Calendar.DATE,calendarStart.get(Calendar.DATE)+1);		    		
		    		if(!weekend(new java.sql.Date(calendarStart.getTime().getTime()))){
		    			if(calendarStart.before(calendarEnd)){
		    				ret.add(new java.sql.Date(calendarStart.getTime().getTime()));	
		    			}
		    		} 	   		
		    	}
    	return ret;
    }
    public static ArrayList<LocalDateTime> getDateTimeIntervalWithOutWeekEnd(LocalDateTime startDateTime,
    																		 LocalDateTime endDateTime) {
		return null;    	
    }
    /*------------------------------------------------*\
     *DUREE ENTRE DEUX TEMPS DONNEES
     *VALEUR DE RETOUR EN MINUTE || SECONDE || MILLIS 
    \*------------------------------------------------*/
    public static Duration getDurationBetweenTimesInterval(Time timeStart,Time timeEnd) {
    	return Duration.between(timeStart.toLocalTime(),timeEnd.toLocalTime());    	
    }
    /*---------------------------------*\
     *TEMP ENTRE DEUX HORRAIRE DONNEES
     *VALEUR DE RETOUR EN java.sql.TIME
    \*---------------------------------*/
    public static Time getTimeBetweenTimesIntervale(Time timeStart,Time timeEnd){
    	return new Time(-getDurationBetweenTimesInterval(timeStart,timeEnd).toMillis());
    }
    /*---------------------------------*\
     *TEMP ENTRE DEUX TEMPS DONNEES
     *VALEUR DE RETOUR DURATION
    \*---------------------------------*/
    public static Duration getTimeBetweenTimesIntervale(LocalDateTime start,LocalDateTime end) {    	
    	return Duration.between(start,end);
    }    
    /*---------------------------------*\
     *to localDateTime date & TIME
    \*---------------------------------*/
    public static  LocalDateTime ToLocalDT(Date date,Time time) {
    	return LocalDateTime.of(date.toLocalDate(), time.toLocalTime());
    }
    /*---------------------------------*\
     *to localDateTime time
    \*---------------------------------*/
    public static  LocalDateTime ToLocalDT(Time time) {
    	return LocalDateTime.of(LocalDate.now(), time.toLocalTime());
    }
}   		
   		
    
