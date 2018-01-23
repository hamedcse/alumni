package util;

import exceptions.InvalidDate;
import exceptions.InvalidMiladiDate;
import exceptions.InvalidShamsiDate;

public class PersianCalendare {
	
	
	public static String getCurrentTime() {
    	return ShamsiDateConverter.getCurrentTime();
	}
	public static String getCurrentShamsiDate() {
    	return ShamsiDateConverter.getCurrentShamsiDate();
	}
	public static long getCurrentShamsiDateInLong() throws InvalidDate {
    	return getLongValueOfDate(getCurrentShamsiDate());
	}
	public static String getCurrentMiladiDate() {
		String nonStandardDate = new CalendarTool().getGregorianDate();
	    
		String year , month , day ;  
	    
	    String[] parts = nonStandardDate.split("/");
		year = parts[0];month = parts[1];day = parts[2];
		
		if(day.length() < 2)	day = "0"+day;
    	if(month.length() < 2)	month = "0"+month;
	    
    	return (year+"/"+month+"/"+day);
	}
	public static long getLongValueOfDate(String date) throws InvalidDate{
		try {
			if(date.indexOf("/") != -1){
				String[] parts = date.split("/");
				int year,month,day;
				year = Integer.parseInt(parts[0]);
				month = Integer.parseInt(parts[1]);
				day = Integer.parseInt(parts[2]);
				
				String resultDay = ""+day, resultMonth = ""+month , resultYear = ""+year;
		    	if(String.valueOf(day).length() < 2)	resultDay = "0"+day;
		    	if(String.valueOf(month).length() < 2)	resultMonth = "0"+month;
		    	
		    	return Long.parseLong(resultYear+resultMonth+resultDay);
			}else{
				return Long.parseLong(date);
			}
		} catch (Exception e) {
			throw new InvalidDate();
		}
		
	}
//===================================================================================================================
	public static long shamsiToMiladiLongReturn(String shamsi) throws InvalidShamsiDate {
		try {
			String[] parts = shamsi.split("/");
			int year,month,day;
			year = Integer.parseInt(parts[0]);
			month = Integer.parseInt(parts[1]);
			day = Integer.parseInt(parts[2]);
			
			CalendarTool cal = new CalendarTool();
			cal.setIranianDate(year, month, day);
			String miladi = cal.getGregorianDate();
			
			String[] parts2 = miladi.split("/");
			int mYear,mMonth,mDay;
			mYear = Integer.parseInt(parts2[0]);
			mMonth = Integer.parseInt(parts2[1]);
			mDay = Integer.parseInt(parts2[2]);
			
			String resultDay = ""+mDay, resultMonth = ""+mMonth , resultYear = ""+mYear;
	    	if(String.valueOf(mDay).length() < 2)	resultDay = "0"+mDay;
	    	if(String.valueOf(mMonth).length() < 2)	resultMonth = "0"+mMonth;
	    	
	    	return Long.parseLong(resultYear+resultMonth+resultDay);
		} catch (Exception e) {
			throw new InvalidShamsiDate();
		}
	}
	
	public static long shamsiToMiladiLongReturn(long shamsi) throws InvalidShamsiDate {
		
		if(String.valueOf(shamsi).length() != 8)	throw new InvalidShamsiDate();
		try {
			String shamsiStr = String.valueOf(shamsi);
			int year,month,day;
			year = Integer.parseInt(shamsiStr.substring(0, 4));
			month = Integer.parseInt(shamsiStr.substring(4, 6));
			day = Integer.parseInt(shamsiStr.substring(6, 8));
			
			CalendarTool cal = new CalendarTool();
			cal.setIranianDate(year, month, day);
			String miladi = cal.getGregorianDate();
			
			String[] parts2 = miladi.split("/");
			int mYear,mMonth,mDay;
			mYear = Integer.parseInt(parts2[0]);
			mMonth = Integer.parseInt(parts2[1]);
			mDay = Integer.parseInt(parts2[2]);
			
			String resultDay = ""+mDay, resultMonth = ""+mMonth , resultYear = ""+mYear;
	    	if(String.valueOf(mDay).length() < 2)	resultDay = "0"+mDay;
	    	if(String.valueOf(mMonth).length() < 2)	resultMonth = "0"+mMonth;
	    	
	    	return Long.parseLong(resultYear+resultMonth+resultDay);
		} catch (Exception e) {
			throw new InvalidShamsiDate();
		}
	}
	
