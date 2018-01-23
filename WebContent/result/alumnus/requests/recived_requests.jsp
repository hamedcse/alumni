<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="requests.size > 0">
<table class="table table-hover table-nomargin table-bordered">
	<thead>
		<tr>
			<th>عنوان</th>
			<th>فرستنده</th>
			<th>وضعیت ارسال</th>
			<th>گیرنده</th>
			<th>وضعیت</th>
			<th>حذف</th>
			<th>قبول</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="requests" >
			<tr>
				<td><s:property value="title" /> </td>
				<td><s:property value="sourceDetail" /></td>
				<td><s:property value="targetDetail" /></td>
				<td><s:property value="status" /></td>
				<td><s:property value="id" /></td>
				<td><s:property value="id" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;margin:10px 0;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>