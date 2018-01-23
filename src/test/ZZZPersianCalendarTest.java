package test;

import util.PersianCalendare;
import util.ShamsiDateConverter;
import exceptions.InvalidDate;
import exceptions.InvalidMiladiDate;
import exceptions.InvalidShamsiDate;



public class ZZZPersianCalendarTest {

	public static void main(String[] args) {
		try {
			System.out.println(PersianCalendare.shamsiToMiladiLongReturn(ShamsiDateConverter.getCurrentShamsiDate()));
			System.out.println(PersianCalendare.shamsiToMiladiLongReturn(1392615));
			System.out.println(PersianCalendare.shamsiToMiladiStringReturn(ShamsiDateConverter.getCurrentShamsiDate()));
		} catch (InvalidShamsiDate e) {
			e.printStackTrace();
		}
		
		try {
			System.out.println(PersianCalendare.miladiToShamsiLongReturn("2013/9/6"));
			System.out.println(PersianCalendare.miladiToShamsiLongReturn(20130906));
		} catch (InvalidMiladiDate e) {
			e.printStackTrace();
		}
		
		try {
			System.out.println(PersianCalendare.miladiToShamsiStringReturn("2013/9/6"));
			System.out.println(PersianCalendare.miladiToShamsiStringReturn(2030906));
		} catch (InvalidMiladiDate e) {
			e.printStackTrace();
		}
		
		System.out.println(PersianCalendare.getCurrentMiladiDate());
		System.out.println(PersianCalendare.getCurrentShamsiDate());
		System.out.println(PersianCalendare.getCurrentTime());
		
		try {
			System.out.println(PersianCalendare.getLongValueOfDate(PersianCalendare.getCurrentMiladiDate()));
		} catch (InvalidDate e) {
			e.printStackTrace();
		}
	}

}
