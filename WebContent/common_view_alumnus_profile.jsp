<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - پروفایل</title>

	<!-- Session checker --><%@ include file="include/session/session_common.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		$(function(){
			//startLoadingOverlay("loading_overlay");
			/* $('.datepicker').datepicker({
				changeMonth: true,
				changeYear: true,
				dateFormat: 'yy/mm/dd',
				yearRange: 'c-100:c+20'
			});
			$("#frm_updateProfile").validationEngine(); */
			var selected = $('#txt_educationLevel').val();
			selected = $.trim(selected.replace("ي", "ی"));
			$("#select_educationLevel option[value='"+selected+"']").attr("selected","selected");
			$('#select_educationLevel').select2();
		});
		//--------------------------------------------------------//
		$.subscribe('successed_updateProfile', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_LoadProfiles', function(event,element) {
			stopLoadingOverlay("loading_overlay");
			var selected = $('#txt_educationLevel').val();
			selected = $.trim(selected.replace("ي", "ی"));
			$("#select_educationLevel option[value='"+selected+"']").attr("selected","selected");
			$('#select_educationLevel').select2();
		});
		//--------------------------------------------------------//
		function submitForm() {
			if($("#frm_updateProfile").validationEngine('validate')){
				$.fallr('show', {
	                buttons : {
	                    button1 : {text: 'بستن'},
	                    button2 : {
	                    	text: 'تایید', 
	                    	onclick: function(){
	                    			$.fallr('hide');	
	                    			startLoadingOverlay("loading_overlay");
	                    			window.setTimeout(function() {document.getElementById('submit_updateProfile').click();},300);
	                    	}
	                    },
	                },
	                content : '<p>آیا از اعمال تغییرات بر رو ی پروفایل مطمئن هستید؟</p>',
	                icon    : 'info'
	            });
			}
		}
		function backAway(){
	        if(history.length === 1 || history.length === 0){
	            window.location = "home";
	        } else {
	        	history.go(-1);
	        }
	    }
	</script>
	<style type="text/css">
		#navigation .user{display:none;}
	</style>
</head>

<body>
	<!-- header -->
		<%@ include file="include/header/header_common.jsp" %>
	<!-- /header-->
