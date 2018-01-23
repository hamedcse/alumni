<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="navigation">
	<div class="container-fluid">
		<a href="home" id="brand" rel="tooltip" data-placement="bottom" data-original-title="سامانه فارغ التحصیلان دانشگاه زنجان">			
			<img src="img/topbar-logo.png" alt="znu" class='retina-ready' style="width:32px;height:26px;">
			Alumni	
		</a>
		<a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="نمایش/مخفی کردن منو سمت راست">
			<i class="icon-reorder"></i>
		</a>
		<ul class='main-nav'>
			<li>
				<a href="home">
					<span><i class="icon-home" style="font-size:16px;"></i></span>
				</a>
			</li>
			<li>
				<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
					<span><i class="glyphicon-show_thumbnails" style="margin-left: 5px;margin-top: -2px;"></i> پروژه  </span>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li>
						<a href="common_project_search.jsp">جستجو  پروژه جدید</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="common_alumnus_search.jsp" style="font-family:tahoma!important;"  class='dropdown-toggle'>
					<i class="icon-search" style="margin-left:8px;font-size: 13px;"></i>جستجو لیست فارغ التحصیلان دانشگاه 
				</a>
			</li>
		</ul>
		<div class="user">
			<ul class="icon-nav">
				<li class="dropdown" style="font-family:tahoma!important;">
					<a href="#"  class='dropdown-toggle' data-toggle="dropdown" >
						<%=session.getAttribute("UserDetail")%>
						<i class="glyphicon-user" style="margin-right:8px;"></i>
					</a>
					<ul class="dropdown-menu pull-right" style="min-width: 130px!important;">
						<li>
							<a href="alumnus_profile.jsp"><i class="glyphicon-user" style="margin-left: 5px;margin-top: -4px;"></i> مشاهده پروفایل</a>
						</li>
						<li>
							<a href="logout"><i class="icon-signout" style="margin-left:8px;margin-right:2px"></i> خروج</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>