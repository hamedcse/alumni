<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%><%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title> پنل کاربری</title>

	<!-- Session checker --><%@ include file="include/session/session_alumnus.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>

	<style type="text/css">
		.panelItem{width:200px; height: 80px; line-height: 80px;}
		.panelItem .btn {height:30px;line-height: 30px;font-size:13px;width: 180px;}
		.caret{border-top: 4px solid #FFF!important;}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#frm_id").validationEngine({scroll:false});
		});
		//--------------------------------------------------------//
		$.subscribe('successed_', function(event,element) {
			
		});
		//--------------------------------------------------------//
		function submitForm() {
			if($('#frm_id').validationEngine('validate')){
				$.fallr('show', {
	                buttons : {
	                    button1 : {text: 'بستن'},
	                    button2 : {
	                    	text: 'تایید',
							onclick:function(){
	                    		alert("تایید شد.");
	                    		$.fallr('hide');
	                    	}	
	                    }
	                },
	                content : '<p>آیا از تایید فرم زیر مطمئن هستید؟</p>',
	                icon    : 'check'
	            });
			}
		}
	</script>
	<style type="text/css">
		/* body{overflow:hidden;} */
		.box-title{margin-top:2px!important;}
		table td.tableVal{text-align:center;}
		#portfolioManagementAtaGlance tr{height:44.50px;}
		.modal{left:21.25%!important; ;width: 99.7% !important;right:2px!important;top:0%!important;}
		.modal-backdrop.fade.in,.modal-backdrop.in{/* background:none; */opacity:0.4;filter: alpha(opacity=40);}
		#modal_subMenu .tiles>li,#modal_subMenu .tiles>li a{width:18em!important;}
		#modal_subMenu {
			background:none;
			background: rgba(0, 0, 0,0.7);
			border:none!important;
			-webkit-box-shadow: 0 3px 7px rgba(0,0,0,0.3);
			-moz-box-shadow: 0 3px 7px rgba(0,0,0,0.3);
			box-shadow: 0 3px 7px rgba(0,0,0,0.3);
		}
		#modal_subMenu .tiles>li{float:left;margin-right:3px;}
		#modal_subMenu ul.tiles{margin:5px!important;}
		.name{text-align: center !important}
		.indices_details{font-size:11px;}
		.indices_details tr td,.indices_details tr th{padding:1px 15px!important}
		.tiles>li.long{width:100%;border-radius:2px;}
		.tiles>li.long>a{width: inherit;}
		.tiles>li.long>a span{padding-top:10px;}
		.tiles>li.long>a span i{font-size: 0.75em;padding-top:0.2em;}
		.tiles>li.long>a span.name{
			font-family: 'B Roya',Tahoma,Arial;
			font-size: 1.3em !important;
			background: #000;
			background: rgba(0, 0, 0, 0.18);
			padding: 0.5em 5px;
		}
		.tiles>li.long>a span.name i{margin-left: 3px;}
		.dateInfo{display:none;}
		.systemEndOfDayState tr td {text-align:center;font-size:18px;font-family: 'B Roya';}
		.tiles>li.long:hover:before{width:96%;}
		.box-content{padding:0!important;}
		.tiles>li{margin: 0px 0 0 8px;}
	</style>
</head>

<body>
	<!-- header -->
		<%@ include file="include/header/header_alumnus.jsp" %>
	<!-- /header-->
