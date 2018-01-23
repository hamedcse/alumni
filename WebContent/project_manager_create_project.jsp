<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%><%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - پروژه جدید</title>

	<!-- Session checker --><%@ include file="include/session/session_project_manager.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>

	<script type="text/javascript">
		$(function() { 
			$("#frm_createProject").validationEngine();  
		});
		//--------------------------------------------------------//
		$.subscribe('successed_createProject', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		function submitForm() {
			if($("#frm_createProject").validationEngine('validate')){
    			startLoadingOverlay("loading_overlay");
    			window.setTimeout(function(){document.getElementById('submit_createProject').click();},300);
			}
		}
	</script>
	<style type="text/css">#frm_createProject label{font-size:12px;}</style>
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
				<div class="pull-left"><h1>پروژه جدید</h1></div>
				<!-- board --><%@ include file="include/board/board_common.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="project_manager_create_project.jsp">پروژه جدید</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color">
						<div class="box-title">
							<h3><i class="glyphicon-folder_plus"></i><span>مشخصات پروژه جدید</span></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
						<!--Content Start-->
							<s:form action="createProject" id="frm_createProject"  method="post" class="form-vertical">
								<div class="row-fluid">
									<div class="span3">
										<div class="control-group">
											<label for="txt_title" class="control-label">عنوان:</label>
											<div class="controls controls-row">
												<input id="txt_title" name="title" type="text"  class="input-block-level validate[required]">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_category" class="control-label">موضوع:</label>
											<div class="controls controls-row">
												<input id="txt_category" name="category" type="text"   class="input-block-level validate[required]">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_college" class="control-label">دانشکده:</label>
											<div class="controls controls-row">
												<input id="txt_college" name="college" type="text"  class="input-block-level validate[required]">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_field" class="control-label">رشته:</label>
											<div class="controls controls-row">
												<input id="txt_field" name="field" type="text"  class="input-block-level validate[required]">
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<div class="control-group">
											<label for="txt_description" class="control-label">درباره پروژه:</label>
											<div class="controls controls-row">
												<textarea id="txt_description" name="description" class="validate[required]"  style="width:97%;" rows="5" cols="200"> </textarea>
											</div>
										</div>
									</div>
									<div class="span6">
										<div class="control-group">
											<label for="txt_projectCondition" class="control-label">شرایط:</label>
											<div class="controls controls-row">
												<textarea id="txt_projectCondition" name="projectCondition" class="validate[required]" style="width:97%;" rows="5" cols="200"></textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span3">
										<div class="control-group">
											<label for="txt_duration" class="control-label">مدت:</label>
											<div class="controls controls-row">
												<input id="txt_duration" name="duration" type="text"  class="input-block-level validate[required]">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_place" class="control-label">محل:</label>
											<div class="controls controls-row">
												<input id="txt_place" name="place" type="text"   class="input-block-level validate[required]">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_salary" class="control-label">حقوق پیشنهادی:</label>
											<div class="controls controls-row">
												<input id="txt_salary" name="salary" type="text"  class="input-block-level validate[required]">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_genderType" class="control-label">جنسیت:</label>
											<div  class="controls controls-row">
												<input id="txt_genderType" name="genderType" type="text"  class="input-block-level validate[required]">
											</div>
										</div>
									</div>
								</div>
								<div class="span12">
									<div class="form-actions" style="padding-top:0;padding-bottom:0;">
										<button type="button" onclick="submitForm();" class="btn btn-primary" ><i class="glyphicon-folder_plus"></i> ایجاد پروژه</button>
										<button type="reset"  class="btn"> <i class="icon-trash"></i> پاک کردن فرم</button>
									</div>
								</div>
								<sj:submit id="submit_createProject" onSuccessTopics="successed_createProject" targets="target_createProject" cssStyle="display:none;" />
							</s:form>
							<div id="target_createProject" style="display:none;"></div>
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
	
	<%-- <!-- action -->
	<s:form theme="simple" id="frm_action" action="action" cssStyle="display:none;">
		<sj:submit id="submit_action"  />
	</s:form>
	<!-- /action --> --%>
	
	<%-- <s:url id="loadProfile" value="/loadProfile.action"/>
	<sj:div href="%{loadProfile}" id="loadProfileID" onSuccessTopics="successedLoadProfilesInfoAjax"></sj:div> --%>
	
	
	
	
	
</body>

</html>