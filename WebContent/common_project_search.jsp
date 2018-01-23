<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - جست و جوی پروژه ها</title>

	<!-- Session checker --><%@ include file="include/session/session_common.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		var color = ["blue","satgreen","lightred","darkblue","teal","grey"];
		$(function() { 
			//$("#frm_searchProjects").validationEngine({scroll:false});
		});
		//--------------------------------------------------------//
		$.subscribe('successed_searchProjects', function(event,element) {
			stopLoadingOverlay("loading_overlay");
			$(".box").each(function(i) {
			  $(this).addClass(color[i % 6]);
			});
			$(".content-remove").click(function (e) {
		        e.preventDefault();
		        var t = $(this),
		            n = t.parents("[class*=span]"),
		            r = parseInt(n.attr("class").replace("span", "")),
		            i = n.prev().length > 0 ? n.prev() : n.next();
		        if (i.length > 0) var s = parseInt(i.attr("class").replace("span", ""));
		        bootbox.animate(!1);
		        bootbox.confirm("آیا از حذف آیتم  <strong>" + t.parents(".box-title").find("h3").text() + "</strong> مطمئن هستید؟", "خیر", "بله، حذف شود", function (e) {
		            if (e) {
		                t.parents("[class*=span]").remove();
		                i.length > 0 && i.removeClass("span" + s).addClass("span" + (s + r))
		            }
		        })
		    });
		});
		$.subscribe('successed_sendRequestToProject', function(event,element) {
			stopLoadingOverlay("loading_overlay");
			var tmpJobID = $('#hidden_pidForJoin').val(); 
			//$('#btn_jobStatuss'+tmpJobID).html('<i class="icon-ok"></i>  وضعیت: درخواست ارسال شد');
			//$('#btn_jobStatuss'+tmpJobID).attr('onclick','return false;');
		});
		//--------------------------------------------------------//
		function submitSearchForm() {
			if($("#frm_searchProjects").validationEngine('validate')){
				document.getElementById('submit_searchProjects').click();
    			startLoadingOverlay("loading_overlay");
			}
		}
		function sendJoinRequestToProject(projectID){
			$('#hidden_pidForJoin').val(projectID);
			startLoadingOverlay("loading_overlay");
			window.setTimeout(function(){
				document.getElementById('submit_sendRequestToProject').click();
			},300);
		}
		function viewProjectDetail(projectID){
			$('#hidden_pidForViewDetail').val(projectID);
			startLoadingOverlay("loading_overlay");
			window.setTimeout(function(){$('#submit_viewProjectDetail').click();},300);
		}
		
	</script>
	<style type="text/css">.box-content .btn {font-family:Tahoma,Arial !important;font-size:11px!important;}</style>
</head>

<body>
	<!-- header -->
		<%@ include file="include/header/header_common.jsp" %>
	<!-- /header-->
<div class="container-fluid" id="content">
	<!-- side bar -->
		<%-- <%@ include file="include/sidebar/sidebar_common.jsp" %> --%>
	<!-- /side bar-->
	<div id="main" style="margin-right:0px;">
		<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left"><h1>پروژه ها </h1></div>
				<!-- board --><%@ include file="include/board/board_common.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="common_project_search.jsp">پروژه ها </a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-color box-bordered">
						<div class="box-title">
							<h3>
								<i class="icon-search"></i>
								جستجو پروژه
							</h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
								<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							<table id="grid_projects"></table>
							<div id="pager_grid_projects"></div>
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
	<script src="grids_js/alumnus/search_projects/grid_projects.js"></script>
	
	
	
	
	

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
	<s:form theme="simple" id="frm_sendRequestToProject" action="sendRequestToProject" cssStyle="display:none;">
		<s:hidden name="pid" id="hidden_pidForJoin" />
		<sj:submit id="submit_sendRequestToProject" onSuccessTopics="successed_sendRequestToProject" targets="target_total"  />
	</s:form>
	<div id="target_total" style="display: none;"></div>
	
	<s:form theme="simple" id="frm_viewProjectDetail" action="viewProjectDetail" cssStyle="display:none;">
		<s:hidden name="pid" id="hidden_pidForViewDetail" />
		<s:submit id="submit_viewProjectDetail"  />
	</s:form>
	
	
	
	
</body>

</html>