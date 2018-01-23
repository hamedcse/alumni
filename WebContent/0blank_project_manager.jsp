<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%><%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - عنوان</title>

	<!-- Session checker --><%@ include file="include/session/session_project_manager.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>

	<script type="text/javascript">
		$(function() { 
			$('#txt_datepicker').datepicker({
				changeMonth: true,
				changeYear: true,
				yearRange: 'c-100:c+20',
				dateFormat: 'yy/mm/dd'
			});
			$("#frm_test").validationEngine();  
		});
		//--------------------------------------------------------//
		$.subscribe('successed_', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		function submitForm() {
			if($("#frm_test").validationEngine('validate')){
				$.fallr('show', {
	                buttons : {
	                    button1 : {text: 'بستن'},
	                    button2 : {
	                    	text: 'تایید', 
	                    	onclick: function(){
	                    			alert('تایید شد.');
	                    			document.getElementById('submit_').click();
	                    			startLoadingOverlay("loading_overlay");
	                        		$.fallr('hide');
	                    	}
	                    },
	                },
	                content : '<p>آیا از تایید فرم  زیر مطمئن هستید؟</p>',
	                icon    : 'info'
	            });
			}
		}
	</script>
</head>

<body>
	<!-- header -->
		<%@ include file="include/header/header_project_manager.jsp" %>
	<!-- /header-->
<div class="container-fluid" id="content">
	<!-- side bar -->
		<%@ include file="include/sidebar/sidebar_project_manager.jsp" %>
	<!-- /side bar-->
	<div id="main">
		<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left"><h1>عنوان</h1></div>
				<!-- board --><%@ include file="include/board/board_common.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="#">جاری</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color">
						<div class="box-title">
							<h3><i class="icon-reorder"></i><span>عنوان</span></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content nopadding">
						<!--Content Start-->
							<s:form theme="simple" action="sample" id="frm_test" method="post" cssClass="form-horizontal form-column form-bordered">
								<div class="span12">
									<div class="control-group">
										<label for="txt_email" class="control-label">ایمیل:</label>
										<div class="controls">
											<input type="text" name="email" id="txt_email" placeholder="ایمیل" class="input-xlarge validate[required,custom[email]]"
												onfocus="showHint('txt_email','- از به کار بردن www در اول آدرس ایمیل خود اجتناب نمایید');" />
										</div>
									</div>
									<div class="control-group">
										<label for="txt_datepicker" class="control-label">تقویم:</label>
										<div class="controls">
											<input type="text" name="txt_datepicker" id="txt_datepicker" placeholder="تقویم" class="input-xlarge validate[required]" />
										</div>
									</div>
									<div class="control-group">
										<label for="select_" class="control-label">برچسب:</label>
										<div class="controls">
											<div class="input-xlarge">
												<select name="" id="select_" class="select2-me input-xlarge select2-offscreen validate[required]" data-placeholder="لطفا یک گزینه را انتخاب نمایید" tabindex="-1">
													<option value=""></option>
													<option value="1">گزینه 1</option>
													<option value="2">گزینه 2</option>
													<option value="3">گزینه 3</option>
												</select>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label for="chkbx_" class="control-label">برچسب:</label>
										<div class="controls">
											<div class="check-line">
												<input type="checkbox" id="chkbx_" class='icheck-me' data-skin="square" data-color="blue"> 
												<label class='inline' for="chkbx_">عنوان</label>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label for="radio_" class="control-label">برچسب:</label>
										<div class="controls">
											<div class="check-line">
												<input type="radio" id="radio_" class='icheck-me' data-skin="square" data-color="blue"> 
												<label class='inline' for="radio_">عنوان</label>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label for="radio_" class="control-label">دیالوگ:</label>
										<div class="controls">
											<div class="check-line">
												<a href="#modal_id" onclick="" data-toggle="modal" role="button" class="btn btn-small btn-inverse"><i class="icon-plus"></i>نمایش دیالوگ</a>
											</div>
										</div>
									</div>
								</div>
								<div class="span12">
									<div class="form-actions">
										<button type="button" onclick="submitForm();" class="btn btn-primary" >تایید</button>
										<button type="reset"  class="btn">انصراف</button>
									</div>
								</div>
								<sj:submit id="submit_" onSuccessTopics="successed_" targets="target_" cssStyle="display:none;" />
							</s:form>
							<div id="target_" style="display:none;"></div>
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
	
	<%-- <!-- action -->
	<s:form theme="simple" id="frm_action" action="action" cssStyle="display:none;">
		<sj:submit id="submit_action"  />
	</s:form>
	<!-- /action --> --%>
	
	<%-- <s:url id="loadProfile" value="/loadProfile.action"/>
	<sj:div href="%{loadProfile}" id="loadProfileID" onSuccessTopics="successedLoadProfilesInfoAjax"></sj:div> --%>
	
	
	
	
	
</body>

</html>