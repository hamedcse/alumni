<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - مشخصات مدیر پروژه</title>

	<!-- Session checker --><%@ include file="include/session/session_common.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		$(function() { 
			
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
		<%@ include file="include/header/header_common.jsp" %>
	<!-- /header-->
<div class="container-fluid" id="content">
	<!-- side bar -->
		<%-- <%@ include file="include/sidebar/sidebar_alumnus.jsp" %> --%>
	<!-- /side bar-->
	<div id="main" style="margin-right:0px;">
		<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left"><h1>مشخصات مدیر پروژه</h1></div>
				<!-- board --><%@ include file="include/board/board_common.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="common_project_search.jsp"> پروژه ها</a><i class="icon-angle-right"></i></li>
					<li><a href='loadProjectManagerDetail.action?pmid=<s:property value="projectManager.id"/>'>مشخصات مدیر پروژه</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered  box-color satblue ">
						<div class="box-title">
							<h3><i class="glyphicon-search"></i> مشخصات مدیر پروژه: <s:property value="projectManager.name" /> <s:property value="projectManager.family" /></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							<form  method="post" class="form-vertical">
								<div class="row-fluid">
									<div class="span3">
										<div class="control-group">
											<label class="control-label">پست الکترونیک:</label>
											<div class="controls controls-row">
												<input type="text" value=" <s:property value="projectManager.email" />" class="input-block-level">
											</div>
										</div>
									</div>
									<div class="span9">
										<div class="control-group">
											<label class="control-label">درباره:</label>
											<div class="controls controls-row">
												<textarea rows="" cols="" class="input-block-level"><s:property value="projectManager.aboutMe" /></textarea>
											</div>
										</div>
									</div>
								</div>
							</form>
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
	
	
	
	
	
</body>

</html>