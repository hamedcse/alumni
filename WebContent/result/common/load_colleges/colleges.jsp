<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<select name="college" id="select_college" class="input-large" tabindex="-1">
	<option value=""></option>
	<s:iterator value="colleges" >
		<option value='<s:property value="name" />'><s:property value="name" /></option>
	</s:iterator>
</select>
<script type="text/javascript">$('#select_college').select2();</script>
