package util;

import java.util.Date;
import java.util.StringTokenizer;

public class ShamsiDateConverter {

	public String gregorian_to_jalali(int gy1, int gm1, int gd1, int week) {
		gy1 += 1900;
		gm1 += 1;

		int g_days_in_month[] = new int[] { 31, 28, 31, 30, 31, 30, 31, 31, 30,
				31, 30, 31 };
		int j_days_in_month[] = new int[] { 31, 31, 31, 31, 31, 31, 30, 30, 30,
				30, 30, 29 };
		int gy = gy1 - 1600;
		int gm = gm1 - 1;
		int gd = gd1 - 1;
		int g_day_no = 365 * gy + doubleToInt((gy + 3) / 4)
				- doubleToInt((gy + 99) / 100) + doubleToInt((gy + 399) / 400);
		int i;
		for (i = 0; i < gm; ++i)
			g_day_no += g_days_in_month[i];
		if (gm > 1 && ((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0)))
			g_day_no++;
		g_day_no += gd;
		int j_day_no = g_day_no - 79;
		int j_np = doubleToInt(j_day_no / 12053);
		j_day_no = j_day_no % 12053;
		int jy = 979 + 33 * j_np + 4 * doubleToInt(j_day_no / 1461);
		j_day_no %= 1461;
		if (j_day_no >= 366) {
			jy += doubleToInt((j_day_no - 1) / 365);
			j_day_no = (j_day_no - 1) % 365;
		}
		for (i = 0; i < 11 && j_day_no >= j_days_in_month[i]; ++i)
			j_day_no -= j_days_in_month[i];
		int jm = i + 1;
		String s = null;
		String w = null;
		switch (week) {
		case 0:
			w = "يکشنبه";
			break;
		case 1:
			w = "دوشنبه";
			break;
		case 2:
			w = "سه شنبه";
			break;
		case 3:
			w = "چهارشنبه";
			break;
		case 4:
			w = "پنجشنبه";
			break;
		case 5:
			w = "جمعه";
			break;
		case 6:
			w = "شنبه";
			break;
		}
		switch (jm) {
		case 1:
			s = "فروردين";
			break;
		case 2:
			s = "ارديبهشت";
			break;
		case 3:
			s = "خرداد";
			break;
		case 4:
			s = "تير";
			break;
		case 5:
			s = "مرداد";
			break;
		case 6:
			s = "شهريور";
			break;
		case 7:
			s = "مهر";
			break;
		case 8:
			s = "آبان";
			break;
		case 9:
			s = "آذر";
			break;
		case 10:
			s = "دي";
			break;
		case 11:
			s = "بهمن";
			break;
		case 12:
			s = "اسفند";
			break;
		}
		String d = null;
		d = "";
		d += w + " ";
		d += Integer.toString(j_day_no + 1) + " ";
		d += s + " ";
		d += Integer.toString(jy);

		return d;
	};

	public String gregorian_to_jalali_compact(int gy1, int gm1, int gd1,
			int week) {
		gy1 += 1900;
		gm1 += 1;
		int g_days_in_month[] = new int[] { 31, 28, 31, 30, 31, 30, 31, 31, 30,
				31, 30, 31 };
		int j_days_in_month[] = new int[] { 31, 31, 31, 31, 31, 31, 30, 30, 30,
				30, 30, 29 };
		int gy = gy1 - 1600;
		int gm = gm1 - 1;
		int gd = gd1 - 1;
		int g_day_no = 365 * gy + doubleToInt((gy + 3) / 4)
				- doubleToInt((gy + 99) / 100) + doubleToInt((gy + 399) / 400);
		int i;
		for (i = 0; i < gm; ++i)
			g_day_no += g_days_in_month[i];
		if (gm > 1 && ((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0)))
			g_day_no++;
		g_day_no += gd;
		int j_day_no = g_day_no - 79;
		int j_np = doubleToInt(j_day_no / 12053);
		j_day_no = j_day_no % 12053;
		int jy = 979 + 33 * j_np + 4 * doubleToInt(j_day_no / 1461);
		j_day_no %= 1461;
		if (j_day_no >= 366) {
			jy += doubleToInt((j_day_no - 1) / 365);
			j_day_no = (j_day_no - 1) % 365;
		}
		for (i = 0; i < 11 && j_day_no >= j_days_in_month[i]; ++i)
			j_day_no -= j_days_in_month[i];
		int jm = i + 1;

		String jmS = String.valueOf(jm);
		if (jmS.length() < 2)
			jmS = "0" + jmS;

		String j_day_noS = String.valueOf(j_day_no + 1);
		if (j_day_noS.length() < 2)
			j_day_noS = "0" + j_day_noS;

		String d = null;
		d = "";
		d += Integer.toString(jy) + "/";
		d += jmS + "/";
		d += j_day_noS;

		return d;
	};