<div class="container-fluid" id="content">
	<!-- side bar -->
		<%-- <%@ include file="include/sidebar/sidebar_common.jsp" %> --%>
	<!-- /side bar-->
	<div id="main" style="margin-right:0;">
		<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left"><h1>مشاهده پروفایل <s:property value="alumnus.name"/> <s:property value="alumnus.family"/> </h1></div>
				<!-- board --><%@ include file="include/board/board_common.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="javascript:;">مشاهده پروفایل <s:property value="alumnus.name"/> <s:property value="alumnus.family"/> </a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color">
						<div class="box-title">
							<h3><i class="glyphicon-user"></i><span></span></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content nopadding">
						<!--Content Start-->
							<form method="post" class="form-horizontal form-column form-bordered">
								<div class="span6">
									<div class="control-group">
										<label for="txt_username" class="control-label">نام کاربری:</label>
										<div class="controls">
											<input type="text" name="username" id="txt_username"
												value='<s:property value="alumnus.username"/>' disabled="disabled"
												class="" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_field" class="control-label">رشته:</label>
										<div class="controls">
											<input type="text" name="field" id="txt_field" value='<s:property value="alumnus.field"/>'  disabled="disabled"  class=" " />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_college" class="control-label">دانشکده:</label>
										<div class="controls">
											<input type="text" name="college" id="txt_college" value='<s:property value="alumnus.college"/>'  disabled="disabled" class="" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_registerDate" class="control-label">تاریخ ثبت نام:</label>
										<div class="controls">
											<input type="text" name="registerDate" id="txt_registerDate"
												value='<s:property value="alumnus.registerDate"/>'
												disabled="disabled" class="" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_email" class="control-label"> پست الکترونیک:</label>
										<div class="controls">
											<input type="text" name="email" id="txt_email" value='<s:property value="alumnus.email"/>' class=""/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_name" class="control-label">نام:</label>
										<div class="controls">
											<input type="text" name="name" id="txt_name" value='<s:property value="alumnus.name"/>' class=""/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_family" class="control-label">نام خانوادگی:</label>
										<div class="controls">
											<input type="text" name="family" id="txt_family" value='<s:property value="alumnus.family"/>' class=""/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_yearOfGraduation" class="control-label">سال فراغت از تحصیل:</label>
										<div class="controls">
											<input type="text" name="yearOfGraduationStr" id="txt_yearOfGraduation"
												value='<s:property value="alumnus.yearOfGraduation"/>' class="datepicker" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_aboutMe" class="control-label">درباره من:</label>
										<div class="controls">
											<textarea style="width:90%;" name="aboutMe" id="txt_aboutMe" rows="7" cols="100"><s:property value="alumnus.aboutMe"/></textarea>
										</div>
									</div>
								</div>
								<div class="span6">
									<div class="control-group">
										<label for="txt_city" class="control-label">شهر:</label>
										<div class="controls">
											<input type="text" name="city" id="txt_city" value='<s:property value="alumnus.city"/>' class=""/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_state" class="control-label">استان:</label>
										<div class="controls">
											<input type="text" name="state" id="txt_state" value='<s:property value="alumnus.state"/>' class=""/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_birthDate" class="control-label">تاریخ تولد:</label>
										<div class="controls">
											<input type="text" name="birthDateStr" id="txt_birthDate" value='<s:property value="alumnus.birthDate"/>' class=" datepicker"/>
										</div>
									</div>
									<div class="control-group">
										<label for="select_educationLevel" class="control-label">سطح تحصیلات:</label>
										<div class="controls">
											<input type="hidden" id="txt_educationLevel" value='<s:property value="alumnus.educationLevel"/>' class=""/>
											<select name="educationLevel" id="select_educationLevel" class="input-large " tabindex="-1">
												<option value="کاردانی">کاردانی</option>
												<option value="کارشناسی">کارشناسی</option>
												<option value="کارشناسی ارشد">کارشناسی ارشد</option>
												<option value="دکترا">دکترا</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_average" class="control-label">معدل:</label>
										<div class="controls">
											<input type="text" name="average" id="txt_average" value='<s:property value="alumnus.average"/>' class=""/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_cellNumber" class="control-label">تلفن همراه:</label>
										<div class="controls">
											<input type="text" name="cellNumber" id="txt_cellNumber" value='<s:property value="alumnus.cellNumber"/>' class=""/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_gender" class="control-label">جنسیت:</label>
										<div class="controls">
											<input type="text" name="gender" id="txt_gender"  disabled="disabled"  value='<s:property value="alumnus.gender"/>' class=""/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_married" class="control-label">وضعیت تاهل:</label>
										<div class="controls">
											<input type="text" name="married" id="txt_married" value='<s:property value="alumnus.married"/>' class=""/>
										</div>
									</div>
								</div>
							</form>
						<!--Content End-->
						</div>
					</div>
				</div>
			</div>
<!----------------------------------------------------End Contents---------------------------------------------------->
		</div><!-- main > container-fluid end -->
	</div><!-- main end -->
</div> <!-- content end -->


<!-- footer -->
	<%-- <%@ include file="include/footer/footer.jsp" %> --%>
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
	
	<!-- blank modal -->
	<div id="modal_id" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">عنوان</h3>
		</div>
		<div class="modal-body">
			<form  method="post" class="form-horizontal form-column form-bordered">
				<div class="span12">
					<div class="control-group">
						<label for="txt_" class="control-label">برچسب:</label>
						<div class="controls">
							<input type="text" name="" id="txt_" placeholder="برچسب" class="">
						</div>
				    </div>
				</div>
			</form>	
		</div>
		<div class="modal-footer">
			<button class="btn " data-dismiss="modal" aria-hidden="true">بستن</button>
			<a href="#" data-dismiss="modal" aria-hidden="true"  onclick=""  class="btn  btn-inverse"><i class="icon-plus"></i>ثبت</a>
		</div>
	</div>
	<!-- /blank modal -->
	
	
	
	

<!--================================================================================================================-->
<!--# 												  Ajaxers: 								    			       #-->
<!--================================================================================================================--> 
	
	
	
	
	
	
	
</body>

</html>