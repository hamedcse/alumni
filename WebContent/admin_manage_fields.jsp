<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - مدیریت رشته ها</title>

	<!-- Session checker --><%@ include file="include/session/session_admin.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		$(function(){
			$("#frm_addField").validationEngine({scroll:false});
			startLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		$.subscribe('successed_addField', function(event,element) {
			document.getElementById('submit_loadFieldsForAdmin').click();
		});
		$.subscribe('successed_loadFieldsForAdmin', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_editField', function(event,element) {
			document.getElementById('submit_loadFieldsForAdmin').click();
			$('#modal_editField').modal('hide');
		});
		//--------------------------------------------------------//
		function submitForm() {
			if($("#frm_addField").validationEngine('validate')){
         		startLoadingOverlay("loading_overlay");
         		document.getElementById('submit_addField').click();
			}
		}
		function submitEditForm() {
			if($.trim($("#txt_nameForEdit").val()) != ""){
				$('#error_nameForEdit').html("");
         		startLoadingOverlay("loading_overlay");
         		document.getElementById('submit_editField').click();
			}else{
				$('#error_nameForEdit').html('نام رشته نباید خالی باشد.');
			}
		}
		function editField(id) {
			$('#error_nameForEdit').html("");
			$('#hidden_fieldID').val($.trim(id));
			$('#txt_nameForEdit').val($.trim($('#name'+id).html()));
			$('#txt_orientationForEdit').val($.trim($('#orientation'+id).html()));
			$('#modal_editField').modal('show');
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
				<div class="pull-left"><h1>مدیریت رشته ها</h1></div>
				<!-- board --><%@ include file="include/board/board_admin.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="admin_manage_fields.jsp">مدیریت رشته ها</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span6">
					<div class="box box-bordered box-color">
						<div class="box-title">
							<h3><i class="icon-plus"></i><span>افزودن رشته</span></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content nopadding">
						<!--Content Start-->
							<s:form theme="simple" action="addField" id="frm_addField" method="post" cssClass="form-horizontal form-column form-bordered">
								<div class="span12">
									<div class="control-group">
										<label for="txt_name" class="control-label">نام رشته:</label>
										<div class="controls">
											<input type="text" name="name" id="txt_name"  class="input-xlarge validate[required]"/>
										</div>
									</div>
									<div class="control-group">
										<label for="txt_orientation" class="control-label">گرایش:</label>
										<div class="controls">
											<input type="text" name="orientation" id="txt_orientation"  class="input-xlarge" />
										</div>
									</div>
								</div>
								<div class="span12">
									<div class="form-actions">
										<button type="button" onclick="submitForm();" class="btn btn-primary" >ثبت</button>
										<button type="reset"  class="btn">انصراف</button>
									</div>
								</div>
								<sj:submit id="submit_addField" onSuccessTopics="successed_addField" targets="target_total" cssStyle="display:none;"  />
							</s:form>
							<div id="target_total" style="display:none;"></div>
						<!--Content End-->
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="box box-bordered box-color">
						<div class="box-title">
							<h3><i class="icon-cogs"></i><span>مدیریت رشته ها</span></h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content nopadding" style="max-height:500px;overflow-y:scroll;">
						<!--Content Start-->
							<s:url id="loadFieldsForAdmin" value="/loadFieldsForAdmin.action"/>
							<sj:div href="%{loadFieldsForAdmin}" id="loadFieldsForAdminID" onSuccessTopics="successed_loadFieldsForAdmin"></sj:div>
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
	<div id="modal_editField" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">ویرایش رشته</h3>
		</div>
		<div class="modal-body">
			<s:form id="frm_editField" action="editField" method="post" cssClass="form-horizontal form-column form-bordered">
				<div class="span12">
					<div class="control-group">
						<label for="txt_nameForEdit" class="control-label">نام رشته:</label>
						<div class="controls">
							<input type="text" name="name" id="txt_nameForEdit"  class="input-xlarge" />
							<span id="error_nameForEdit"></span>
						</div>
				    </div>
				    <div class="control-group">
						<label for="txt_orientationForEdit" class="control-label">گرایش:</label>
						<div class="controls">
							<input type="text" name="orientation" id="txt_orientationForEdit"  class="input-xlarge" />
						</div>
				    </div>
				</div>
				<s:hidden name="fid" id="hidden_fieldID" />
				<sj:submit id="submit_editField" onSuccessTopics="successed_editField" targets="target_total" cssStyle="display:none;"  />
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
	<s:form theme="simple" id="frm_loadFieldsForAdmin" action="loadFieldsForAdmin" cssStyle="display:none;">
		<sj:submit id="submit_loadFieldsForAdmin" onSuccessTopics="successed_loadFieldsForAdmin" targets="loadFieldsForAdminID"  />
	</s:form>
	
	
	
	
	
	
</body>

</html>