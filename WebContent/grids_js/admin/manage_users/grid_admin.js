$(function(){
  $("#grid_admin").jqGrid({
	url:'grids_data/admin/manage_users/grid_admin_data.jsp',
	direction: 'rtl',
	datatype: "json",
	loadtext: 'بارگذاری...',
	autowidth: true,
    colNames:['آی دی','نام','نام خانوادگی','نام کاربری','وضعیت','نوع','حذف شده','سطح دسترسی','تعلیق مدیر','ویرایش '],
    colModel :[
        {name:'id', index:'id', align:'left', width:50, hidden:true},
        {name:'name', index:'name', align:'center', width:120 },
        {name:'family', index:'family', align:'center', width:120},
		{name:'username', index:'username', align:'center', width:70},
        {name:'isActive', index:'isActive', align:'center', width:120 },
        {name:'type', index:'type', align:'center', width:120},
		{name:'deleted', index:'deleted', align:'center', width:60},
		{name:'privilegeLevel', index:'privilegeLevel', align:'center', width:60},
		{name:'suspend', index:'suspend', align:'center', width:100,formatter:suspendFormatter },
		{name:'edit', index:'edit', align:'center', width:100,formatter:editFormatter },
    ],
    pager: '#pager_grid_admin',
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
		if(iRow == 8){
			//var ret = $("#grid_admin").jqGrid('getRowData',rowid);
			alert("here ...");
			//viewDocPattern(ret.id,ret.base64,ret.width,ret.height);
		}
		if(iRow == 9){
			//var ret = $("#grid_admin").jqGrid('getRowData',rowid);
			alert("here ...");
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
  $("#grid_admin").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
  $("#gbox_grid_admin").css("margin","0 auto");
});
function suspendFormatter(cellvalue, options, rowObject){
	var new_formatted_cellvalue = "";
	new_formatted_cellvalue  = '<button class="btn btn-red mini" style="font-family: tahoma;margin: 3px 0px;padding: 0px 30px;"><i class="glyphicon-stop"></i>  ' + "تعلیق" + '</button>';
	return new_formatted_cellvalue;
}
function editFormatter(cellvalue, options, rowObject){
	var new_formatted_cellvalue = "";
	new_formatted_cellvalue  = '<button class="btn btn-green mini" style="font-family: tahoma;margin: 3px 0px;padding: 0px 30px;"><i class="icon-edit"></i>  ' + "ویرایش" + '</button>';
	return new_formatted_cellvalue;
}