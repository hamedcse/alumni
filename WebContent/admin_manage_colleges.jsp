<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - مدیریت دانشکده ها</title>

	<!-- Session checker --><%@ include file="include/session/session_admin.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		$(function(){
			$("#frm_addCollege").validationEngine({scroll:false});
			startLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		$.subscribe('successed_addCollege', function(event,element) {
			document.getElementById('submit_loadCollegesForAdmin').click();
		});
		$.subscribe('successed_loadCollegesForAdmin', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_editCollege', function(event,element) {
			document.getElementById('submit_loadCollegesForAdmin').click();
			$('#modal_editCollege').modal('hide');
		});
		//--------------------------------------------------------//
		function submitForm() {
			if($("#frm_addCollege").validationEngine('validate')){
         		startLoadingOverlay("loading_overlay");
         		document.getElementById('submit_addCollege').click();
			}
		}
		function submitEditForm() {
			if($.trim($("#txt_nameForEdit").val()) != ""){
				$('#error_nameForEdit').html("");
         		startLoadingOverlay("loading_overlay");
         		document.getElementById('submit_editCollege').click();
			}else{
				$('#error_nameForEdit').html('نام دانشکده نباید خالی باشد.');
			}
		}
		function editCollege(id) {
			$('#error_nameForEdit').html('');
			$('#hidden_collegeID').val(id);
			$('#txt_nameForEdit').val($.trim($('#name'+id).html()));
			$('#txt_descriptionForEdit').val($.trim($('#description'+id).html()));
			$('#modal_editCollege').modal('show');
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
				<div class="pull-left"><h1>مدیریت دانشکده ها</h1></div>
				<!-- board --><%@ include file="include/board/board_admin.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="admin_manage_colleges.jsp">مدیریت دانشکده ها</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span6">
					<div class="box box-bordered box-color">
						<div class="box-title">
							<h3><i class="icon-plus"></i><span>افزودن دانشکده</span></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content nopadding">
						<!--Content Start-->
							<s:form theme="simple" action="addCollege" id="frm_addCollege" method="post" cssClass="form-horizontal form-column form-bordered">
								<div class="span12">
									<div class="control-group">
										<label for="txt_name" class="control-label">نام دانشکده:</label>
										<div class="controls">
											<input type="text" name="name" id="txt_name"  class="input-xlarge validate[required]"/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_description" class="control-label">توضیح:</label>
										<div class="controls">
											<input type="text" name="description" id="txt_description"  class="input-xlarge" />
										</div>
									</div>
								</div>
								<div class="span12">
									<div class="form-actions">
										<button type="button" onclick="submitForm();" class="btn btn-primary" >ثبت</button>
										<button type="reset"  class="btn">انصراف</button>
									</div>
								</div>
								<sj:submit id="submit_addCollege" onSuccessTopics="successed_addCollege" targets="target_total" cssStyle="display:none;"  />
							</s:form>
							<div id="target_total" style="display:none;"></div>
						<!--Content End-->
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="box box-bordered box-color">
						<div class="box-title">
							<h3><i class="icon-cogs"></i><span>مدیریت دانشکده ها</span></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content nopadding" style="max-height:500px;overflow-y:scroll;">
						<!--Content Start-->
							<s:url id="loadCollegesForAdmin" value="/loadCollegesForAdmin.action"/>
							<sj:div href="%{loadCollegesForAdmin}" id="loadCollegesForAdminID" onSuccessTopics="successed_loadCollegesForAdmin"></sj:div>
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
	<div id="modal_editCollege" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">ویرایش دانشکده</h3>
		</div>
		<div class="modal-body">
			<s:form id="frm_editCollege" action="editCollege" method="post" cssClass="form-horizontal form-column form-bordered">
				<div class="span12">
					<div class="control-group">
						<label for="txt_nameForEdit" class="control-label">نام رشته:</label>
						<div class="controls">
							<input type="text" name="name" id="txt_nameForEdit"  class="input-xlarge" />
							<span id="error_nameForEdit"></span>
						</div>
				    </div>
				    <div class="control-group">
						<label for="txt_descriptionForEdit" class="control-label">توضیح:</label>
						<div class="controls">
							<input type="text" name="description" id="txt_descriptionForEdit"  class="input-xlarge" />
						</div>
				    </div>
				</div>
				<input type="hidden" name="collegeID" id="hidden_collegeID" />
				<sj:submit id="submit_editCollege" onSuccessTopics="successed_editCollege" targets="target_total" cssStyle="display:none;"  />
			</s:form>	
		</div>
		<div class="modal-footer">
			<button class="btn " data-dismiss="modal" aria-hidden="true">بستن</button>
			<button type="button" onclick="submitEditForm();" class="btn btn-inverse" ><i class="icon-edit"></i> ثبت</button>
		</div>
	</div>
	<!-- /blank modal -->
	
	
	
	

<!--================================================================================================================-->
<!--# 												  Ajaxers: 								    			       #-->
<!--================================================================================================================--> 
	<s:form theme="simple" id="frm_loadCollegesForAdmin" action="loadCollegesForAdmin" cssStyle="display:none;">
		<sj:submit id="submit_loadCollegesForAdmin" onSuccessTopics="successed_loadCollegesForAdmin" targets="loadCollegesForAdminID"  />
	</s:form>
	
	
	
	
	
	
</body>

</html>