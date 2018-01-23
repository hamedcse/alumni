<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%><%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان - خانه</title>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>

	<script type="text/javascript">
		$(function(){
			startLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		$.subscribe('successed_loadTopProject', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		function reloadTopProjects() {
			startLoadingOverlay("loading_overlay");
			$('#submit_loadTopProject').click();
			return false;
		}
	</script>
</head>

<body>
	<!-- header -->
		<%@ include file="include/header/header_index.jsp" %>
	<!-- /header-->
<div class="container-fluid" id="content">
	<div id="main" style="margin-right:0;">
		<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left"><h1>سامانه فارغ التحصیلان دانشگاه زنجان </h1></div>
				<!-- board --><%@ include file="include/board/board_index.jsp" %><!-- board -->
			</div>
			<!-- <div class="breadcrumbs">
				<ul>
					<li><a href="index.jsp">صفحه اصلی</a></li>
				</ul>
				<div class="close-bread"><a href="javascript:;"><i class="icon-remove"></i></a></div>
			</div> -->
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid" id="loginArea">
						<div class="span12">
							<div class="box box-color box-bordered darkblue ">
								<div class="box-title"  style="margin-top:15px;">
									<h3><i class="icon-signin"></i> ورود به سامانه</h3>
									<div class="actions">
										<a href="javascript:;" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
										<a href="javascript:;" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
									</div>
								</div>
								<div class="box-content" style="text-align:center;">
									<a href="login.jsp" class='btn btn-satblue block-level'  
										style="font-family:'B Roya',Tahoma,Arial!important;margin:0 auto;font-size:20px;height: 30px;line-height: 30px;width: 90%;">
										<i class="icon-signin" style="margin-left:8px;font-size: 13px;"></i>ورود به سامانه 
									</a>
								</div>
							</div>
						</div>
					</div>
			<div class="row-fluid">
				<div class="span8">
					<div class="box box-color box-bordered satblue ">
						<div class="box-title">
							<h3><i class="icon-cloud"></i>جدیدترین پروژه ها </h3>
							<div class="actions">
								<a href="javascript:;" class="btn btn-mini content-refresh" onclick="reloadTopProjects();">
									<i class="icon-refresh"></i>
								</a>
								<a href="javascript:;" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="javascript:;" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content" style="padding:0">
							<s:url id="loadTopProject" value="/loadTopProject.action"/>
							<sj:div href="%{loadTopProject}" id="loadTopProjectID" onSuccessTopics="successed_loadTopProject"></sj:div>
						</div>
					</div>
				</div>
				<div class="span4">
					<div class="row-fluid">
						<div class="span12">
							<div class="box box-color box-bordered satblue ">
								<div class="box-title">
									<h3><i class="glyphicon-show_thumbnails" style="font-size: 19px;"></i>ویژگی های سامانه </h3>
									<div class="actions">
										<a href="javascript:;" class="btn btn-mini"> بیشتر <i class="glyphicon-more"></i></a>
										<a href="javascript:;" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
									</div>
								</div>
								<div class="box-content" style="padding:0;">
									<div class="alert alert-success" style="margin-bottom:0;">
										<strong>-</strong> امکان جستجو لیست فارغ التحصیلان دنشگاه
										<br>
										<strong>-</strong> امکان مشاهده و ویرایش پروفایل، رزومه و مهارت های فارغ التحصیلان
										<br>
										<strong>-</strong> امکان عضویت در پروژه های تعریف شده در سامانه
										<br>
										<strong>-</strong> امکان ارسال و دریافت پیام بین اعضا
										<br>
										<strong>-</strong> امکان مدیریت درخواست ها (ارسال، تایید، رد و حذف)
										<br>
										<strong>-</strong> امکان تعریف پروژه جدید توسط مدیر پروژه
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="box box-color box-bordered darkblue ">
								<div class="box-title"  style="margin-top:15px;">
									<h3><i class="icon-search"></i> جستجو  فارغ التحصیلان</h3>
									<div class="actions">
										<a href="javascript:;" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
										<a href="javascript:;" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
									</div>
								</div>
								<div class="box-content" style="text-align:center;">
									<a href="common_alumnus_search.jsp" 
										style="font-family:'B Roya',Tahoma,Arial!important;margin:0 auto;font-size:20px;height: 30px;line-height: 30px;width: 90%;"  
											class='btn btn-satgreen block-level'>
										<i class="icon-search" style="margin-left:8px;font-size: 13px;"></i>لیست فارغ التحصیلان دانشگاه 
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-color box-bordered blue ">
						<div class="box-title">
							<h3><i class="icon-cloud"></i>خبار </h3>
							<div class="actions">
								<a href="javascript:;" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="javascript:;" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="javascript:;" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							
						</div>
					</div>
				</div>
			</div>
<!----------------------------------------------------End Contents---------------------------------------------------->
		</div><!-- main > container-fluid end -->
	</div><!-- main end -->
</div> <!-- content end -->


<!-- footer -->
<%@ include file="include/footer/footer_index.jsp" %>
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
	
	<s:form theme="simple" id="frm_loadTopProject" action="loadTopProject" cssStyle="display:none;">
		<sj:submit id="submit_loadTopProject" onSuccessTopics="successed_loadTopProject" targets="loadTopProjectID" />
	</s:form>
	
	
	
	
	
</body>

</html>