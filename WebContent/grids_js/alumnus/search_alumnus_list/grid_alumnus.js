$(function(){
  $("#grid_alumnus").jqGrid({
	url:'grids_data/alumnus/search_alumnus_list/grid_alumnus_data.jsp',
	direction: 'rtl',
	datatype: "json",
	loadtext: 'بارگذاری...',
	autowidth: true,
	height:250,
    colNames:['آی دی','نام کاربری','نام','نام خانوادگی','سال فراغت از تحصیل','رشته تحصیلی','دانشکده','مقطع تحصیلی','مشاهده'],
    colModel :[
        {name:'id', index:'id', align:'left', width:50, hidden:true},
        {name:'username', index:'username', align:'center', width:120 },
        {name:'name', index:'name', align:'center', width:120 },
        {name:'family', index:'family', align:'center', width:120},
		{name:'yearOfGraduation', index:'yearOfGraduation', align:'center', width:70},
        {name:'field', index:'field', align:'center', width:120 },
        {name:'college', index:'college', align:'center', width:120},
		{name:'educationLevel', index:'educationLevel', align:'center', width:60},
		{name:'view', index:'view', align:'center', width:100,formatter:view,hidden:true},
    ],
    pager: '#pager_grid_alumnus',
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
			//var ret = $("#grid_alumnus").jqGrid('getRowData',rowid);
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
  $("#grid_alumnus").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
  $("#gbox_grid_alumnus").css("margin","0 auto");
});
function view(cellvalue, options, rowObject){
	var new_formatted_cellvalue = "";
	new_formatted_cellvalue  = '<button class="btn btn-green mini" style="font-family: tahoma;margin: 3px 0px;padding: 0px 30px;"><i class="icon-search"></i>  ' + "مشاهده" + '</button>';
	return new_formatted_cellvalue;
}