$(function(){
  $("#grid_projects").jqGrid({
	url:'grids_data/alumnus/search_projects/grid_projects_data.jsp',
	direction: 'rtl',
	datatype: "json",
	loadtext: 'بارگذاری...',
	autowidth: true,
	height:250,
    colNames:['آی دی','عنوان','موضوع','رشته','آی دی مدیر پروژه ','مشخصات مدیر پروژه ','ارسال درخواست عضویت','مشاهده جزئیات'],
    colModel :[
        {name:'id', index:'id', align:'left', width:50, hidden:true},
        {name:'title', index:'title', align:'center', width:150 },
        {name:'category', index:'category', align:'center', width:100},
		{name:'field', index:'field', align:'center', width:100},
        {name:'projectManager_id', index:'projectManager_id', align:'center', width:10, hidden:true},
        {name:'view_projectManager', index:'view_projectManager', align:'center', width:100,formatter:viewable, hidden:true},
		{name:'sent_req', index:'sent_req', align:'center', width:100,formatter:sent_req},
		{name:'view_detail', index:'view_detail', align:'center', width:100,formatter:view_detail},
    ],
    pager: '#pager_grid_projects',
    rowNum:2000,
    //rowList:[10,20,30],
	//shrinkToFit:true,
    //viewrecords: true,
   // rownumbers:true,
	//multiselect:true,
	sortname:1,
	sortorder:"desc",
	onCellSelect:function(rowid,iRow,iCol,e){
		//recsNum = jQuery("#grid_buyTrades").jqGrid('getGridParam','selarrrow');
		//document.getElementById('numberOfAlertsToDel').innerHTML=recsNum.length;
		if(iRow == 5){
			var ret = $("#grid_projects").jqGrid('getRowData',rowid);
			alert("here ...");
			//viewDocPattern(ret.id,ret.base64,ret.width,ret.height);
		}
		if(iRow == 6){
			var ret = $("#grid_projects").jqGrid('getRowData',rowid);
			sendJoinRequestToProject(ret.id);
			//viewDocPattern(ret.id,ret.base64,ret.width,ret.height);
		}
		if(iRow == 7){
			var ret = $("#grid_projects").jqGrid('getRowData',rowid);
			viewProjectDetail(ret.id);
			//viewDocPattern(ret.id,ret.base64,ret.width,ret.height);
		}
	}
	//-------------
	/*onSelectRow:function(){
			var idrec = jQuery("#grid_buyTrades").jqGrid('getGridParam','selrow');
			if (idrec)
			{
				var ret = jQuery("#grid_buyTrades").jqGrid('getRowData',idrec);
				document.getElementsByName('alertID').item(0).value=ret.alert_id;
			}
	}*/
  });
  //jQuery("#grid_buyTrades").jqGrid('navGrid','#pager_alerts',{del:false,add:false,edit:false});
  $("#grid_projects").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
  $("#gbox_grid_projects").css("margin","0 auto");
});
function sent_req(cellvalue, options, rowObject){
	var new_formatted_cellvalue = "";
	new_formatted_cellvalue  = '<button class="btn btn-red mini" style="font-family: tahoma;margin: 3px 0px;padding: 0px 30px;"><i class="glyphicon-share"></i>  ' + "ارسال" + '</button>';
	return new_formatted_cellvalue;
}
function viewable(cellvalue, options, rowObject){
	var new_formatted_cellvalue = "";
	new_formatted_cellvalue  = '<button class="btn btn-blue mini" style="font-family: tahoma;margin: 3px 0px;padding: 0px 30px;"><i class="icon-search"></i>  ' + "مشاهده" + '</button>';
	return new_formatted_cellvalue;
}
function view_detail(cellvalue, options, rowObject){
	var new_formatted_cellvalue = "";
	new_formatted_cellvalue  = '<button class="btn btn-green mini" style="font-family: tahoma;margin: 3px 0px;padding: 0px 30px;"><i class="icon-search"></i>  ' + "مشاهده" + '</button>';
	return new_formatted_cellvalue;
}