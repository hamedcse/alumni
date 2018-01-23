<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div class="span12">
	<div class="control-group">
		<label for="txt_educationHistory" class="control-label">سوابق تحصیلی:</label>
		<div class="controls">
			<textarea theme="simple"  style="font-family: tahoma;width:80%;" value="" name="educationHistory" rows="7" cols="100" id="txt_educationHistory" class="input-xlarge validate[required]"><s:property value='resume.educationHistory'/></textarea>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_languageSkills" class="control-label">مهارت در زبان های خارجی:</label>
		<div class="controls">
			<textarea theme="simple"  style="font-family: tahoma;width:80%;" value='' name="languageSkills" rows="7" cols="100" id="txt_languageSkills" class="input-xlarge validate[required]"><s:property value="resume.languageSkills"/></textarea>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_researchActivities" class="control-label">فعالیت ها در زمینه پژوهشی:</label>
		<div class="controls">
			<textarea theme="simple"  style="font-family: tahoma;width:80%;" value='' name="researchActivities" rows="7" cols="100" id="txt_researchActivities" class="input-xlarge validate[required]"><s:property value="resume.researchActivities"/></textarea>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_businessActivities" class="control-label">فعالیت ها در زمینه کاری:</label>
		<div class="controls">
			<textarea theme="simple"  style="font-family: tahoma;width:80%;" value=''  name="businessActivities" rows="7" cols="100" id="txt_businessActivities" class="input-xlarge validate[required]"><s:property value="resume.businessActivities"/></textarea>
		</div>
	</div>
	<div class="control-group">
		<label for="txt_other" class="control-label">سایر توضیحات:</label>
		<div class="controls">
			<textarea theme="simple"  style="font-family: tahoma;width:80%;" value='' name="other" rows="7" cols="100" id="txt_other" class="input-xlarge"><s:property value="resume.other"/></textarea>
		</div>
	</div>
</div>