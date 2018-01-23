<%@page import="util.ShamsiDateConverter"%><%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	Date dateObj=new Date();
	String month=null;
	String day=null;
	String time = ShamsiDateConverter.getCurrentTime();
	String date;
	ShamsiDateConverter shamsi = new ShamsiDateConverter();
	date = shamsi.gregorian_to_jalali_compact(dateObj.getYear(), dateObj.getMonth(), dateObj.getDate(), dateObj.getDay());
	
	switch(dateObj.getDay()){
		case 0:
		 day="یکشنبه";			
		 break;
		case 1:
			 day="دوشنبه";			
			 break;
		case 2:
			day="سه شنبه";
			break;
		case 3:
			day="چهار شنبه";
			break;
		case 4:
			day="پنج شنبه";
			break;
		case 5:
			day="جمعه";
			break;
		case 6:
			day="شنبه";
			break;
	}
	switch(Integer.parseInt(date.substring(5,7))){
		case 1:
			 month="فروردین";			
			 break;
		case 2:
			month="اردیبهشت";
			break;
		case 3:
			month="خرداد";
			break;
		case 4:
			month="تیر";
			break;
		case 5:
			month="مرداد";
			break;
		case 6:
			month="شهریور";
			break;
		case 7:
			 month="مهر";			
			 break;
		case 8:
			month="آبان";
			break;
		case 9:
			month="آذر";
			break;
		case 10:
			month="دی";
			break;
		case 11:
			month="بهمن";
			break;
		case 12:
			month="اسفند";
			break;
		}
	
	int daysNumInt=Integer.parseInt(date.substring(8,10));
	String daysNum=String.valueOf(daysNumInt);
	daysNum=daysNum.replace('0','۰');
	daysNum=daysNum.replace('1','۱');
	daysNum=daysNum.replace('2','۲');
	daysNum=daysNum.replace('3','۳');
	daysNum=daysNum.replace('4','۴');
	daysNum=daysNum.replace('5','۵');
	daysNum=daysNum.replace('6','۶');
	daysNum=daysNum.replace('7','۷');
	daysNum=daysNum.replace('8','۸');
	daysNum=daysNum.replace('9','۹');
	
	String yearsNum=date.substring(0,4);
	yearsNum=yearsNum.replace('0','۰');
	yearsNum=yearsNum.replace('1','۱');
	yearsNum=yearsNum.replace('2','۲');
	yearsNum=yearsNum.replace('3','۳');
	yearsNum=yearsNum.replace('4','۴');
	yearsNum=yearsNum.replace('5','۵');
	yearsNum=yearsNum.replace('6','۶');
	yearsNum=yearsNum.replace('7','۷');
	yearsNum=yearsNum.replace('8','۸');
	yearsNum=yearsNum.replace('9','۹');
		
%>
<div class="pull-right">
	<!-- <ul class="minitiles">
		<li class='grey'><a href="#"><i class="icon-cogs"></i></a></li>
		<li class='lightgrey'><a href="#"><i class="icon-globe"></i></a></li>
	</ul> -->
	<ul class="stats">
		<li class='grey' id="loginTileInIndex">
			<i class="icon-signin"></i>
			<div class="details">
				<a href="login.jsp" class='btn btn-grey block-level'  
					style="font-family:'B Roya',Tahoma,Arial!important;margin:0 auto;font-size:20px;height: 30px;line-height: 30px;width: 90%;">
					 ورود به سامانه 
				</a>
			</div>
		</li>
		<li class='blue'>
			<i class="icon-calendar"></i>
			<div class="details">
				<span><%=day+"،"+" "+yearsNum%></span>
				<span><%=daysNum+" "+month%></span>
			</div>
		</li>
	</ul>
</div>