	public static String shamsiToMiladiStringReturn(String shamsi) throws InvalidShamsiDate {
		try {
			String[] parts = shamsi.split("/");
			int year,month,day;
			year = Integer.parseInt(parts[0]);
			month = Integer.parseInt(parts[1]);
			day = Integer.parseInt(parts[2]);
			
			CalendarTool cal = new CalendarTool();
			cal.setIranianDate(year, month, day);
			String miladi = cal.getGregorianDate();
			
			String[] parts2 = miladi.split("/");
			int mYear,mMonth,mDay;
			mYear = Integer.parseInt(parts2[0]);
			mMonth = Integer.parseInt(parts2[1]);
			mDay = Integer.parseInt(parts2[2]);
			
			String resultDay = ""+mDay, resultMonth = ""+mMonth , resultYear = ""+mYear;
	    	if(String.valueOf(mDay).length() < 2)	resultDay = "0"+mDay;
	    	if(String.valueOf(mMonth).length() < 2)	resultMonth = "0"+mMonth;
	    	
	    	return resultYear+"/"+resultMonth+"/"+resultDay;
		} catch (Exception e) {
			throw new InvalidShamsiDate();
		}
	}

	public static String shamsiToMiladiStringReturn(long shamsi) throws InvalidShamsiDate {
		if(String.valueOf(shamsi).length() != 8)	throw new InvalidShamsiDate();
		try {
			String shamsiStr = String.valueOf(shamsi);
			int year,month,day;
			year = Integer.parseInt(shamsiStr.substring(0, 4));
			month = Integer.parseInt(shamsiStr.substring(4, 6));
			day = Integer.parseInt(shamsiStr.substring(6, 8));
			
			CalendarTool cal = new CalendarTool();
			cal.setIranianDate(year, month, day);
			String miladi = cal.getGregorianDate();
			
			String[] parts2 = miladi.split("/");
			int mYear,mMonth,mDay;
			mYear = Integer.parseInt(parts2[0]);
			mMonth = Integer.parseInt(parts2[1]);
			mDay = Integer.parseInt(parts2[2]);
			
			String resultDay = ""+mDay, resultMonth = ""+mMonth , resultYear = ""+mYear;
	    	if(String.valueOf(mDay).length() < 2)	resultDay = "0"+mDay;
	    	if(String.valueOf(mMonth).length() < 2)	resultMonth = "0"+mMonth;
	    	
	    	return resultYear+"/"+resultMonth+"/"+resultDay;
		} catch (Exception e) {
			throw new InvalidShamsiDate();
		}
	}
	
//============================================================================================================================
	
	public static long miladiToShamsiLongReturn(String miladi) throws InvalidMiladiDate {
		try {
			String[] parts = miladi.split("/");
			int year,month,day;
			year = Integer.parseInt(parts[0]);
			month = Integer.parseInt(parts[1]);
			day = Integer.parseInt(parts[2]);
			
			CalendarTool cal = new CalendarTool();
			cal.setGregorianDate(year, month, day);
			String shamsi = cal.getIranianDate();
			
			String[] parts2 = shamsi.split("/");
			int iYear,iMonth,iDay;
			iYear = Integer.parseInt(parts2[0]);
			iMonth = Integer.parseInt(parts2[1]);
			iDay = Integer.parseInt(parts2[2]);
			
			String resultDay = ""+iDay, resultMonth = ""+iMonth , resultYear = ""+iYear;
	    	if(String.valueOf(iDay).length() < 2)	resultDay = "0"+iDay;
	    	if(String.valueOf(iMonth).length() < 2)	resultMonth = "0"+iMonth;
	    	
	    	return Long.parseLong(resultYear+resultMonth+resultDay);
		} catch (Exception e) {
			throw new InvalidMiladiDate();
		}
	}
	
