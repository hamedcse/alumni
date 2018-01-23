<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="div_actionMessagesID" dir="rtl" style="display:none;">
    <s:actionmessage id="actionmessageID" cssStyle="color:#090;"/>
    <s:actionerror id="actionerrorID" cssStyle="color:#F00;"/>
</div>

<!-- ************** -->
<!--     Fallr      -->
<!-- ************** -->
<script type="text/javascript">
	$(function(){
		if($('#actionerrorID').length>0){
			$('ul[id=actionerrorID]>li').contents().unwrap();$('ul[id=actionerrorID]').contents().unwrap().text();
			$.fallr('show', {
				buttons : {
					button1 : {text: 'بستن', danger: false}
				},
				content : '<p>'+($("#div_actionMessagesID").html())+'</p>',
				icon    : 'error'
			});
		}
		if($('#actionmessageID').length>0){
			$('ul[id=actionmessageID]>li').contents().unwrap();$('ul[id=actionmessageID]').contents().unwrap().text();
			$.fallr('show', {
				buttons : {
					button1 : {text: 'بستن', danger: false}
				},
				content : '<p>'+($("#div_actionMessagesID").html())+'</p>',
				icon    : 'check'
			});
		}
	});
</script>
<!-- ************** -->
<!--     Fallr      -->
<!-- ************** -->