<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<select name="category" id="select_category" class="select2-me select2-offscreen smallFont input-xxlarge" data-placeholder="لطفا یک گزینه را انتخاب نمایید" tabindex="-1">
	<option value="عمومی" >عمومی</option>
</select>
<script type="text/javascript">
	$('#select_category').select2();
</script>