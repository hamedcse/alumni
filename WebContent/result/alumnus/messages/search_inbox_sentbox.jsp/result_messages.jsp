<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="inboxMessages.size > 0 || sentboxMessages.size > 0 ">
<table class="table table-hover table-nomargin table-bordered">
	<thead>
		<tr>
			<th style="font-size: 12px;text-align:center;"><i class="icon-download-alt"></i>/<i class="icon-upload-alt"></i></th>
			<th>عنوان</th>
			<th >فرستنده</th>
			<th>گیرنده</th>
			<th>وضعیت</th>
			<th style="display:none;">متن</th>
			<th style="display:none;">ای دی فرستنده</th>
			<th style="display:none;">ای دی گیرنده</th>
			<th>تاریخ ارسال/دریافت</th>
			<th>مشاهده پیام</th>
			<th>حذف</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="inboxMessages" >
			<tr>
				<td><span class="label label-inverse"><i class="icon-download-alt"></i> دریافتی</span></td>
				<td style="font-size: 15px;" id='searchedInboxTitle<s:property value="id" />'><s:property value="title" /> </td>
				<td id='searchedInboxSender<s:property value="id" />'><s:property value="senderDetail" /></td>
				<td id='searchedInboxReciver<s:property value="id" />'><s:property value="reciverDetail" /></td>
				<td>
					<s:if test="isRead == true">
						<span class="label label-success">خوانده شده</span>	
					</s:if>
					<s:elseif test="isRead == false">
						<span id='searchedInboxStatus<s:property value="id" />' class="label label-info">خوانده  نشده</span>
					</s:elseif>
				</td>
				<td style="display:none;" id='searchedInboxBody<s:property value="id" />'>
					<s:property value="body" />
				</td>
				<td style="display:none;">
					<s:property value="senderID" />
				</td>
				<td style="display:none;">
					<s:property value="reciverID" />
				</td>
				<td id='searchedInboxDateTime<s:property value="id" />'>
					<s:property value="date" /> - <s:property value="time" />
				</td>
				<td>
					<button type="button" onclick='viewSearchedInboxMessage(<s:property value="id" />);' class="btn btn-small btn-success"><i class="glyphicon-message_full"></i> مشاهده</button>
				</td>
				<td>
					<button type="button" onclick='deleteSearchedInboxMessage(<s:property value="id" />);' class="btn btn-small btn-danger"><i class="icon-trash"></i> حذف</button>
				</td>
			</tr>
		</s:iterator>
		<s:iterator value="sentboxMessages" >
			<tr>
				<td><span class="label label-inverse"><i class="icon-upload-alt"></i> ارسالی</span></td>
				<td style="font-size: 15px;" id='searchedSentboxTitle<s:property value="id" />'><s:property value="title" /> </td>
				<td id='searchedSentboxSender<s:property value="id" />'><s:property value="senderDetail" /></td>
				<td id='searchedSentboxReciver<s:property value="id" />'><s:property value="reciverDetail" /></td>
				<td>
					<s:if test="isRead == true">
						<span class="label label-success">خوانده شده</span>	
					</s:if>
					<s:elseif test="isRead == false">
						<span id='searchedSentboxStatus<s:property value="id" />' class="label label-info">خوانده  نشده</span>
					</s:elseif>
				</td>
				<td style="display:none;" id='searchedSentboxBody<s:property value="id" />'>
					<s:property value="body" />
				</td>
				<td style="display:none;">
					<s:property value="senderID" />
				</td>
				<td style="display:none;">
					<s:property value="reciverID" />
				</td>
				<td id='searchedSentboxDateTime<s:property value="id" />'>
					<s:property value="date" /> - <s:property value="time" />
				</td>
				<td>
					<button type="button" onclick='viewSearchedSentboxMessage(<s:property value="id" />);' class="btn btn-small btn-success"><i class="glyphicon-message_full"></i> مشاهده</button>
				</td>
				<td>
					<button type="button" onclick='deleteSearchedSentboxMessage(<s:property value="id" />);' class="btn btn-small btn-danger"><i class="icon-trash"></i> حذف</button>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>