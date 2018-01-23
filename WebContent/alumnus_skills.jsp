<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - مهارت ها</title>

	<!-- Session checker --><%@ include file="include/session/session_alumnus.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>

	
	<script type="text/javascript">
		$(function(){
			//$("#frm_addSkill").validationEngine();
		});
		//--------------------------------------------------------//
		$.subscribe('successed_loadCategoriesForAlumnus', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_addSkill', function(event,element) {
			document.getElementById('submit_loadAlumnusSkills').click();
			$('#modal_addSkill').modal('hide');
		});
		$.subscribe('successed_loadAlumnusSkills', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_deleteSkill', function(event,element) {
			document.getElementById('submit_loadAlumnusSkills').click();
		});
		//--------------------------------------------------------//
		function submitAddForm() {
			if($.trim($("#txt_title").val()) != ""){
				document.getElementById('submit_addSkill').click();
	            startLoadingOverlay("loading_overlay");
			}else{
				$("#span_errorForTitle").html('عنوان مهارت نباید خالی باشد.');
			}
		}
		function showAddSkillModal() {
			$("#span_errorForTitle").html("");
			$('#modal_addSkill').modal('show');
			return false;
		}
		function deleteSkill(id) {
			$.fallr('show', {
                buttons : {
                    button1 : {text: 'بستن'},
                    button2 : {
                    	text: 'تایید', 
                    	onclick: function(){
							$.fallr('hide');
							startLoadingOverlay("loading_overlay");
							$('#hidden_skillIDForDelete').val(id);
							window.setTimeout(function(){document.getElementById('submit_deleteSkill').click();},300);
                    	}
                    },
                },
                content : '<p>آیا از حذف مهارت انتخاب شده مطمئن هستید؟</p>',
                icon    : 'info'
            });
			
		}
		function reloadSkills(){
			startLoadingOverlay("loading_overlay");
			document.getElementById('submit_loadAlumnusSkills').click();
		}
	</script>
</head>

<body>
	<!-- header -->
		<%@ include file="include/header/header_alumnus.jsp" %>
	<!-- /header-->
<div class="container-fluid" id="content">
	<!-- side bar -->
		<%@ include file="include/sidebar/sidebar_alumnus.jsp" %>
	<!-- /side bar-->
	<div id="main">
		<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left"><h1>مهارت ها</h1></div>
				<!-- board --><%@ include file="include/board/board_alumnus.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="alumnus_skills.jsp">مهارت ها </a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color">
						<div class="box-title">
							<h3><i class="glyphicon-settings"></i><span>مهارت های شما</span></h3>
							<div class="actions">
								<a href="#" onclick="showAddSkillModal();" class="btn btn-mini " style="background: #000;"><i class="icon-plus"></i> افزودن مهارت </a>
								<a href="#" onclick="reloadSkills();" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content nopadding" style="overflow-y:scroll;max-height:500px; ">
							<!--Content Start-->
							<s:url id="loadAlumnusSkills" value="/loadAlumnusSkills.action"/>
							<sj:div href="%{loadAlumnusSkills}" id="loadAlumnusSkillsID" onSuccessTopics="successed_loadAlumnusSkills"></sj:div>
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
	
	<!-- modal_addSkill -->
	<div id="modal_addSkill" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">افزودن مهارت</h3>
		</div>
		<div class="modal-body">
			<s:form theme="simple"  method="post" action="addSkill" id="frm_addSkill" cssClass="form-horizontal form-column form-bordered">
				<div class="span12">
					<div class="control-group">
						<label for="txt_title" class="control-label">عنوان:</label>
						<div class="controls">
							<input type="text" name="title" id="txt_title"  class="input-xlarge "/>
							<span id="span_errorForTitle"></span>
						</div>
				    </div>
				    <div class="control-group">
						<label for="select_category" class="control-label">موضوع:</label>
						<div class="controls">
							<s:url id="loadCategoriesForAlumnus" value="/loadCategoriesForAlumnus.action"/>
							<sj:div href="%{loadCategoriesForAlumnus}" id="loadCategoriesForAlumnusID" onSuccessTopics="successed_loadCategoriesForAlumnus"></sj:div>
						</div>
				    </div>
				    <div class="control-group">
						<label for="select_level" class="control-label">میزان تسلط:</label>
						<div class="controls">
							<select name="level" id="select_level" class="select2-me  select2-offscreen smallFont  input-xxlarge " data-placeholder="لطفا یک گزینه را انتخاب نمایید" tabindex="-1">
								<option value="عالی">عالی</option>
								<option value="خوب">خوب</option>
								<option value="متوسط">متوسط</option>
								<option value="ضعیف">ضعیف</option>
							</select>
						</div>
				    </div>
				</div>
				<sj:submit id="submit_addSkill" onSuccessTopics="successed_addSkill" targets="target_total" cssStyle="display:none;" />
			</s:form>	
			<div id="target_total" style="display:none;"></div>
		</div>
		<div class="modal-footer">
			<button class="btn " data-dismiss="modal" aria-hidden="true">بستن</button>
			<a href="#" onclick="submitAddForm();"  class="btn  btn-inverse"><i class="icon-plus"></i>ثبت</a>
		</div>
	</div>
	<!-- /modal_addSkill -->
	
	

<!--================================================================================================================-->
<!--# 												  Ajaxers: 								    			       #-->
<!--================================================================================================================--> 

	<!-- action -->
	<s:form theme="simple" id="frm_loadAlumnusSkills" action="loadAlumnusSkills" cssStyle="display:none;">
		<sj:submit id="submit_loadAlumnusSkills" targets="loadAlumnusSkillsID" onSuccessTopics="successed_loadAlumnusSkills" />
	</s:form>
	<!-- /action -->
	<!-- action -->
	<s:form theme="simple" id="frm_deleteSkill" action="deleteSkill" cssStyle="display:none;">
		<s:hidden name="sid" id="hidden_skillIDForDelete" />
		<sj:submit id="submit_deleteSkill" targets="target_total" onSuccessTopics="successed_deleteSkill" />
	</s:form>
	<!-- /action -->
	
	
	
	
</body>

</html>