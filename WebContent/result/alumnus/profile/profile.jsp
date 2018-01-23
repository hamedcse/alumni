<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div class="span6">
	<div class="control-group">
		<label for="txt_username" class="control-label">نام کاربری:</label>
		<div class="controls">
			<input type="text" name="username" id="txt_username"
				value='<s:property value="alumnus.username"/>' disabled="disabled"
				class="" />
		</div>
	</div>
	<div class="control-group">
		<label for="txt_field" class="control-label">رشته:</label>
		<div class="controls">
			<input type="text" name="field" id="txt_field" value='<s:property value="alumnus.field"/>'  disabled="disabled"  class=" " />
		</div>
	</div>
	<div class="control-group">
		<label for="txt_college" class="control-label">دانشکده:</label>
		<div class="controls">
			<input type="text" name="college" id="txt_college" value='<s:property value="alumnus.college"/>'  disabled="disabled" class="" />
		</div>
	</div>
	<div class="control-group">
		<label for="txt_registerDate" class="control-label">تاریخ ثبت نام:</label>
		<div class="controls">
			<input type="text" name="registerDate" id="txt_registerDate"
				value='<s:property value="alumnus.registerDate"/>'
				disabled="disabled" class="" />
		</div>
	</div>
	<div class="control-group">
		<label for="txt_email" class="control-label"> پست الکترونیک:</label>
		<div class="controls">
			<input type="text" name="email" id="txt_email" value='<s:property value="alumnus.email"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_name" class="control-label">نام:</label>
		<div class="controls">
			<input type="text" name="name" id="txt_name" value='<s:property value="alumnus.name"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_family" class="control-label">نام خانوادگی:</label>
		<div class="controls">
			<input type="text" name="family" id="txt_family" value='<s:property value="alumnus.family"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_yearOfGraduation" class="control-label">سال فراغت از تحصیل:</label>
		<div class="controls">
			<input type="text" name="yearOfGraduationStr" id="txt_yearOfGraduation"
				value='<s:property value="alumnus.yearOfGraduation"/>' class="datepicker" />
		</div>
	</div>
	<div class="control-group">
		<label for="txt_aboutMe" class="control-label">درباره من:</label>
		<div class="controls">
			<textarea style="width:90%;" name="aboutMe" id="txt_aboutMe" rows="7" cols="100"><s:property value="alumnus.aboutMe"/></textarea>
		</div>
	</div>
</div>
<div class="span6">
	<div class="control-group">
		<label for="txt_city" class="control-label">شهر:</label>
		<div class="controls">
			<input type="text" name="city" id="txt_city" value='<s:property value="alumnus.city"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_state" class="control-label">استان:</label>
		<div class="controls">
			<input type="text" name="state" id="txt_state" value='<s:property value="alumnus.state"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_birthDate" class="control-label">تاریخ تولد:</label>
		<div class="controls">
			<input type="text" name="birthDateStr" id="txt_birthDate" value='<s:property value="alumnus.birthDate"/>' class=" datepicker"/>
		</div>
	</div>
	<div class="control-group">
		<label for="select_educationLevel" class="control-label">سطح تحصیلات:</label>
		<div class="controls">
			<input type="hidden" id="txt_educationLevel" value='<s:property value="alumnus.educationLevel"/>' class=""/>
			<select name="educationLevel" id="select_educationLevel" class="input-large " tabindex="-1">
				<option value="کاردانی">کاردانی</option>
				<option value="کارشناسی">کارشناسی</option>
				<option value="کارشناسی ارشد">کارشناسی ارشد</option>
				<option value="دکترا">دکترا</option>
			</select>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_average" class="control-label">معدل:</label>
		<div class="controls">
			<input type="text" name="average" id="txt_average" value='<s:property value="alumnus.average"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_cellNumber" class="control-label">تلفن همراه:</label>
		<div class="controls">
			<input type="text" name="cellNumber" id="txt_cellNumber" value='<s:property value="alumnus.cellNumber"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_gender" class="control-label">جنسیت:</label>
		<div class="controls">
			<input type="text" name="gender" id="txt_gender"  disabled="disabled"  value='<s:property value="alumnus.gender"/>' class=""/>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_married" class="control-label">وضعیت تاهل:</label>
		<div class="controls">
			<input type="text" name="married" id="txt_married" value='<s:property value="alumnus.married"/>' class=""/>
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