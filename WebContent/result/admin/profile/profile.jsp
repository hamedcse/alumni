<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div class="span6">
	<div class="control-group">
		<label for="txt_username" class="control-label">نام کاربری:</label>
		<div class="controls">
			<input type="text" name="username" id="txt_username"
				value='<s:property value="admin.username"/>' disabled="disabled"
				class="" />
		</div>
	</div>
	<div class="control-group">
		<label for="txt_registerDate" class="control-label">تاریخ ثبت نام:</label>
		<div class="controls">
			<input type="text" name="registerDate" id="txt_registerDate"
				value='<s:property value="admin.registerDate"/>'
				disabled="disabled" class="" />
		</div>
	</div>
	<div class="control-group">
		<label for="txt_email" class="control-label"> پست الکترونیک:</label>
		<div class="controls">
			<input type="text" name="email" id="txt_email" value='<s:property value="admin.email"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_name" class="control-label">نام:</label>
		<div class="controls">
			<input type="text" name="name" id="txt_name" value='<s:property value="admin.name"/>' class=""/>
		</div>
	</div>
</div>	
<div class="span6">
	<div class="control-group">
		<label for="txt_family" class="control-label">نام خانوادگی:</label>
		<div class="controls">
			<input type="text" name="family" id="txt_family" value='<s:property value="admin.family"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_privilegeLevel" class="control-label">سطح دسترسی:</label>
		<div class="controls">
			<input type="text" name="privilegeLevel" disabled="disabled" id="txt_privilegeLevel" value='<s:property value="admin.privilegeLevel"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_type" class="control-label">نوع:</label>
		<div class="controls">
			<input type="text" name="type" disabled="disabled" id="txt_type" value='<s:property value="admin.type"/>' class=""/>
		</div>
	</div>
</div>
<script type="text/javascript">
$('.datepicker').datepicker({
	changeMonth: true,
	changeYear: true,
	dateFormat: 'yy/mm/dd',
	yearRange: 'c-100:c+20',
});
</script>