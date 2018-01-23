<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="projects.size > 0">
	<s:iterator value="projects" var="projects" status="projectsStatus">
	<s:set var="jKey" value="#projects.key"/>
	<s:set var="jVal" value="#projects.value"/>
				  <s:if test="#projectsStatus.index == 0">
				  	<div class="row-fluid">
				  </s:if>
				  <s:elseif test="#projectsStatus.last">
				  	<s:if test="#projectsStatus.index % 3 == 0">
				  	 <div class="row-fluid">
				  	</s:if>
				  </s:elseif>
				  <s:elseif test="#projectsStatus.index % 3 == 0">
				   </div>
				   <div class="row-fluid">
				  </s:elseif>
					<div class="span4">
						<div class="box box-color box-bordered" style="text-align:center;">
							<div class="box-title">
								<h3><i class="icon-bar-chart"></i><s:property value="#jVal.title"/></h3>
								<div class="actions">
									<a href="javascript:;" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
								</div>
							</div>
							<div class="box-content">
								<a target="_blank" href='loadProjectManagerDetail.action?pmid=<s:property value="#jVal.projectManager.id"/>' class="btn btn-satblue"><i class="glyphicon-user"></i> مدیر پروژه: <s:property value="#jVal.projectManagerDetail"/></a><br><br>
								<a href='viewProjectDetail?pid=<s:property value="#jVal.id"/>' target="_blank" class="btn btn-grey"><i class="icon-search"></i> مشاهده جزئیات پروژه</a><br><br>
								<label >توضیحات</label>
								<textarea rows="" cols="" ><s:property value="#jVal.description" /></textarea>
							</div>
						</div>
					</div>
				  <s:if test="#projectsStatus.last">
				    </div>
				  </s:if>
	</s:iterator>
</s:if>
<s:else>
	<div class="alert alert-success" style="color: #000;"><strong>!</strong> موردی یافت نشد.</div>
</s:else>