<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="skills.size > 0">
<table class="table table-hover table-nomargin table-bordered">
	<thead>
		<tr>
			<th>عنوان</th>
			<th>موضوع</th>
			<th>میزان تسلط</th>
			<th>حذف</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="skills" >
			<tr>
				<td style="font-size: 15px;"><s:property value="title" /> </td>
				<td><s:property value="category" /></td>
				<td><s:property value="level" /></td>
				<td>
					<button type="button" onclick='deleteSkill(<s:property value="id" />);' class="btn btn-small btn-danger"><i class="icon-trash"></i> حذف</button>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;margin:10px 0;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>