<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<div id="div_actionMessages" style="display:none;">
		<s:actionmessage name="actionmessage" cssStyle="color:#090;"/>
		<s:actionerror name="exception" cssStyle="color:#F00;"/>
	</div>

	
	<!-- ***** -->
	<!-- Fallr -->
    <!-- ***** -->
		<script type="text/javascript">
			$(document).ready(function(){
				if($('.errorMessage').length>0){
					//--To Clean the message
					$('ul[id=exception]>li').contents().unwrap();$('ul[id=exception]').contents().unwrap().text();
					$.fallr('show', {
	                    buttons : {
	                    	  button1 : {text: 'بستن'}
	                    },
	                    content : '<p>'+$("#div_actionMessages span").html()+'</p>',
	                    icon    : 'error'
	                });
				}
				if($('.actionMessage').length>0){
					//--To Clean the message
					$('ul[id=actionmessage]>li').contents().unwrap();$('ul[id=actionmessage]').contents().unwrap().text();
					$.fallr('show', {
	                    buttons : {
	                        button1 : {text: 'بستن'}
	                    },
	                    content : '<p>'+$("#div_actionMessages span").html()+'</p>',
	                    icon    : 'check'
	                });
				}
			});
		</script>
	<!-- ***** -->
	<!-- Fallr -->
    <!-- ***** -->
   
    <!-- ************** -->
	<!--    Loading     -->
	<!-- ************** -->
		<script type="text/javascript">
			$('#loading_overlay').live('mouseover mouseout', 
				function(event) {
					if(event.type == 'mouseover'){$('#close_overlay').css("color","#000");}
					else {$('#close_overlay').css("color","#333");}
				}
			);
		</script>
		<div id="loading_overlay" align="center" dir="rtl" style="width:170px;height:85px;z-index:9999999;display:none;background-color:#fff;border:2px solid #aaa;">
			<div class="ui-widget-shadow ui-corner-all" style="width:171px;height:81px;position:absolute;"></div>
			<div style="position:absolute;width:140px;height:60px;padding:10px;margin:0px 5px 0 0;" class="ui-widget ui-widget-content ui-corner-all">
				<div class="ui-dialog-content ui-widget-content" style="background:none;border:0;">
					<div id="close_overlay" onclick="stopLoadingOverlay('loading_overlay');" style="float:right;margin-top:-5px;cursor:pointer;color:#333;font-size: 16px;">x</div>
					<!-- Loading indicator --><img src='<s:url value="/img/loading.gif"/>' border='0' style="margin-right:-5px;height: 34px;width: 34px;margin-bottom: 10px;"/><!-- /Loading indicator -->
					<p style="font-size: 12px;">در حال بارگذاری ...</p>
				</div>
			</div>
		</div>
		<style type="text/css">
			#loading_overlay{
				-webkit-box-shadow: 0 0 1em #222;-moz-box-shadow: 0 0 1em #222;-ms-box-shadow: 0 0 1em #222;-o-box-shadow: 0 0 1em #222;box-shadow: 0 0 1em #222;
				-webkit-transition: all 0.3s ease-in-out;-moz-transition: all 0.3s ease-in-out;-ms-transition: all 0.3s ease-in-out;-o-transition: all 0.3s ease-in-out;transition: all 0.3s ease-in-out;
			}
			#loading_overlay:hover{-webkit-box-shadow: 0 0 1.2em #000;-moz-box-shadow: 0 0 1.2em #000;-ms-box-shadow: 0 0 1.2em #000;-o-box-shadow: 0 0 1.2em #000;box-shadow: 0 0 1.2em #000;}
	        #loading_overlay .ui-widget-shadow{background: none;}
	        #loading_overlay .ui-widget-content{background:none;border:none;color:inherit;}
		</style>
	<!-- ************** -->
	<!--    Loading     -->
	<!-- ************** -->