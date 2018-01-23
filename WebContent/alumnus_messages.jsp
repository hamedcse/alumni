<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - مدیریت پیام ها</title>

	<!-- Session checker --><%@ include file="include/session/session_alumnus.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
    <script src='js/plugins/jquery-ui/jquery.ui.position.min.js'></script>
    <script src='js/plugins/jquery-ui/jquery.ui.menu.min.js'></script>
    <script src='js/plugins/jquery-ui/jquery.ui.autocomplete.min.js'></script>
    
    <!-- TagIt --><link rel="stylesheet" type="text/css" href="css/iplugins/tagit/jquery.tagit.css">
	<!-- TagIt --><script src='js/iplugins/tagit/tag-it.min.js'></script>
	
	<script type="text/javascript">
		
		$(function(){
			$("#frm_sentMessage").validationEngine({scroll:false});
			$("#frm_searchInboxAndSentBoxMessages").validationEngine({scroll:false});
			startLoadingOverlay("loading_overlay");
			$('#txt_reciversUsername').tagit({
				allowSpaces: false,
				removeConfirmation: true,
				requireAutocomplete: true,
				maxTags: 5,
				tagLimit: 5,
			    tagSource:function (request,response) {
					$.ajax({
						type:"GET",
						url: "result/common/alumnus_list/for_sent_message/alumnus_list.jsp",
						dataType: "json", 
						data: { term:request.term },
							success: function( data ) {
								response( $.map( data, function( item ) {return {label: item.username};  }));
						}   
					});
				}
			});
			$('#txt_senderForSearchInboxSentbox').tagit({
				allowSpaces: false,
				removeConfirmation: true,
				requireAutocomplete: true,
				maxTags: 1,
				tagLimit: 1,
			    tagSource:function (request,response) {
					$.ajax({
						type:"GET",
						url: "result/common/alumnus_list/for_search/alumnus_list.jsp",
						dataType: "json", 
						data: { term:request.term },
							success: function( data ) {
								response( $.map( data, function( item ) {return {label: item.username};  }));
						}   
					});
				}
			});
			$('#txt_reciverForSearchInboxSentbox').tagit({
				allowSpaces: false,
				removeConfirmation: true,
				requireAutocomplete: true,
				maxTags: 1,
				tagLimit: 1,
			    tagSource:function (request,response) {
					$.ajax({
						type:"GET",
						url: "result/common/alumnus_list/for_search/alumnus_list.jsp",
						dataType: "json", 
						data: { term:request.term },
							success: function( data ) {
								response( $.map( data, function( item ) {return {label: item.username};  }));
						}   
					});
				}
			});
			$('#txt_senderForSearchArchive').tagit({
				allowSpaces: false,
				removeConfirmation: true,
				requireAutocomplete: true,
				maxTags: 1,
				tagLimit: 1,
			    tagSource:function (request,response) {
					$.ajax({
						type:"GET",
						url: "result/common/alumnus_list/for_search/alumnus_list.jsp",
						dataType: "json", 
						data: { term:request.term },
							success: function( data ) {
								response( $.map( data, function( item ) {return {label: item.username};  }));
						}   
					});
				}
			});
			$('#txt_reciverForSearchArchive').tagit({
				allowSpaces: false,
				removeConfirmation: true,
				requireAutocomplete: true,
				maxTags: 1,
				tagLimit: 1,
			    tagSource:function (request,response) {
					$.ajax({
						type:"GET",
						url: "result/common/alumnus_list/for_search/alumnus_list.jsp",
						dataType: "json", 
						data: { term:request.term },
							success: function( data ) {
								response( $.map( data, function( item ) {return {label: item.username};  }));
						}   
					});
				}
			});
			
		});
		//--------------------------------------------------------// 
		$.subscribe('successed_loadSentMessages', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_loadInboxMessages', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_loadArchivedMessages', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_deleteSentMessage', function(event,element) {
			document.getElementById('submit_loadSentMessages').click();
			document.getElementById('submit_loadArchivedMessages').click();
		});
		$.subscribe('successed_deleteInboxMessage', function(event,element) {
			document.getElementById('submit_loadInboxMessages').click();
			document.getElementById('submit_loadArchivedMessages').click();
		});
		$.subscribe('successed_loadAlumnusListForSendMessage', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_sentMessage', function(event,element) {
			document.getElementById('submit_loadSentMessages').click();
		});
		$.subscribe('successed_searchInboxAndSentBoxMessages', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_searchArchiveMessages', function(event,element) {
			stopLoadingOverlay("loading_overlay");
		});
		$.subscribe('successed_markMessageAsRead', function(event,element) {
			stopLoadingOverlay("loading_overlay");
			var targetSpan = $('#'+$('#hidden_messageType').val()+'Status'+$('#hidden_mid').val());
			targetSpan.html('خوانده شده');
			targetSpan.removeClass('label-info');
			targetSpan.addClass('label-success');
		});
		//--------------------------------------------------------//
		function deleteSentMessage(id) {
             $('#hidden_sid').val(id);
			 document.getElementById('submit_deleteSentMessage').click();
             startLoadingOverlay("loading_overlay");
		}
		function deleteInboxMessage(id) {
            $('#hidden_iid').val(id);
			 document.getElementById('submit_deleteInboxMessage').click();
            startLoadingOverlay("loading_overlay");
		}
		function viewSentMessage(id) {
            $('#txt_title').val($('#sentboxTitle'+id).html());
            $('#txt_sender').val($('#sentboxSender'+id).html());
            $('#txt_reciver').val($('#sentboxReciver'+id).html());
            $('#txt_dateTime').val($.trim($('#sentboxDateTime'+id).html()));
            $('#txt_body').val($.trim($('#sentboxBody'+id).html()));
			$('#modal_viewMessageID').modal('show');
			$('#hidden_mid').val(id);
			$('#hidden_messageType').val('sentbox');
            document.getElementById('submit_markMessageAsRead').click();
            startLoadingOverlay("loading_overlay");
		}
		function viewInboxMessage(id) { 
            $('#txt_title').val($('#inboxTitle'+id).html());
            $('#txt_sender').val($('#inboxSender'+id).html());
            $('#txt_reciver').val($('#inboxReciver'+id).html());
            $('#txt_dateTime').val($.trim($('#inboxDateTime'+id).html()));
            $('#txt_body').val($.trim($('#inboxBody'+id).html()));
			$('#modal_viewMessageID').modal('show');
			$('#hidden_mid').val(id);
			$('#hidden_messageType').val('inbox');
            document.getElementById('submit_markMessageAsRead').click();
            startLoadingOverlay("loading_overlay");
		}
		function viewArchivedMessage(id) {
            $('#txt_title').val($('#trashTitle'+id).html());
            $('#txt_sender').val($('#trashSender'+id).html());
            $('#txt_reciver').val($('#trashReciver'+id).html());
            $('#txt_dateTime').val($.trim($('#trashDateTime'+id).html()));
            $('#txt_body').val($.trim($('#trashBody'+id).html()));
			$('#modal_viewMessageID').modal('show');
			$('#hidden_mid').val(id);
			$('#hidden_messageType').val('trash');
            document.getElementById('submit_markMessageAsRead').click();
            startLoadingOverlay("loading_overlay");
		}
		function sentMessage() {
			if($("#frm_sentMessage").validationEngine('validate')){
				$('#hidden_reciverID').val($('#select_reciverUsername').val());
				document.getElementById('submit_sentMessage').click();
				startLoadingOverlay("loading_overlay");
			}
		}
		function searchInboxAndSentboxMessages() {
			document.getElementById('submit_searchInboxAndSentBoxMessages').click();
			startLoadingOverlay("loading_overlay");
		}
		function viewSearchedInboxMessage(id) { 
            $('#txt_title').val($('#searchedInboxTitle'+id).html());
            $('#txt_sender').val($('#searchedInboxSender'+id).html());
            $('#txt_reciver').val($('#searchedInboxReciver'+id).html());
            $('#txt_dateTime').val($.trim($('#searchedInboxDateTime'+id).html()));
            $('#txt_body').val($.trim($('#searchedInboxBody'+id).html()));
			$('#modal_viewMessageID').modal('show');
			$('#hidden_mid').val(id);
			$('#hidden_messageType').val('inbox');
            document.getElementById('submit_markMessageAsRead').click();
            document.getElementById('submit_searchInboxAndSentBoxMessages').click();
            startLoadingOverlay("loading_overlay");
		}
		function deleteSearchedInboxMessage(id) {
            $('#hidden_iid').val(id);
			 document.getElementById('submit_deleteInboxMessage').click();
			 window.setTimeout(function(){document.getElementById('submit_searchInboxAndSentBoxMessages').click();},400);
            startLoadingOverlay("loading_overlay");
		}
		function viewSearchedSentboxMessage(id) {
            $('#txt_title').val($('#searchedSentboxTitle'+id).html());
            $('#txt_sender').val($('#searchedSentboxSender'+id).html());
            $('#txt_reciver').val($('#searchedSentboxReciver'+id).html());
            $('#txt_dateTime').val($.trim($('#searchedSentboxDateTime'+id).html()));
            $('#txt_body').val($.trim($('#searchedSentboxBody'+id).html()));
			$('#modal_viewMessageID').modal('show');
			$('#hidden_mid').val(id);
			$('#hidden_messageType').val('sentbox');
            document.getElementById('submit_markMessageAsRead').click();
            document.getElementById('submit_searchInboxAndSentBoxMessages').click();
            startLoadingOverlay("loading_overlay");
		}
		function deleteSearchedSentboxMessage(id) {
            $('#hidden_sid').val(id);
			 document.getElementById('submit_deleteSentMessage').click();
			 window.setTimeout(function(){document.getElementById('submit_searchInboxAndSentBoxMessages').click();},400);
            startLoadingOverlay("loading_overlay");
		}
		function searchArchiveMessages() {
			document.getElementById('submit_searchArchiveMessages').click();
			startLoadingOverlay("loading_overlay");
		}
		function viewSearchedArchiveMessage(id) {
            $('#txt_title').val($('#searchedArchiveTitle'+id).html());
            $('#txt_sender').val($('#searchedArchiveSender'+id).html());
            $('#txt_reciver').val($('#searchedArchiveReciver'+id).html());
            $('#txt_dateTime').val($.trim($('#searchedArchiveDateTime'+id).html()));
            $('#txt_body').val($.trim($('#searchedArchiveBody'+id).html()));
			$('#modal_viewMessageID').modal('show');
			$('#hidden_mid').val(id);
			$('#hidden_messageType').val('trash');
            document.getElementById('submit_markMessageAsRead').click();
            startLoadingOverlay("loading_overlay");
            document.getElementById('submit_searchArchiveMessages').click();
		}
	</script>
	<style type="text/css">
		span.label{font-size: 11px;font-weight: normal;width: 95%;text-align: center;}
		.mybold td {
			font-weight: bold !important;
			background-color: #dbdbdb !important;
		}
		.myunbold td {font-weight: normal !important}
		.cntus, .cntus:VISITED{text-decoration:none;color:#0071A7;font-size:13px;font-weight:bold;}
		.cntus:HOVER {color:#b7274b;}
		ul.tagit {
			padding: 1px 5px;
			overflow: auto;
			margin-left: inherit; /* usually we don't want the regular ul margins. */
			margin-right: inherit;
			direction:rtl;
			width:500px !important;
			min-height:20px;
			margin-right: 0px;
		}
		li.ui-menu-item{ padding: 5px; }
		li.ui-menu-item a{padding: 3px;}
		ul.ui-autocomplete.ui-menu.ui-widget.ui-widget-content.ui-corner-all{width:200px!important;list-style:none!important;}
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
				<div class="pull-left"><h1>مدیریت پیام ها</h1></div>
				<!-- board --><%@ include file="include/board/board_alumnus.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="alumnus_messages.jsp">مدیریت پیام ها</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-bordered box-color satblue">
						<div class="box-title">
							<h3><i class="glyphicon-inbox"></i> پیام ها</h3>
						</div>
						<div class="box-content nopadding">
							<ul class="tabs tabs-inline tabs-top">
								<li class="active">
									<a href="#first11" data-toggle="tab"><i class="glyphicon-inbox_out"></i> پیام های ارسالی</a>
								</li>
								<li>
									<a href="#second22" data-toggle="tab"><i class="glyphicon-inbox_in"></i> پیام های دریافتی</a>
								</li>
								<li>
									<a href="#thirds33" data-toggle="tab"><i class="glyphicon-message_full"></i> ارسال پیام</a>
								</li>
								<li>
									<a href="#fourths44" data-toggle="tab"><i class="glyphicon-search"></i> جستجو  پیام ها</a>
								</li>
							</ul>
							<div class="tab-content padding tab-content-inline tab-content-bottom" style="max-height: 350px;overflow-y: scroll;">
								<div class="tab-pane active" id="first11">
									<s:url id="loadSentMessages" value="/loadSentMessages.action"/>
									<sj:div href="%{loadSentMessages}" id="loadSentMessagesID" onSuccessTopics="successed_loadSentMessages"></sj:div>
								</div>
								<div class="tab-pane" id="second22">
									<s:url id="loadInboxMessages" value="/loadInboxMessages.action"/>
									<sj:div href="%{loadInboxMessages}" id="loadInboxMessagesID" onSuccessTopics="successed_loadInboxMessages"></sj:div>
								</div>
								<div class="tab-pane" id="thirds33">
									<s:form theme="simple" action="sentMessage" id="frm_sentMessage" method="post" cssClass="form-horizontal form-column form-bordered">
										<div class="span12">
											<div class="control-group">
												<label for="txt_reciversUsername" class="control-label">گیرنده(حداکثر 5 نفر):</label>
												<div class="controls">
													<input type="text" name="reciversUsername" id="txt_reciversUsername"/>
												</div>
											</div>
											<div class="control-group">
												<label for="txt_title" class="control-label">عنوان:</label>
												<div class="controls">
													<input type="text" name="title" id="txt_titleForSentMessage" class="input-xlarge validate[required]" />
												</div>
											</div>
											<div class="control-group">
												<label for="txt_body" class="control-label">متن:</label>
												<div class="controls">
													<textarea name="body" id="txt_bodyForSentMessage" class="input-xlarge validate[required]" rows="6" cols="100" style="width:90%;"></textarea>
												</div>
											</div>
										</div>
										<div class="span12">
											<div class="form-actions">
												<button type="button" onclick="sentMessage();" class="btn btn-primary" >ارسال</button>
												<button type="reset"  class="btn" style="font-family: 'B Roya',Tahoma,Arial !important;font-size: 18px !important;">انصراف</button>
											</div>
										</div>
										<sj:submit id="submit_sentMessage" onSuccessTopics="successed_sentMessage" targets="target_total" cssStyle="display:none;" />
									</s:form>
								</div>
								<div class="tab-pane" id="fourths44">
									<s:form theme="simple" action="searchInboxAndSentBoxMessages" id="frm_searchInboxAndSentBoxMessages" method="post" cssClass="form-horizontal">
										<div class="control-group">
											<label for="txt_titleAndBoby" style="text-align: center;" class="control-label">متن / عنوان:</label>
											<div class="controls">
												<input type="text" id="txt_titleAndBoby" name="titleAndBoby" style="float:right;"  class="span9" />
												<button type="button" onclick="searchInboxAndSentboxMessages();" class="btn btn-inverse span3" ><i class="icon-search"></i> بگرد</button>
											</div>
										</div>
										<div class="control-group">
											<label for="txt_senderForSearchInboxSentbox" style="text-align: center;" class="control-label">فرستنده:</label>
											<div class="controls">
												<input type="text" name="sender" id="txt_senderForSearchInboxSentbox"/>
											</div>
											<label for="txt_reciverForSearchInboxSentbox" style="text-align: center;" class="control-label">گیرنده:</label>
											<div class="controls">
												<input type="text" name="reciver" id="txt_reciverForSearchInboxSentbox"/>
											</div>
										</div>
										<sj:submit id="submit_searchInboxAndSentBoxMessages" onSuccessTopics="successed_searchInboxAndSentBoxMessages" targets="target_searchInboxAndSentBoxMessages" cssStyle="display:none;" />
									</s:form>
									<div id="target_searchInboxAndSentBoxMessages"></div>
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
							<h3><i class="icon-trash"></i> آرشیو پیام ها</h3>
						</div>
						<div class="box-content nopadding">
							<ul class="tabs tabs-inline tabs-top">
								<li class="active">
									<a href="#archiveFirst11" data-toggle="tab"><i class="glyphicon-inbox_out"></i> آرشیو پیام ها</a>
								</li>
								<li>
									<a href="#archiveSecond22" data-toggle="tab"><i class="glyphicon-search"></i> جستجو  آرشیو پیام ها</a>
								</li>
							</ul>
							<div class="tab-content padding tab-content-inline tab-content-bottom" style="max-height: 350px;overflow-y: scroll;">
								<div class="tab-pane active" id="archiveFirst11">
									<s:url id="loadArchivedMessages" value="/loadArchivedMessages.action"/>
									<sj:div href="%{loadArchivedMessages}" id="loadArchivedMessagesID" onSuccessTopics="successed_loadArchivedMessages"></sj:div>
								</div>
								<div class="tab-pane" id="archiveSecond22">
									<s:form theme="simple" action="searchArchiveMessages" id="frm_searchArchiveMessages" method="post" cssClass="form-horizontal">
										<div class="control-group">
											<label for="txt_titleAndBobyForSearchArchive" style="text-align: center;" class="control-label">متن / عنوان:</label>
											<div class="controls">
												<input type="text" id="txt_titleAndBobyForSearchArchive" name="titleAndBoby" style="float:right;"  class="span9" />
												<button type="button" onclick="searchArchiveMessages();" class="btn btn-inverse span3" ><i class="icon-search"></i> بگرد</button>
											</div>
										</div>
										<div class="control-group">
											<label for="txt_senderForSearchArchive" style="text-align: center;" class="control-label">فرستنده:</label>
											<div class="controls">
												<input type="text" name="sender" id="txt_senderForSearchArchive"/>
											</div>
											<label for="txt_reciverForSearchArchive" style="text-align: center;" class="control-label">گیرنده:</label>
											<div class="controls">
												<input type="text" name="reciver" id="txt_reciverForSearchArchive"/>
											</div>
										</div>
										<sj:submit id="submit_searchArchiveMessages" onSuccessTopics="successed_searchArchiveMessages" targets="target_searchArchiveMessages" cssStyle="display:none;" />
									</s:form>
									<div id="target_searchArchiveMessages"></div>
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
	
	<!-- viewMessage modal -->
	<div id="modal_viewMessageID" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">مشاهده پیام</h3>
		</div>
		<div class="modal-body">
			<form  method="post" class="form-horizontal form-column form-bordered">
				<div class="span12">
					<div class="control-group">
						<label for="txt_title" class="control-label">عنوان:</label>
						<div class="controls">
							<input type="text" id="txt_title" class="">
						</div>
				    </div>
				    <div class="control-group">
						<label for="txt_sender" class="control-label">فرستنده:</label>
						<div class="controls">
							<input type="text" name="" id="txt_sender"  class="">
						</div>
				    </div>
				    <div class="control-group">
						<label for="txt_reciver" class="control-label">گیرنده:</label>
						<div class="controls">
							<input type="text" name="" id="txt_reciver"  class="">
						</div>
				    </div>
				    <div class="control-group">
						<label for="txt_dateTime" class="control-label">تاریخ ارسال:</label>
						<div class="controls">
							<input type="text" name="" id="txt_dateTime"  class="">
						</div>
				    </div>
				    <div class="control-group">
						<label for="txt_" class="control-label">متن:</label>
						<div class="controls">
							<textarea id="txt_body" rows="7" cols="400" style="width:100%;"></textarea>
						</div>
				    </div>
				</div>
			</form>	
		</div>
		<div class="modal-footer">
			<button class="btn btn-inverse" data-dismiss="modal" aria-hidden="true">بستن</button>
		</div>
	</div>
	<!-- /viewMessage modal -->
	
	
	
	

<!--================================================================================================================-->
<!--# 												  Ajaxers: 								    			       #-->
<!--================================================================================================================--> 
	
	<s:form theme="simple" id="frm_deleteSentMessage" action="deleteSentMessage" cssStyle="display:none;">
		<s:hidden name="sid" id="hidden_sid" />
		<sj:submit id="submit_deleteSentMessage" onSuccessTopics="successed_deleteSentMessage" targets="target_total"  />
	</s:form>
	<s:form theme="simple" id="frm_deleteInboxMessage" action="deleteInboxMessage" cssStyle="display:none;">
		<s:hidden name="iid" id="hidden_iid" />
		<sj:submit id="submit_deleteInboxMessage" onSuccessTopics="successed_deleteInboxMessage" targets="target_total"  />
	</s:form>
	<s:form theme="simple" id="frm_markMessageAsRead" action="markMessageAsRead" cssStyle="display:none;">
		<s:hidden name="mid" id="hidden_mid" />
		<s:hidden name="type" id="hidden_messageType" />
		<sj:submit id="submit_markMessageAsRead" onSuccessTopics="successed_markMessageAsRead" targets="target_total"  />
	</s:form>
	<div id="target_total" style="display: none;"></div>
	
	
	<s:form theme="simple" id="frm_loadSentMessages" action="loadSentMessages" cssStyle="display:none;">
		<sj:submit id="submit_loadSentMessages" onSuccessTopics="successed_loadSentMessages" targets="loadSentMessagesID"  />
	</s:form>
	<s:form theme="simple" id="frm_loadInboxMessages" action="loadInboxMessages" cssStyle="display:none;">
		<sj:submit id="submit_loadInboxMessages" onSuccessTopics="successed_loadInboxMessages" targets="loadInboxMessagesID"  />
	</s:form>
	<s:form theme="simple" id="frm_loadArchivedMessages" action="loadArchivedMessages" cssStyle="display:none;">
		<sj:submit id="submit_loadArchivedMessages" onSuccessTopics="successed_loadArchivedMessages" targets="loadArchivedMessagesID"  />
	</s:form>
	
	
	
</body>

</html>