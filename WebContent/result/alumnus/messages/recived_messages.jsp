<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="messages.size > 0">
<table class="table table-hover table-nomargin table-bordered">
	<thead>
		<tr>
			<th>عنوان</th>
			<th>فرستنده</th>
			<th style="display:none;">گیرنده</th>
			<th>وضعیت</th>
			<th style="display:none;">متن</th>
			<th style="display:none;">ای دی فرستنده</th>
			<th style="display:none;">ای دی گیرنده</th>
			<th>تاریخ دریافت</th>
			<th>مشاهده پیام</th>
			<th>حذف</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="messages" >
			<tr>
				<td style="font-size: 15px;" id='inboxTitle<s:property value="id" />'><s:property value="title" /> </td>
				<td id='inboxSender<s:property value="id" />'><s:property value="senderDetail" /></td>
				<td style="display:none;" id='inboxReciver<s:property value="id" />'><s:property value="reciverDetail" /></td>
				<td>
					<s:if test="isRead == true">
						<span class="label label-success">خوانده شده</span>	
					</s:if>
					<s:elseif test="isRead == false">
						<span id='inboxStatus<s:property value="id" />' class="label label-info">خوانده  نشده</span>
					</s:elseif>
				</td>
				<td style="display:none;" id='inboxBody<s:property value="id" />'>
					<s:property value="body"  />
				</td>
				<td style="display:none;">
					<s:property value="senderID" />
				</td>
				<td style="display:none;">
					<s:property value="reciverID" />
				</td>
				<td id='inboxDateTime<s:property value="id" />'>
					<s:property value="date" /> - <s:property value="time" />
				</td>
				<td>
					<button type="button" onclick='viewInboxMessage(<s:property value="id" />);' class="btn btn-small btn-success"><i class="glyphicon-message_full"></i> مشاهده</button>
				</td>
				<td>
					<button type="button" onclick='deleteInboxMessage(<s:property value="id" />);' class="btn btn-small btn-danger"><i class="icon-trash"></i> حذف</button>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>