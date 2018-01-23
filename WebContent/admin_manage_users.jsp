<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%><%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!doctype html>
<html>
<head>
	<sj:head compressed="true" jqueryui="false"/>
	<title>سامانه فارغ التحصیلان - مدیریت کاربران</title>

	<!-- Session checker --><%@ include file="include/session/session_admin.jsp" %>
	<!-- Meta tags --><%@ include file="include/meta/meta.jsp" %>
    <!-- CSS links --><%@ include file="include/css/css.jsp" %>
    <!-- JS scripts --><%@ include file="include/js/js.jsp" %>

	<script type="text/javascript">
		$(function(){
			//$("#frm_id").validationEngine({scroll:false});
		});
		//--------------------------------------------------------//
		$.subscribe('successed_', function(event,element) {
			
		});
		//--------------------------------------------------------//
		function submitForm() {
			if($('#frm_id').validationEngine('validate')){
				$.fallr('show', {
	                buttons : {
	                    button1 : {text: 'بستن'},
	                    button2 : {
	                    	text: 'تایید',
							onclick:function(){
	                    		alert("تایید شد.");
	                    		$.fallr('hide');
	                    	}	
	                    }
	                },
	                content : '<p>آیا از تایید فرم زیر مطمئن هستید؟</p>',
	                icon    : 'check'
	            });
			}
		}
	</script>
	<style type="text/css">
		/* body{overflow:hidden;} */
		.box-title{margin-top:2px!important;}
		table td.tableVal{text-align:center;}
		#portfolioManagementAtaGlance tr{height:44.50px;}
		.modal{left:21.25%!important; ;width: 99.7% !important;right:2px!important;top:0%!important;}
		.modal-backdrop.fade.in,.modal-backdrop.in{/* background:none; */opacity:0.4;filter: alpha(opacity=40);}
		#modal_subMenu .tiles>li,#modal_subMenu .tiles>li a{width:18em!important;}
		#modal_subMenu {
			background:none;
			background: rgba(0, 0, 0,0.7);
			border:none!important;
			-webkit-box-shadow: 0 3px 7px rgba(0,0,0,0.3);
			-moz-box-shadow: 0 3px 7px rgba(0,0,0,0.3);
			box-shadow: 0 3px 7px rgba(0,0,0,0.3);
		}
		#modal_subMenu .tiles>li{float:left;margin-right:3px;}
		#modal_subMenu ul.tiles{margin:5px!important;}
		.name{text-align: center !important}
		.indices_details{font-size:11px;}
		.indices_details tr td,.indices_details tr th{padding:1px 15px!important}
		.tiles>li.long{width:100%;border-radius:2px;}
		.tiles>li.long>a{width: inherit;}
		.tiles>li.long>a span{padding-top:10px;}
		.tiles>li.long>a span i{font-size: 0.75em;padding-top:0.2em;}
		.tiles>li.long>a span.name{
			font-family: 'B Roya',Tahoma,Arial;
			font-size: 1.3em !important;
			background: #000;
			background: rgba(0, 0, 0, 0.18);
			padding: 0.5em 5px;
		}
		.tiles>li.long>a span.name i{margin-left: 3px;}
		.dateInfo{display:none;}
		.systemEndOfDayState tr td {text-align:center;font-size:18px;font-family: 'B Roya';}
		.tiles>li.long:hover:before{width:97%;}
		.box-content{padding:0!important;}
		.tiles>li{margin: 0px 0 0 8px;}
	</style>
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
				<div class="pull-left"><h1>مدیریت کاربران</h1></div>
				<!-- board --><%@ include file="include/board/board_admin.jsp" %><!-- board -->
			</div>
			<div class="breadcrumbs">
				<ul>
					<li><a href="home">خانه</a><i class="icon-angle-right"></i></li>
					<li><a href="admin_manage_users.jsp">مدیریت کاربران</a></li>
				</ul>
				<div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div>
			</div>
<!----------------------------------------------------Start Contents-------------------------------------------------->		
			<div class="row-fluid">
				<div class="span4">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="lightred long">
									<a href="admin_add_alumnus.jsp" >
										<span><i class="glyphicon-user_add"></i></span>
										<span class="name"><i class="glyphicon-user_add"></i> افزودن فارغ التحصیل</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="span4">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="satgreen long">
									<a href="admin_add_admin.jsp" >
										<span class="count"><i class="glyphicon-user_add"></i> </span>
										<span class="name"><i class="glyphicon-user_add" style="margin-left:1px;"></i> افزودن مدیر</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="span4">
					<div class="box">
						<div class="box-content">
							<ul class="tiles">
							 	<li class="satblue long">
									<a href="admin_add_project_manager.jsp" >
										<span class=""><i class="glyphicon-user_add"></i></span>
										<span class="name"><i class="glyphicon-user_add"></i> افزودن مدیر پروژه</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-color box-bordered darkblue"> 
						<div class="box-title">
							<h3><i class="glyphicon-list"></i> مدیران</h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							<table id="grid_admin"></table>
							<div id="pager_grid_admin"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-color box-bordered satblue">
						<div class="box-title">
							<h3><i class="glyphicon-list"></i> فارغ التحصیلان</h3>
							<div class="actions">
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
			<div class="row-fluid">
				<div class="span12">
					<div class="box box-color box-bordered teal">
						<div class="box-title">
							<h3><i class="glyphicon-list"></i> مدیران پروژه</h3>
							<div class="actions">
								<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
							</div>
						</div>
						<div class="box-content">
							<table id="grid_project_manager"></table>
							<div id="pager_grid_project_manager"></div>
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
	<script src="grids_js/admin/manage_users/grid_admin.js"></script>
	<script src="grids_js/admin/manage_users/grid_alumnus.js"></script>
	<script src="grids_js/admin/manage_users/grid_project_manager.js"></script>
	
	
	
	
	

<!--================================================================================================================-->
<!--# 												  Dialogs: 								    			       #-->
<!--================================================================================================================--> 
	
	
	
	
	
	

<!--================================================================================================================-->
<!--# 												  Ajaxers: 								    			       #-->
<!--================================================================================================================--> 
	
	
	
	
	
	
	
</body>

</html>