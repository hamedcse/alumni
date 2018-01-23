<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="projects.size > 0 ">
<table class="table table-hover table-nomargin table-bordered">
	<thead>
		<tr>
			<th style="text-align:center;font-size: 18px;">عنوان</th>
			<th style="text-align:center;font-size: 18px;">موضوع</th>
			<th style="text-align:center;font-size: 18px;">رشته</th>
			<th style="text-align:center;width:15%;font-size: 18px;">مشاهده</th>
			<!-- <th>مشاهده جزئیات</th> -->
		</tr>
	</thead>
	<tbody>
		<s:iterator value="projects" >
			<tr>
				<td style="text-align:center;"><s:property value="title" /></td>
				<td style="text-align:center;"><s:property value="category" /></td>
				<td style="text-align:center;"><s:property value="field" /></td>
				<td style="text-align:center;padding:0;">
					<a style="font-size:11px;" href='viewProjectDetail?pid=<s:property value="id" />' target="_blank" class="btn btn-blue">
						<i class="icon-search"></i>
						مشاهده 
					</a>
				</td>
				<!-- <td>--</td> -->
			</tr>
		</s:iterator>
	</tbody>
</table>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>