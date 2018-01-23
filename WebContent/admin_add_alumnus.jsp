<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - افزودن فارغ التحصیل</title>

	<!-- Session checker --><%@ include file="include/session/session_admin.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		$(function(){
			$('.datepicker').datepicker({
				changeMonth: true,
				changeYear: true,
				yearRange: 'c-100:c+20',
				dateFormat: 'yy/mm/dd'
			});
			$("#frm_addAlumnus").validationEngine();
		});
		//--------------------------------------------------------//
		$.subscribe('successed_addAlumnus', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		function submitForm() {
			if($("#frm_addAlumnus").validationEngine('validate')){
				$('#hidden_password').val(encode_pass($('#txt_password').val()));
				startLoadingOverlay("loading_overlay");
         		document.getElementById('submit_addAlumnus').click();
			}
		}
	</script>
</head>

<body>
	<!-- header -->
		<%@ include file="include/header/header_admin.jsp" %>
	<!-- /header-->
<div class="container-fluid" id="content">
	<!-- side bar -->
		<%@ include file="include/sidebar/sidebar_admin.jsp" %>
	<!-- /side bar-->
	<div id="main">
		<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left"><h1>افزودن فارغ التحصیل</h1></div>
				<!-- board --><%@ include file="include/board/board_admin.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="admin_add_alumnus.jsp">افزودن فارغ التحصیل</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color">
						<div class="box-title">
							<h3><i class="icon-reorder"></i><span>مشخصات فارغ التحصیل</span></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content nopadding">
						<!--Content Start-->
							<s:form theme="simple" action="addAlumnus" id="frm_addAlumnus" method="post" cssClass="form-horizontal form-column form-bordered">
								<div class="span12">
									<div class="control-group">
										<label for="txt_username" class="control-label">نام کاربری:</label>
										<div class="controls">
											<input type="text" name="username" id="txt_username" placeholder="نام کاربری" class="input-xlarge validate[required]"/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_password" class="control-label">رمز عبور:</label>
										<div class="controls">
											<input type="text" name="" id="txt_password" placeholder="رمز عبور" class="input-xlarge validate[required]" />
											<input type="hidden" name="password" id="hidden_password" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_field" class="control-label">رشته:</label>
										<div class="controls">
											<input type="text" name="field" id="txt_field" placeholder="رشته" class="input-xlarge validate[required]" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_college" class="control-label">دانشکده:</label>
										<div class="controls">
											<input type="text" name="college" id="txt_college" placeholder="دانشکده" class="input-xlarge validate[required]" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_birthDate" class="control-label">تاریخ تولد:</label>
										<div class="controls">
											<input type="text" name="iBirthDate" id="txt_birthDate" placeholder="تاریخ تولد" class="input-xlarge validate[required] datepicker" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_email" class="control-label">پست الکترونیک:</label>
										<div class="controls">
											<input type="text" name="email" id="txt_email" placeholder="پست الکترونیک" class="input-xlarge validate[required]" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_name" class="control-label">نام:</label>
										<div class="controls">
											<input type="text" name="name" id="txt_name" placeholder="نام" class="input-xlarge validate[required]" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_family" class="control-label">نام خانوادگی:</label>
										<div class="controls">
											<input type="text" name="family" id="txt_family" placeholder="نام خانوادگی" class="input-xlarge validate[required]" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_yearOfGraduation" class="control-label">تاریخ فارغ التحصیلی:</label>
										<div class="controls">
											<input type="text" name="yearOfGraduation" id="txt_yearOfGraduation" placeholder="تاریخ فارغ التحصیلی" class="input-xlarge validate[required] datepicker" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_city" class="control-label">شهر محل سکونت:</label>
										<div class="controls">
											<input type="text" name="city" id="txt_city" placeholder="شهر محل سکونت" class="input-xlarge " />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_educationLevel" class="control-label">سطح تحصیلات:</label>
										<div class="controls">
											<input type="text" name="educationLevel" id="txt_educationLevel" placeholder="سطح تحصیلات" class="input-xlarge validate[required]" />
										</div>
									</div>
									<div class="control-group">
										<label for="select_educationLevel" class="control-label">سطح تحصیلات:</label>
										<div class="controls">
											<div class="input-xlarge">
												<select name="educationLevel" id="select_educationLevel" class="select2-me input-xlarge select2-offscreen validate[required]" data-placeholder="سطح تحصیلات" tabindex="-1">
													<option value=""></option>
													<option value="کاردانی">کاردانی</option>
													<option value="کارشناسی">کارشناسی</option>
													<option value="کارشناسی ارشد">کارشناسی ارشد</option>
													<option value="دکترا">دکترا</option>
												</select>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_cellNumber" class="control-label">تلفن همراه:</label>
										<div class="controls">
											<input type="text" name="cellNumber" id="txt_cellNumber" placeholder="تلفن همراه" class="input-xlarge validate[required]" />
										</div>
									</div>
									<div class="control-group">
										<label for="radio_2" class="control-label">وضعیت تاهل:</label>
										<div class="controls">
											<div class="check-line">
												<input type="radio" name="married" value="مجرد" id="radio_married_1" class='icheck-me' data-skin="square" data-color="blue">
												<label class="inline hover" for="radio_married_1">مجرد</label>
										    </div> 
											<div class="check-line">	
												<input type="radio" name="married" value="متاهل" id="radio_married_2" class='icheck-me' data-skin="square" data-color="blue">
												<label class="inline hover" for="radio_married_2">متاهل</label>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label for="radio_1" class="control-label">جنسیت:</label>
										<div class="controls">
											<div class="check-line">
												<input type="radio" name="gender" value="مرد" id="radio_gender1" class='icheck-me validate[required]' data-skin="square" data-color="blue">
												<label class="inline hover" for="radio_gender1">مرد</label>
											</div> 
											<div class="check-line">	
												<input type="radio" name="gender" value="زن" id="radio_gender2" class='icheck-me validate[required]' data-skin="square" data-color="blue">
												<label class="inline hover" for="radio_gender2">زن</label>
											</div>
										</div>
									</div>
								</div>
								<div class="span12">
									<div class="form-actions">
										<button type="button" onclick="submitForm();" class="btn btn-primary" >ثبت</button>
										<button type="reset"  class="btn">انصراف</button>
									</div>
								</div>
								<sj:submit id="submit_addAlumnus" onSuccessTopics="successed_addAlumnus" targets="target_addAlumnus" cssStyle="display:none;"  />
							</s:form>
							<div id="target_addAlumnus" style="display:none;"></div>
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