<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div class="span6">
	<div class="control-group">
		<label for="txt_username" class="control-label">نام کاربری:</label>
		<div class="controls">
			<input type="text" name="username" id="txt_username"
				value='<s:property value="projectManager.username"/>' disabled="disabled"
				class="" />
		</div>
	</div>
	<div class="control-group">
		<label for="txt_registerDate" class="control-label">تاریخ ثبت نام:</label>
		<div class="controls">
			<input type="text" name="registerDate" id="txt_registerDate"
				value='<s:property value="projectManager.registerDate"/>'
				disabled="disabled" class="" />
		</div>
	</div>
	<div class="control-group">
		<label for="txt_email" class="control-label"> پست الکترونیک:</label>
		<div class="controls">
			<input type="text" name="email" id="txt_email" value='<s:property value="projectManager.email"/>' class=""/>
		</div>
	</div>
</div>	
<div class="span6">
	<div class="control-group">
		<label for="txt_family" class="control-label">نام خانوادگی:</label>
		<div class="controls">
			<input type="text" name="family" id="txt_family" value='<s:property value="projectManager.family"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_name" class="control-label">نام:</label>
		<div class="controls">
			<input type="text" name="name" id="txt_name" value='<s:property value="projectManager.name"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_aboutMe" class="control-label">درباره من:</label>
		<div class="controls">
			<textarea type="text" name="txt_aboutMe" id="txt_aboutMe" class="" ><s:property value="projectManager.aboutMe"/></textarea>
		</div>
	</div>
	<%-- <div class="control-group">
		<label for="txt_type" class="control-label">نوع:</label>
		<div class="controls">
			<input type="text" name="type" disabled="disabled" id="txt_type" value='<s:property value="projectManager.type"/>' class=""/>
		</div>
	</div> --%>
</div>
<script type="text/javascript">
$('.datepicker').datepicker({
	changeMonth: true,
	changeYear: true,
	dateFormat: 'yy/mm/dd',
	yearRange: 'c-100:c+20',
});
</script>