	public static long miladiToShamsiLongReturn(long miladi) throws InvalidMiladiDate {
		if(String.valueOf(miladi).length() != 8)	throw new InvalidMiladiDate();
		try {
			String miladiStr = String.valueOf(miladi);
			int year,month,day;
			year = Integer.parseInt(miladiStr.substring(0, 4));
			month = Integer.parseInt(miladiStr.substring(4, 6));
			day = Integer.parseInt(miladiStr.substring(6, 8));
			
			CalendarTool cal = new CalendarTool();
			cal.setGregorianDate(year, month, day);
			String shamsi = cal.getIranianDate();
			
			String[] parts2 = shamsi.split("/");
			int iYear,iMonth,iDay;
			iYear = Integer.parseInt(parts2[0]);
			iMonth = Integer.parseInt(parts2[1]);
			iDay = Integer.parseInt(parts2[2]);
			
			String resultDay = ""+iDay, resultMonth = ""+iMonth , resultYear = ""+iYear;
	    	if(String.valueOf(iDay).length() < 2)	resultDay = "0"+iDay;
	    	if(String.valueOf(iMonth).length() < 2)	resultMonth = "0"+iMonth;
	    	
	    	return Long.parseLong(resultYear+resultMonth+resultDay);
		} catch (Exception e) {
			throw new InvalidMiladiDate();
		}
	}
	
	public static String miladiToShamsiStringReturn(String miladi) throws InvalidMiladiDate {
		try {
			String[] parts = miladi.split("/");
			int year,month,day;
			year = Integer.parseInt(parts[0]);
			month = Integer.parseInt(parts[1]);
			day = Integer.parseInt(parts[2]);
			
			CalendarTool cal = new CalendarTool();
			cal.setGregorianDate(year, month, day);
			String shamsi = cal.getIranianDate();
			
			String[] parts2 = shamsi.split("/");
			int iYear,iMonth,iDay;
			iYear = Integer.parseInt(parts2[0]);
			iMonth = Integer.parseInt(parts2[1]);
			iDay = Integer.parseInt(parts2[2]);
			
			String resultDay = ""+iDay, resultMonth = ""+iMonth , resultYear = ""+iYear;
	    	if(String.valueOf(iDay).length() < 2)	resultDay = "0"+iDay;
	    	if(String.valueOf(iMonth).length() < 2)	resultMonth = "0"+iMonth;
	    	
	    	return resultYear+"/"+resultMonth+"/"+resultDay;
		} catch (Exception e) {
			throw new InvalidMiladiDate();
		}
	}
	public static String miladiToShamsiStringReturn(long miladi) throws InvalidMiladiDate {
		if(String.valueOf(miladi).length() != 8)	throw new InvalidMiladiDate();
		try {
			String miladiStr = String.valueOf(miladi);
			int year,month,day;
			year = Integer.parseInt(miladiStr.substring(0, 4));
			month = Integer.parseInt(miladiStr.substring(4, 6));
			day = Integer.parseInt(miladiStr.substring(6, 8));
			
			CalendarTool cal = new CalendarTool();
			cal.setGregorianDate(year, month, day);
			String shamsi = cal.getIranianDate();
			
			String[] parts2 = shamsi.split("/");
			int iYear,iMonth,iDay;
			iYear = Integer.parseInt(parts2[0]);
			iMonth = Integer.parseInt(parts2[1]);
			iDay = Integer.parseInt(parts2[2]);
			
			String resultDay = ""+iDay, resultMonth = ""+iMonth , resultYear = ""+iYear;
	    	if(String.valueOf(iDay).length() < 2)	resultDay = "0"+iDay;
	    	if(String.valueOf(iMonth).length() < 2)	resultMonth = "0"+iMonth;
	    	
	    	return resultYear+"/"+resultMonth+"/"+resultDay;
		} catch (Exception e) {
			throw new InvalidMiladiDate();
		}
	}
	
}