<div class="container-fluid" id="content">
	<!-- side bar -->
		<%@ include file="include/sidebar/sidebar_alumnus.jsp" %>
	<!-- /side bar-->
	<div id="main">
		<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left"><h1>پنل کاربری</h1></div>
				<!-- board --><%@ include file="include/board/board_alumnus.jsp" %><!-- board -->
			</div>
			<!-- <div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a></li>
				</ul>
				<div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div> -->
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span3">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="lightred long">
									<a href="alumnus_messages.jsp" >
										<span><i class="glyphicon-envelope"></i></span>
										<span class="name"><i class="glyphicon-envelope"></i> پیام ها</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="span3">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="satgreen long">
									<a href="alumnus_projects.jsp" >
										<span class="count"><i class="icon-tasks"></i> </span>
										<span class="name"><i class="icon-tasks" style="margin-left:1px;"></i> پروژه های من</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="span3">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="orange long">
									<a href="alumnus_skills.jsp" >
										<span class="count"><i class=" glyphicon-adjust_alt"></i> </span>
										<span class="name"><i class="glyphicon-adjust_alt"></i> مهارت ها</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="span3">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="satblue long">
									<a href="alumnus_requests.jsp" >
										<span class=""><i class="glyphicon-share"></i></span>
										<span class="name"><i class="glyphicon-share"></i> درخواست ها</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="teal long" >
									<a href="alumnus_resume.jsp">
										<span><i class=" glyphicon-align_center "></i></span>
										<span class="name"><i class="glyphicon-align_center"></i> رزومه</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="span3">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="blue long">
									<a href="alumnus_profile.jsp" >
										<span class="count"><i class="glyphicon-user"></i></span>
										<span class="name"><i class="glyphicon-user"></i> پروفایل</span>
									</a>
							   </li>
							</ul>
						</div>
					</div>
				</div>
				<%-- <div class="span3">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="grey long">
									<a href="alumnus_profile.jsp" >
										<span class="count"><i class="glyphicon-user"></i></span>
										<span class="name"><i class="glyphicon-user"></i> Privacy</span>
									</a>
							   </li>
							</ul>
						</div>
					</div>
				</div> --%>
			</div>	
		<%-- <div class="row-fluid">
			<div class="span2">
				<div class="box">
					<div class="box-content">
						<ul class="tiles">
						 	<li class="blue long">
								<a href="" >
									<span class="count"><i class="glyphicon-group"></i> </span>
									<span class="name"><i class="glyphicon-group"></i> مدیریت سبدگردانها</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="span2">
				<div class="box">
					<div class="box-content">
						<ul class="tiles">
						 	<li class="satblue long">
								<a href="" >
									<span><i class="glyphicon-group"></i></span>
									<span class="name"><i class="glyphicon-group"></i> مدیریت امین ها</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="span2">
				<div class="box">
					<div class="box-content">
						<ul class="tiles">
						 	<li class="magenta long" style="background: #8B62A3;" >
								<a href="" >
									<span class=""><i class="glyphicon-group"></i></span>
									<span class="name"><i class="glyphicon-group"></i> مدیریت تحلیلگرها</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="span2">
				<div class="box">
					<div class="box-content">
						<ul class="tiles">
						 	<li class="teal long">
								<a href="" >
									<span class="count"><i class="glyphicon-wallet"></i> </span>
									<span class="name"><i class="glyphicon-wallet"></i> حساب‌های بانکی</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="span2">
				<div class="box">
					<div class="box-content">
						<ul class="tiles">
						 	<li class="grey long">
								<a href="" >
									<span class="count"><i class="glyphicon-cogwheel"></i> </span>
									<span class="name"><i class="glyphicon-cogwheel"></i> تنظیمات سامانه</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div> --%>
<!----------------------------------------------------End Contents---------------------------------------------------->
		</div><!-- main > container-fluid end -->
	</div><!-- main end -->
</div> <!-- content end -->


<!-- footer -->
<%@ include file="include/footer/footer.jsp" %>
<!-- /footer -->


<!--________________________________________________________________________________________________________________-->
<!--  												  Common Actions:						    			        --> 
								<%@ include file="include/common/common_actions.jsp" %>
<!--________________________________________________________________________________________________________________--> 




<!--================================================================================================================-->
<!--# 												JavaScripts: 								    			   #-->
<!--================================================================================================================--> 
	<!-- Common Includes JS --><%@ include file="include/js/common.jsp" %>
	
	<!-- page script --><script src="js/pages/default.js"></script>

	
	
	
	
	

<!--================================================================================================================-->
<!--# 												  Dialogs: 								    			       #-->
<!--================================================================================================================--> 
	
	
	
	
	
	

<!--================================================================================================================-->
<!--# 												  Ajaxers: 								    			       #-->
<!--================================================================================================================--> 
	
	
	
	
	
	
	
</body>

</html>