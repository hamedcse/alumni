<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="categories.size > 0">
<table class="table table-hover table-nomargin table-bordered">
	<thead>
		<tr>
			<th>موضوع</th>
			<th>توضیح</th>
			<th>ویرایش</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="categories" >
			<tr>
				<td id='name<s:property value="id" />' style="font-size: 15px;"><s:property value="name" /> </td>
				<td id='description<s:property value="id" />'><s:property value="description" /></td>
				<td>
					<button type="button" onclick='editCategory(<s:property value="id" />);' class="btn btn-small btn-inverse"><i class="icon-edit"></i> ویرایش</button>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;margin:10px 0;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>