	private int doubleToInt(double f) {
		Double fint = new Double(f);
		return fint.intValue();
	};

	public boolean isGreater(String lessDate, String greaterDate) {
		int index = 0;
		int[] start = new int[3];
		int[] end = new int[3];

		StringTokenizer stStart = new StringTokenizer(lessDate, "/");
		StringTokenizer stEnd = new StringTokenizer(greaterDate, "/");

		while (stStart.hasMoreTokens()) {
			start[index] = Integer.valueOf(stStart.nextToken());
			index++;
		}

		index = 0;
		while (stEnd.hasMoreTokens()) {
			end[index] = Integer.valueOf(stEnd.nextToken());
			index++;
		}

		if (end[0] > start[0])
			return true;
		else if ((end[0] == start[0]) && (end[1] > start[1]))
			return true;
		else if ((end[0] == start[0]) && (end[1] == start[1])
				&& (end[2] > start[2]))
			return true;
		else
			return false;
	}

	public boolean isGreaterOrEqual(String lessDate, String greaterDate) {
		if (lessDate.equals(greaterDate))
			return true;
		int index = 0;
		int[] start = new int[3];
		int[] end = new int[3];

		StringTokenizer stStart = new StringTokenizer(lessDate, "/");
		StringTokenizer stEnd = new StringTokenizer(greaterDate, "/");

		while (stStart.hasMoreTokens()) {
			start[index] = Integer.valueOf(stStart.nextToken());
			index++;
		}

		index = 0;
		while (stEnd.hasMoreTokens()) {
			end[index] = Integer.valueOf(stEnd.nextToken());
			index++;
		}

		if (end[0] > start[0])
			return true;
		else if ((end[0] == start[0]) && (end[1] > start[1]))
			return true;
		else if ((end[0] == start[0]) && (end[1] == start[1])
				&& (end[2] > start[2]))
			return true;
		else
			return false;
	}

	public boolean isLess(String greaterDate, String lessDate) {
		int index = 0;
		int[] start = new int[3];
		int[] end = new int[3];

		StringTokenizer stStart = new StringTokenizer(greaterDate, "/");
		StringTokenizer stEnd = new StringTokenizer(lessDate, "/");

		while (stStart.hasMoreTokens()) {
			start[index] = Integer.valueOf(stStart.nextToken());
			index++;
		}

		index = 0;
		while (stEnd.hasMoreTokens()) {
			end[index] = Integer.valueOf(stEnd.nextToken());
			index++;
		}

		if (end[0] < start[0])
			return true;
		else if ((end[0] == start[0]) && (end[1] < start[1]))
			return true;
		else if ((end[0] == start[0]) && (end[1] == start[1])
				&& (end[2] < start[2]))
			return true;
		else
			return false;
	}

	public boolean isLessOrEqual(String greaterDate, String lessDate) {
		if (greaterDate.equals(lessDate))
			return true;
		int index = 0;
		int[] start = new int[3];
		int[] end = new int[3];

		StringTokenizer stStart = new StringTokenizer(greaterDate, "/");
		StringTokenizer stEnd = new StringTokenizer(lessDate, "/");

		while (stStart.hasMoreTokens()) {
			start[index] = Integer.valueOf(stStart.nextToken());
			index++;
		}

		index = 0;
		while (stEnd.hasMoreTokens()) {
			end[index] = Integer.valueOf(stEnd.nextToken());
			index++;
		}

		if (end[0] < start[0])
			return true;
		else if ((end[0] == start[0]) && (end[1] < start[1]))
			return true;
		else if ((end[0] == start[0]) && (end[1] == start[1])
				&& (end[2] < start[2]))
			return true;
		else
			return false;
	}

