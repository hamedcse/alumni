<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="requests.size > 0">
<table class="table table-hover table-nomargin table-bordered">
	<thead>
		<tr>
			<th>عنوان</th>
			<th>فرستنده</th>
			<th>گیرنده</th>
			<th>وضعیت</th>
			<th>لغو درخواست</th>
			<th>حذف</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="requests" >
			<tr>
				<td style="font-size: 15px;"><s:property value="title" /> </td>
				<td><s:property value="sourceDetail" /></td>
				<td><s:property value="targetDetail" /></td>
				<td>
					<s:if test="status == -1">
						<span class="label label-important">رد شده</span>	
					</s:if>
					<s:elseif test="status == 0">
						<span class="label label-info">بررسی نشده</span>
					</s:elseif>
					<s:elseif test="status == 1">
						<span class="label label-success">قبول شده</span>
					</s:elseif>
					<s:elseif test="status == 3">
						<span class="label label-inverse">لغو شده</span>
					</s:elseif>
				</td>
				<td>
					<s:if test="isCancelledBySource == false">
						<button type="button" id='btn_cancelrequest<s:property value="id" />' onclick='cancelRequest(<s:property value="id" />);' class="btn btn-small btn-warning"><i class="glyphicon-thumbs_down" style="line-height: 10px;"></i> لغو درخواست</button>	
					</s:if>
					<s:else>
						<button type="button" class="btn btn-small btn-info"><i class="icon-exclamation-sign"></i> درخواست شما لغو شد</button>
					</s:else>
				</td>
				<td>
					<button type="button" onclick='deleteSentRequest(<s:property value="id" />);' class="btn btn-small btn-danger"><i class="icon-trash"></i> حذف</button>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;margin:10px 0;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>