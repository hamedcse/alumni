<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<select name="field" id="select_field" class="input-large classSelect2" tabindex="-1">
	<option value=""></option>
	<s:iterator value="fields" >
		<option value='<s:property value="name" />'><s:property value="name" /> - <s:property value="orientation" /></option>
	</s:iterator>
</select>
<script type="text/javascript">$('#select_field').select2();</script>