	public boolean isBetween(String sourceDate, String startDate, String endDate) {

		if ((sourceDate.equals(startDate)) || (sourceDate.equals(endDate)))
			return true;
		else if (this.isGreater(startDate, sourceDate)
				&& this.isLess(endDate, sourceDate))
			return true;

		return false;
	}

	public static Integer differenciate(String firstDate, String secondDate) {
		Integer daysOfFirst;
		Integer daysOfSecond;

		int j_days_in_month[] = new int[] { 31, 31, 31, 31, 31, 31, 30, 30, 30,
				30, 30, 29 };

		int index = 0;
		int[] first = new int[3];
		int[] second = new int[3];

		StringTokenizer stFirst = new StringTokenizer(firstDate, "/");
		StringTokenizer stSecond = new StringTokenizer(secondDate, "/");

		while (stFirst.hasMoreTokens()) {
			first[index] = Integer.valueOf(stFirst.nextToken());
			index++;
		}

		index = 0;
		while (stSecond.hasMoreTokens()) {
			second[index] = Integer.valueOf(stSecond.nextToken());
			index++;
		}
		// number days in first date
		daysOfFirst = first[0] * 365;
		for (int i = 1; i < first[1]; i++) {
			daysOfFirst += j_days_in_month[i];
		}
		daysOfFirst += first[2];

		// number days in second date
		daysOfSecond = second[0] * 365;
		for (int i = 1; i < second[1]; i++) {
			daysOfSecond += j_days_in_month[i];
		}
		daysOfSecond += second[2];
		Integer diff = daysOfSecond - daysOfFirst;
		return diff;
	}

	@SuppressWarnings("deprecation")
	public static String getCurrentShamsiDate() {
		Date dateObj = new Date();
		ShamsiDateConverter shamsi = new ShamsiDateConverter();
		String currentDate = shamsi.gregorian_to_jalali_compact(
				dateObj.getYear(), dateObj.getMonth(), dateObj.getDate(),
				dateObj.getDay());
		return currentDate;
	}

	@SuppressWarnings("deprecation")
	public static String getCurrentShamsiTimeStamp() {
		Date dateObj = new Date();
		ShamsiDateConverter shamsi = new ShamsiDateConverter();
		String currentDate = shamsi.gregorian_to_jalali_compact(
				dateObj.getYear(), dateObj.getMonth(), dateObj.getDate(),
				dateObj.getDay());
		currentDate += "-" + dateObj.getHours() + ":" + dateObj.getMinutes()
				+ ":" + dateObj.getSeconds();
		return currentDate;
	}

	public static boolean isOverLappedPeriod(String newGamesStartDate,
			String newGamesFinishDate, String oldGamesStartDate,
			String oldGamesFinishDate) {
		Integer new_sDate = Integer.valueOf(newGamesStartDate.replace("/", ""));
		Integer new_fDate = Integer
				.valueOf(newGamesFinishDate.replace("/", ""));
		Integer old_sDate = Integer.valueOf(oldGamesStartDate.replace("/", ""));
		Integer old_fDate = Integer
				.valueOf(oldGamesFinishDate.replace("/", ""));

		// 1st state: in the middle of a old game
		if (new_sDate > old_sDate && new_fDate < old_fDate) {
			int diff = Math.abs(differenciate(newGamesStartDate,
					newGamesFinishDate));
			if (diff >= 15)
				return true;
		}
		// 2nd state: overlapping in the beginning
		if (new_sDate < old_sDate && new_fDate > old_sDate) {
			int diff = Math.abs(differenciate(oldGamesStartDate,
					newGamesFinishDate));
			if (diff >= 15)
				return true;
		}
		// 3rd state: overlapping at the end
		if (new_sDate > old_sDate && new_fDate > old_fDate) {
			int diff = Math.abs(differenciate(newGamesStartDate,
					oldGamesFinishDate));
			if (diff >= 15)
				return true;
		}

		return false;
	}
	
	@SuppressWarnings("deprecation")
	public static String getCurrentTime() {
		Date dateObj = new Date();
		String hour = String.valueOf(dateObj.getHours());
		String minute = String.valueOf(dateObj.getMinutes());
		String second = String.valueOf(dateObj.getSeconds());
		if (hour.length() == 1)
			hour = "0" + hour;
		if (minute.length() == 1)
			minute = "0" + minute;
		if (second.length() == 1)
			second = "0" + second;
		String currentDate = hour + ":" + minute + ":" + second;
		return currentDate;
	}
}
