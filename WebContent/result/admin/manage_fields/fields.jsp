<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="fields.size > 0">
<table class="table table-hover table-nomargin table-bordered">
	<thead>
		<tr>
			<th>نام رشته</th>
			<th>گرایش</th>
			<th>ویرایش</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="fields" >
			<tr>
				<td id='name<s:property value="id" />' style="font-size: 15px;"><s:property value="name" /> </td>
				<td id='orientation<s:property value="id" />'><s:property value="orientation" /></td>
				<td>
					<button type="button" onclick='editField(<s:property value="id" />);' class="btn btn-small btn-inverse"><i class="icon-edit"></i> ویرایش</button>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;margin:10px 0;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>