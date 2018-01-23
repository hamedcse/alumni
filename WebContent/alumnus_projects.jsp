<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان  - پروژه  های  من</title>

	<!-- Session checker --><%@ include file="include/session/session_alumnus.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>
	<!-- JQuery-calendar --><script src='js/iplugins/datepicker/jquery.ui.datepicker-cc.all.min.js'></script>
	
	<script type="text/javascript">
		var color = ["blue","satgreen","lightred","darkblue","teal","grey"];	
		$(function(){
			startLoadingOverlay("loading_overlay");
		});
		//--------------------------------------------------------//
		$.subscribe('successed_loadAlumnusProjects', function(event,element) {
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
		//--------------------------------------------------------//
		function submitForm() {
			
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
				<div class="pull-left"><h1>پروژه  های من</h1></div>
				<!-- board --><%@ include file="include/board/board_alumnus.jsp" %><!-- /board-->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="alumnus_projects.jsp">پروژه های من</a></li>
				</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<s:url id="loadAlumnusProjects" value="/loadAlumnusProjects.action"/>
			<sj:div href="%{loadAlumnusProjects}" id="loadAlumnusProjectsID" onSuccessTopics="successed_loadAlumnusProjects"></sj:div>
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
	
	
	
	
	
	
	
</body>

</html>