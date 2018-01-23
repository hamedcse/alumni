<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="activeAlumnusList.size > 0 || archivedAlumnusList.size > 0 ">
<table class="table table-hover table-nomargin table-bordered">
	<thead>
		<tr>
			<th>مشخصات</th>
			<th>سال فراغت از تحصیل</th>
			<th>فارغ التحصیل رشته</th>
			<th>مقطع</th>
			<!-- <th>مشاهده جزئیات</th> -->
		</tr>
	</thead>
	<tbody>
		<s:iterator value="activeAlumnusList" >
			<tr>
				<td style="font-size: 15px;"><s:property value="name" /> <s:property value="family" /></td>
				<td><s:property value="yearOfGraduation" /></td>
				<td><s:property value="field" /></td>
				<td><s:property value="educationLevel" /></td>
				<!-- <td>--</td> -->
			</tr>
		</s:iterator>
		<s:iterator value="archivedAlumnusList" >
			<tr>
				<td style="font-size: 15px;"><s:property value="name" /> <s:property value="family" /></td>
				<td><s:property value="yearOfGraduation" /></td>
				<td><s:property value="field" /></td>
				<td><s:property value="educationLevel" /></td>
				<!-- <td>--</td> -->
			</tr>
		</s:iterator>
	</tbody>
</table>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>