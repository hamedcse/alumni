<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - جزئیات پروژه </title>

	<!-- Session checker --><%@ include file="include/session/session_project_manager.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		//var color = ["blue","satgreen","lightred","darkblue","teal","grey"];	
		$(function() { 
			/* $(".box").each(function(i) {
			  $(this).addClass(color[i % 6]);
			}); */
		});
		//--------------------------------------------------------//
		$.subscribe('successed_approveRequestForProject', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_rejectRequestForProject', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		function approveReqIn(requestID, projectID){
			$('#hidden_ridForApprove').val(requestID);
			$('#hidden_pidForApprove').val(projectID);
			$('#submit_approveRequestForProject').click();
        	startLoadingOverlay("loading_overlay");
     	}
		function rejectReqIn(requestID, projectID){
			$('#hidden_ridForReject').val(requestID);
			$('#hidden_pidForReject').val(projectID);
			$('#submit_rejectRequestForProject').click();
        	startLoadingOverlay("loading_overlay");
     	}
	</script>
	<style type="text/css">
		.box .box-title{margin-top:0px;}
		#main label{font-size:12px;}
	</style>
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
				<div class="pull-left"><h1>جزئیات پروژه <s:property value="project.title" /> </h1></div>
				<!-- board --><%@ include file="include/board/board_project_manager.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="javascript:;">جزئیات پروژه <s:property value="project.title" /> </a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered  box-color darkblue ">
						<div class="box-title" style="margin-top:20px;">
							<h3><i class="glyphicon-show_big_thumbnails"></i>عنوان: <s:property value="project.title" /></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							 <form  method="post" class="form-vertical">
								<div class="row-fluid">
									<div class="span6">
										<div class="control-group">
											<label for="txt_description" class="control-label">درباره: </label>
											<div class="controls controls-row">
												<textarea id="txt_description" style="width:97%;" rows="5" cols="200"><s:property value="project.description" /></textarea>
											</div>
										</div>
									</div>
									<div class="span6">
										<div class="control-group">
											<label for="txt_projectCondition" class="control-label">شرایط:</label>
											<div class="controls controls-row">
												<textarea id="txt_projectCondition" style="width:97%;" rows="5" cols="200"><s:property value="project.projectCondition" /></textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span3">
										<div class="control-group">
											<label for="txt_category" class="control-label">موضوع:</label>
											<div class="controls controls-row">
												<input id="txt_category" type="text" value=" <s:property value="project.category" />" class="input-block-level">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_field" class="control-label">رشته:</label>
											<div class="controls controls-row">
												<input id="txt_field" type="text" value=" <s:property value="project.field" />" class="input-block-level">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_college" class="control-label">دانشکده:</label>
											<div class="controls controls-row">
												<input id="txt_college" type="text" value=" <s:property value="project.college" />" class="input-block-level">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_place" class="control-label">محل:</label>
											<div class="controls controls-row">
												<input id="txt_place" type="text" value=" <s:property value="project.place" />" class="input-block-level">
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span3">
										<div class="control-group">
											<label for="txt_creationDate" class="control-label">تاریخ ایجاد:</label>
											<div class="controls controls-row">
												<input id="txt_creationDate" type="text" value=" <s:property value="project.creationDate" />" class="input-block-level">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_duration" class="control-label">مدت:</label>
											<div class="controls controls-row">
												<input id="txt_duration" type="text" value=" <s:property value="project.duration" />" class="input-block-level">
											</div>
										</div>
									</div>
									<%-- <div class="span3">
										<div class="control-group">
											<label for="txt_deletionDate" class="control-label">تاریخ حذف:</label>
											<div class="controls controls-row">
												<input id="txt_deletionDate" type="text" value=" <s:property value="project.deletionDate" />" class="input-block-level">
											</div>
										</div>
									</div> --%>
									<div class="span3">
										<div class="control-group">
											<label for="txt_genderType" class="control-label">جنسیت:</label>
											<div  class="controls controls-row">
												<input id="txt_genderType" type="text" value=" <s:property value="project.genderType" />" class="input-block-level">
											</div>
										</div>
									</div>
									<div class="span3">
										<div class="control-group">
											<label for="txt_jobState" class="control-label">وضعیت:</label>
											<div class="controls controls-row">
												<input id="txt_jobState" type="text" value=" <s:property value="project.state" />" class="input-block-level">
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span3">
										<div class="control-group">
											<label for="txt_salary" class="control-label">حقوق پیشنهادی:</label>
											<div class="controls controls-row">
												<input id="txt_salary" type="text" value=" <s:property value="project.salary" />" class="input-block-level">
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color satblue ">
						<div class="box-title">
							<h3><i class="glyphicon-group"></i> اعضا</h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							  <s:if test="members.size > 0">
							  <table class="table table-hover table-nomargin table-bordered">
								<thead>
									<tr>
										<th>مشخصات</th>
										<th>پروفایل</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="members" var="membersElement">
										<s:set var="memberKey" value="#membersElement.key" />
										<s:set var="memberValue" value="#membersElement.value" />
										<tr>
											<td >
												<s:property value="#memberValue.name"/> <s:property value="#memberValue.family"/>
											</td>
											<td >
												<a href='viewAlumnusProfile.action?aid=<s:property value="#memberKey" />' target="_blank" class="btn btn-grey"><i class="icon-search"></i></a><br>
											</td>
										</tr>
									</s:iterator>
								</tbody>
							 </table>
							 </s:if>
							 <s:else>
								 <div class="alert alert-success" style="color: #000;"><strong>!</strong> موردی یافت نشد.</div>
							 </s:else>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color teal">
						<div class="box-title">
							<h3><i class="glyphicon-user"></i> مدیر پروژه</h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							<form  method="post" class="form-vertical">
								<div class="row-fluid">
									<div class="span6">
										<div class="span12">
											<div class="control-group">
												<label for="txt_detail" class="control-label">مشخصات:</label>
												<div class="controls controls-row">
													<input id="txt_detail" type="text" value=" <s:property value="projectManager.name" /> <s:property value="projectManager.family" />" class="input-block-level">
												</div>
											</div>
										</div>
										<div class="span12" style="margin-right:0;">
											<div class="control-group">
												<label for="txt_email" class="control-label">پست الکترونیک:</label>
												<div class="controls controls-row">
													<input id="txt_email" type="text" value=" <s:property value="projectManager.email" />" class="input-block-level">
												</div>
											</div>
										</div>
									</div>
									<div class="span6">
										<div class="control-group">
											<label for="txt_aboutMe" class="control-label">درباره:</label>
											<div class="controls controls-row">
												<textarea id="txt_aboutMe" style="width:97%;" rows="5" cols="200"><s:property value="projectManager.aboutMe" /></textarea>
											</div>
										</div>
									</div>
								</div>
							</form>	
						</div>
					</div>
				</div>
			</div>	
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color grey">
						<div class="box-title">
							<h3><i class="icon-share"></i> درخواست های عضویت</h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							  <s:if test="project.recivedRequests.size > 0">
							  <table class="table table-hover table-nomargin table-bordered">
								<thead>
									<tr>
										<th>مشخصات فرستنده</th>
										<th>رد درخواست</th>
										<th>تایید درخواست</th>
										<th>پروفایل فرستنده</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="project.recivedRequests" var="recivedRequestsElement">
										<s:set var="recivedRequestKey" value="#recivedRequestsElement.key" />
										<s:set var="recivedRequestValue" value="#recivedRequestsElement.value" />
										<tr>
											<td>
												<s:property value="#recivedRequestValue.sourceDetail"/> 
											</td>
											<td>
												<button type="button" 
														onclick='rejectReqIn(<s:property value="#recivedRequestValue.id"/>, <s:property value="project.id"/>);' 
															class="btn btn-mini btn-red " ><i class="icon-ban-circle"></i> رد</button>
											</td>
											<td>
												<button type="button" 
														onclick='approveReqIn(<s:property value="#recivedRequestValue.id"/>, <s:property value="project.id"/>);' 
															class="btn btn-mini btn-green " ><i class="icon-ok"></i> تایید</button>
											</td>
											<td>
												<a href='viewAlumnusProfile.action?aid=<s:property value="#recivedRequestValue.sourceID" />' target="_blank" class="btn btn-mini btn-grey"><i class="icon-search"></i></a><br>
											</td>
										</tr>
									</s:iterator>
								</tbody>
							 </table>
							 </s:if>
							 <s:else>
								 <div class="alert alert-success" style="color: #000;"><strong>!</strong> موردی یافت نشد.</div>
							 </s:else>
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
	<div id="target_total" style="display:none;"></div>
	
	<s:form theme="simple" id="frm_approveRequestForProject" action="approveRequestForProject" cssStyle="display:none;">
		<s:hidden name="rid" id="hidden_ridForApprove" />
		<s:hidden name="pid" id="hidden_pidForApprove" />
		<sj:submit id="submit_approveRequestForProject" onSuccessTopics="successed_approveRequestForProject" targets="target_total"  />
	</s:form>
	
	<s:form theme="simple" id="frm_rejectRequestForProject" action="rejectRequestForProject" cssStyle="display:none;">
		<s:hidden name="rid" id="hidden_ridForReject" />.
		<s:hidden name="pid" id="hidden_pidForReject" />
		<sj:submit id="submit_rejectRequestForProject" onSuccessTopics="successed_rejectRequestForProject" targets="target_total"  />
	</s:form>
	
	
	
	
</body>

</html>