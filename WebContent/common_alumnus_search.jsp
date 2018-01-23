<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - لسیت فارغ التحصیلان</title>

	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		var color = ["blue","satgreen","lightred","darkblue","teal","grey"];
		$(function() { 
			//$("#frm_searchAlumnusList").validationEngine({scroll:false});
			//$('#select_educationLevel').select2();
		});
		//--------------------------------------------------------//
		$.subscribe('successed_searchAlumnusList', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_loadFields', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_loadColleges', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_loadAllAlumnusList', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		function submitSearchForm() {
			document.getElementById('submit_searchAlumnusList').click();
	  		startLoadingOverlay("loading_overlay");
		}
		function showAll() {
			document.getElementById('submit_loadAllAlumnusList').click();
	  		startLoadingOverlay("loading_overlay");
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
		.box-content .btn {font-family:Tahoma,Arial !important;font-size:11px!important;}
		.form-horizontal .controls{margin-right:0!important;margin-left: 10px;float: right;}
		.form-horizontal .control-group{margin-bottom:7px!important;}
		.ibtn{background:#222!important;}
		.ibtn:HOVER{background:#368ee0!important;}
		.table tr th{background:#363636;color: #FFF;}
	</style>
</head>

<body>
<div id="navigation" style="height:40px;">
	<div class="container-fluid">
		<a href="home" style="font-family: tahoma;font-size: 11px;margin-right:0!important;"  id="brand">
			<img src="img/topbar-logo.png" alt="znu" class='retina-ready' style="width:32px;height:26px;">
			سامانه فارغ التحصیلان دانشگاه زنجان	
		</a>
		<ul class='main-nav'>
		</ul>
		<div class="user">
			<div class="dropdown">
				<a href="#" style="height: 27px;" onclick="backAway(); return false;" class=''><i class="glyphicon-left_arrow" style="margin-left:8px;"></i>بازگشت</a>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid" id="content">
	<div id="main" style="margin-right:0;">
		<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left"><h1>لسیت فارغ التحصیلان دانشگاه زنجان</h1></div>
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="common_alumnus_search.jsp">لسیت فارغ التحصیلان</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-color box-bordered">
						<div class="box-title">
							<h3><i class="icon-search"></i>جستجوی فارغ التحصیلان</h3>
							<div class="actions">
								<!-- <button type="button" onclick="showAll();" class="btn btn-blue ibtn" style="font-family:tahoma!important;font-size: 12px !important;" >
									 نمایش همه
								</button> -->
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							<table id="grid_alumnus"></table>
							<div id="pager_grid_alumnus"></div>
						</div>
					</div>
				</div>
			</div>
			<%-- <div class="row-fluid">
				<div class="span12">
					<div class="box box-color box-bordered">
						<div class="box-title">
							<h3><i class="icon-search"></i>جستجوی فارغ التحصیلان</h3>
							<div class="actions">
								<button type="button" onclick="showAll();" class="btn btn-blue ibtn" style="font-family:tahoma!important;font-size: 12px !important;" >
									 نمایش همه
								</button>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							<s:form theme="simple" action="searchAlumnusList" id="frm_searchAlumnusList" method="post" cssClass="form-horizontal" cssStyle="margin-bottom:0;">
								<div class="control-group">
									<label for="txt_name" style="text-align: center;" class="control-label">نام:</label>
									<div class="controls">
										<input type="text" name="name" id="txt_name" class="input-large " />
									</div>
									<label for="txt_family" style="text-align: center;" class="control-label">نام خانوادگی:</label>
									<div class="controls">
										<input type="text" name="family" id="txt_family" class="input-large " />
									</div>
									<label for="txt_yearOfGraduation" style="text-align: center;" class="control-label">سال فراغت از تحصیل:</label>
									<div class="controls">
										<input type="text" id="txt_yearOfGraduation" name="yearOfGraduation"   class="input-large" />
									</div>
								</div>
								<div class="control-group">
									<label for="select_field" style="text-align: center;" class="control-label">رشته تحصیلی:</label>
									<div class="controls">
										<s:url id="loadFields" value="/loadFields.action"/>
										<sj:div href="%{loadFields}" id="loadFieldsID" onSuccessTopics="successed_loadFields"></sj:div>
									</div>
									<label for="select_college" style="text-align: center;" class="control-label">دانشکده:</label>
									<div class="controls" style="margin-right: 15px!important;">
										<s:url id="loadColleges" value="/loadColleges.action"/>
										<sj:div href="%{loadColleges}" id="loadCollegesID" onSuccessTopics="successed_loadColleges"></sj:div>
									</div>
									<label for="select_educationLevel" style="text-align: center;" class="control-label">مقطع فارغ التحصیلی:</label>
									<div class="controls" style="margin-right: 13px !important;">
										<select name="educationLevel" id="select_educationLevel" class="input-large" tabindex="-1">
											<option value=""></option>
											<option value="کاردانی">کاردانی</option>
											<option value="کارشناسی">کارشناسی</option>
											<option value="کارشناسی ارشد">کارشناسی ارشد</option>
											<option value="دکترا">دکترا</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label for="txt_city" style="text-align: center;" class="control-label">شهر محل سکونت:</label>
									<div class="controls">
										<input type="text" name="city" id="txt_city" class="input-large " />
									</div>
									<label for="txt_state" style="text-align: center;" class="control-label">استان محل سکونت:</label>
									<div class="controls">
										<input type="text" name="state" id="txt_state" class="input-xlarge " />
									</div>
									<div class="controls">
										<button type="button" onclick="submitSearchForm();" class="btn btn-inverse input-xlarge"><i class="icon-search"></i> جستجو</button>
									</div>
								</div>
								<sj:submit id="submit_searchAlumnusList" onSuccessTopics="successed_searchAlumnusList" targets="target_searchAlumnusList" cssStyle="display:none;" />
							</s:form>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-color box-bordered">
						<div class="box-title">
							<h3><i class="icon-list"></i>لیست فارغ التحصیلان</h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content" style="max-height:600px;overflow-y:scroll;">
							<div id="target_searchAlumnusList"></div>
						</div>
					</div>
				</div>
			</div> --%>
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
	<script src="grids_js/common/search_alumnus_list/grid_alumnus.js"></script>
	
	
	
	
	

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
	<%-- <s:form theme="simple" id="frm_requestJob" action="sendRequestToJob" cssStyle="display:none;">
		<s:hidden name="jobID" id="hidden_jobIDForJoin" />
		<sj:submit id="submit_requestJob" onSuccessTopics="successed_requestJob" targets="target_total"  />
	</s:form>
	<div id="target_total" style="display: none;"></div> --%>
	<%-- <s:form theme="simple" id="frm_loadAllAlumnusList" action="loadAllAlumnusList" cssStyle="display:none;">
		<sj:submit id="submit_loadAllAlumnusList" onSuccessTopics="successed_loadAllAlumnusList" targets="target_searchAlumnusList"  />
	</s:form> --%>
	
	
	
</body>

</html>