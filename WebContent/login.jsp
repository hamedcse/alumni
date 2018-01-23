<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%><%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>ورود به سامانه  فارغ التحصیلان</title>
	
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links -->
		<!-- Bootstrap -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Bootstrap responsive -->
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
		<!-- icheck -->
		<link rel="stylesheet" href="css/plugins/icheck/all.css">
		<!-- select2 -->
		<link rel="stylesheet" href="css/plugins/select2/select2.css">
		<!-- Color CSS -->
		<link rel="stylesheet" href="css/themes.css">
		<!-- validator -->
		<link rel="stylesheet" href="css/iplugins/validator/validationEngine.jquery.css">
		<!-- Theme CSS -->
		<link rel="stylesheet" href="css/style.css">
		<!-- fallr -->
		<link rel="stylesheet" href="css/iplugins/fallr/jquery-fallr.css">
    <!-- /CSS links -->
    <!-- JS -->
    	<!-- Migration -->
		<script src="js/migration/jquery.migrate.js"></script>
		<!-- icheck -->
		<script src="js/plugins/icheck/jquery.icheck.min.js"></script>
		<!-- select2 -->
		<script src="js/plugins/select2/select2.min.js"></script>
		<!-- Bootstrap -->
		<script src="js/bootstrap.min.js"></script>
		<script src="js/eakroko.min.js"></script>
		<!-- validator -->
		<script src="js/iplugins/validator/jquery.validationEngine.js"></script>
		<script src="js/iplugins/validator/jquery.validationEngine-fa.js"></script>
		<script src="js/iplugins/validator/custom_validators.js"></script>
		<!-- fallr -->
		<script src="js/iplugins/fallr/jquery.fallr.pack.js"></script>
		<!-- loading -->
		<script src="js/plugins/loading/loadingGifUtil.js"></script>
    <!-- /JS-->
	
	
	<script type="text/javascript">
		$(function(){
			$('#txt_username').focus();
			$("#frm_login").validationEngine({scroll:false});
		});
		//--------------------------------------------------------//
		$.subscribe('success_login', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		function submitLogin() {
			if($('#frm_login').validationEngine('validate')){
				startLoadingOverlay("loading_overlay");
				$('#hidden_password').val(encode_pass($('#txt_password').val()));
				window.setTimeout(function(){document.getElementById('submit_login').click();},300);
			}
		}
	</script>
	<style type="text/css">
		label{display:inline;position: absolute;}
		.input-block-level{width:75%;display:inline;float:left;}
		.smallFont{font-size:12px!important;}
		.btn:hover{background:#111!important;}
		label{font-size:12px;}
	</style>
</head>

<body class='login theme-darkblue' data-theme="theme-darkblue">
	<div class="wrapper" style="margin-top: -160px;">
		<h1><a href="index.jsp"><img src="img/logo.png" alt="" class='retina-ready' style="width:59px;height:59px;">سامانه فارغ التحصیلان دانشگاه زنجان</a></h1>
		<div class="login-body" style="padding-top:20px;">
			<!-- <h2>جامعه فارغ التحصیلان دانشگاه زنجان</h2> -->
			<s:form theme="simple"  name="form_login" id="frm_login"  action="login" method="post" cssStyle="margin:0;padding-bottom:15px;">
				<div class="control-group">
					<div class="email controls">
						<label for="txt_username" style="margin-top: 4px;">نام کاربری:</label>
						<input type="text" style="direction:ltr;" name='username' id="txt_username" placeholder="نام کاربری" class='input-block-level validate[required] smallFont' onkeydown="if(event.keyCode==13){submitLogin();}"/>
					</div>
				</div>
				<div class="control-group">
					<div class="pw controls">
						<label for="txt_password" style="margin-top: 50px;">رمز عبور:</label>
						<input type="password" style="direction:ltr;" name="" id="txt_password" placeholder="رمز عبور" class="input-block-level validate[required] smallFont" onkeydown="if(event.keyCode==13){submitLogin();}"/>
						<input type="hidden" id="hidden_password" name="password">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<label for="select_type" style="margin-top: 93px;">نوع کاربر:</label>
						<div class="input-block-level" style="width: 100%;margin-bottom:15px;">
							<select name="type" id="select_type" class="select2-me input-block-level select2-offscreen validate[required] smallFont" data-placeholder="لطفا یک گزینه را انتخاب نمایید" tabindex="-1" onkeydown="if(event.keyCode==13){submitLogin();}">
								<option value="alumnus" selected="selected">فارغ التحصیل</option>
								<option value="admin">مدیر سامانه</option>
								<option value="projectManager">مدیر پروژه</option>
								<!-- <option value="employer">کارفرما</option> -->
							</select>
						</div>
					</div>
				</div>
				<div class="submit">
					<button class="btn btn-primary smallFont" style="width:100%;line-height:25px;" onclick="submitLogin();" onkeydown="if(event.keyCode==13){submitLogin();}" ><i class="icon-signin"></i> ورود</button>
					<!-- <input type="button" value="صفحه اصلی" style="float:right;background:#C2C2C2;" class='btn btn-lightgrey smallFont' onclick="window.location.href='index.jsp'" /> -->
					<sj:submit  id="submit_login" onSuccessTopics="success_login" targets="target_login" cssStyle="display:none;" />
					<br>
					<!-- <div class="remember">
						<input type="checkbox" name="remember" class='icheck-me' data-skin="square" data-color="blue" id="remember" />
						<label for="remember">مرا به خاطر بسپار</label>
					</div> -->
				</div>
			</s:form>
			<div id="target_login" style="display:none;"></div>
			<div class="forget" style="margin-top: 10px;">
				<a href="reset_password.jsp" style=""><span>فراموشی رمز عبور</span></a>
			</div>
		</div>
		<div style="direction:ltr;font-size:12px;color:#fff;text-align: center;margin-top: 5px;">
			 ZNU Alumni ©2013-2014
		</div>
		
	</div>
	
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