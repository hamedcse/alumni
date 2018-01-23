<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - مدیریت درخواست ها</title>

	<!-- Session checker --><%@ include file="include/session/session_alumnus.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		$(function(){
			//$("#frm_test").validationEngine();
			startLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		$.subscribe('successed_loadRecivedRequests', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_loadSentRequests', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_loadArchivedRequests', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_searchSentRequests', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_searchArchivedRequests', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_deleteSentRequest', function(event,element) {
			 document.getElementById('submit_loadSentRequests').click();
			 document.getElementById('submit_loadArchivedRequests').click();
		});
		$.subscribe('successed_cancelSentRequest', function(event,element) {
			var targetBtn = $('#btn_cancelrequest'+$('#hidden_ridForCancel').val()) ;
			targetBtn.html('<i class="icon-exclamation-sign"></i> درخواست شما لغو شد');
			targetBtn.attr('onclick','return false;');
			targetBtn.removeClass('btn-warning');
			targetBtn.addClass('btn-info');
			stopLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		function deleteSentRequest(id) {
             $('#hidden_rid').val(id);
			 document.getElementById('submit_deleteSentRequest').click();
             startLoadingOverlay("loading_overlay");
		}
		function cancelRequest(id) {
            $('#hidden_ridForCancel').val(id);
			document.getElementById('submit_cancelSentRequest').click();
            startLoadingOverlay("loading_overlay");
		}
		function searchSentRequests() {
			document.getElementById('submit_searchSentRequests').click();
            startLoadingOverlay("loading_overlay");
		}
		function searchArchivedRequests() {
			document.getElementById('submit_searchArchivedRequests').click();
            startLoadingOverlay("loading_overlay");
		}
	</script>
	<style type="text/css">
		span.label{font-size: 11px;font-weight: normal;width: 95%;text-align: center;}
	</style>
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
				<div class="pull-left"><h1>مدیریت درخواست ها</h1></div>
				<!-- board --><%@ include file="include/board/board_alumnus.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="alumnus_requests.jsp">مدیریت درخواست ها</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color satblue">
						<div class="box-title">
							<h3><i class="glyphicon-share"></i> درخواست ها</h3>
						</div>
						<div class="box-content nopadding">
							<ul class="tabs tabs-inline tabs-top">
								<li class="active">
									<a href="#first11" data-toggle="tab"><i class="glyphicon-share"></i> درخواست های ارسالی</a>
								</li>
								<!-- <li>
									<a href="#second22" data-toggle="tab"><i class="glyphicon-inbox_in"></i> پیام های دریافتی</a>
								</li> -->
								<li>
									<a href="#thirds33" data-toggle="tab"><i class="glyphicon-search"></i> جستجو درخواست ها</a>
								</li>
							</ul>
							<div class="tab-content padding tab-content-inline tab-content-bottom" style="max-height: 350px;overflow-y: scroll;">
								<div class="tab-pane active" id="first11">
									<s:url id="loadSentRequests" value="/loadSentRequests.action"/>
									<sj:div href="%{loadSentRequests}" id="loadSentRequestsID" onSuccessTopics="successed_loadSentRequests"></sj:div>
								</div>
								<%-- <div class="tab-pane" id="second22">
									<s:url id="loadRecivedRequests" value="/loadRecivedRequests.action"/>
									<sj:div href="%{loadRecivedRequests}" id="loadRecivedRequestsID" onSuccessTopics="successed_loadRecivedRequests"></sj:div>
								</div> --%>
								<div class="tab-pane" id="thirds33">
									<s:form theme="simple" action="searchSentRequests" id="frm_searchSentRequests" method="post" cssClass="form-horizontal">
										<div class="control-group">
											<label for="txt_title" style="text-align: center;" class="control-label">عنوان:</label>
											<div class="controls">
												<input type="text" id="txt_title" name="title" style="float:right;"  class="span9" />
												<button type="button" onclick="searchSentRequests();" class="btn btn-inverse span3" ><i class="icon-search"></i> بگرد</button>
											</div>
										</div>
										<div class="control-group">
											<label for="txt_sourceDetail" style="text-align: center;" class="control-label">فرستنده:</label>
											<div class="controls">
												<input type="text" name="sourceDetail" id="txt_sourceDetail" class="input-xlarge"/>
											</div>
										</div>
										<div class="control-group">
											<label for="txt_targetDetail" style="text-align: center;" class="control-label">گیرنده:</label>
											<div class="controls">
												<input type="text" name="targetDetail" id="txt_targetDetail" class="input-xlarge"/>
											</div>
										</div>
										<sj:submit id="submit_searchSentRequests" onSuccessTopics="successed_searchSentRequests" targets="target_searchSentRequests" cssStyle="display:none;" />
									</s:form>
									<div id="target_searchSentRequests"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color satblue">
						<div class="box-title">
							<h3><i class="icon-trash"></i> آرشیو درخواست ها</h3>
						</div>
						<div class="box-content nopadding">
							<ul class="tabs tabs-inline tabs-top">
								<li class="active">
									<a href="#a11" data-toggle="tab"><i class="icon-trash"></i> آرشیو درخواست ها</a>
								</li>
								<li>
									<a href="#a22" data-toggle="tab"><i class="glyphicon-search"></i> جستجو آرشیو درخواست ها</a>
								</li>
							</ul>
							<div class="tab-content padding tab-content-inline tab-content-bottom" style="max-height: 350px;overflow-y: scroll;">
								<div class="tab-pane active" id="a11">
									<s:url id="loadArchivedRequests" value="/loadArchivedRequests.action"/>
									<sj:div href="%{loadArchivedRequests}" id="loadArchivedRequestsID" onSuccessTopics="successed_loadArchivedRequests"></sj:div>
								</div>
								<div class="tab-pane" id="a22">
									<s:form theme="simple" action="searchArchivedRequests" id="frm_searchArchivedRequests" method="post" cssClass="form-horizontal">
										<div class="control-group">
											<label for="txt_titleForArchive" style="text-align: center;" class="control-label">عنوان:</label>
											<div class="controls">
												<input type="text" id="txt_titleForArchive" name="title" style="float:right;"  class="span9" />
												<button type="button" onclick="searchArchivedRequests();" class="btn btn-inverse span3" ><i class="icon-search"></i> بگرد</button>
											</div>
										</div>
										<div class="control-group">
											<label for="txt_sourceDetailForArchive" style="text-align: center;" class="control-label">فرستنده:</label>
											<div class="controls">
												<input type="text" name="sourceDetail" id="txt_sourceDetailForArchive" class="input-xlarge"/>
											</div>
										</div>
										<div class="control-group">
											<label for="txt_targetDetailForArchive" style="text-align: center;" class="control-label">گیرنده:</label>
											<div class="controls">
												<input type="text" name="targetDetail" id="txt_targetDetailForArchive" class="input-xlarge"/>
											</div>
										</div>
										<sj:submit id="submit_searchArchivedRequests" onSuccessTopics="successed_searchArchivedRequests" targets="target_searchArchivedRequests" cssStyle="display:none;" />
									</s:form>
									<div id="target_searchArchivedRequests"></div>
								</div>
							</div>
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
	
	<s:form theme="simple" id="frm_deleteSentRequest" action="deleteSentRequest" cssStyle="display:none;">
		<s:hidden name="rid" id="hidden_rid" />
		<sj:submit id="submit_deleteSentRequest" onSuccessTopics="successed_deleteSentRequest" targets="target_total"  />
	</s:form>
	<s:form theme="simple" id="frm_cancelSentRequest" action="cancelSentRequest" cssStyle="display:none;">
		<s:hidden name="rid" id="hidden_ridForCancel" />
		<sj:submit id="submit_cancelSentRequest" onSuccessTopics="successed_cancelSentRequest" targets="target_total"  />
	</s:form>
	<div id="target_total" style="display: none;"></div>
	
	
	<s:form theme="simple" id="frm_loadSentRequests" action="loadSentRequests" cssStyle="display:none;">
		<sj:submit id="submit_loadSentRequests" onSuccessTopics="successed_loadSentRequests" targets="loadSentRequestsID"  />
	</s:form>
	<s:form theme="simple" id="frm_loadArchivedRequests" action="loadArchivedRequests" cssStyle="display:none;">
		<sj:submit id="submit_loadArchivedRequests" onSuccessTopics="successed_loadArchivedRequests" targets="loadArchivedRequestsID"  />
	</s:form>
	
	
	
</body>

</html>