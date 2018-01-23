// JavaScript Document
jQuery(document).ready(function(){ 
  jQuery("#grid_blank").jqGrid({
    //url:'example.php',
    datatype: 'local',
	direction: 'rtl',
	loadtext: 'بارگذاری...',
	//toolbar: [true,'bottom'],
	//forceFit: true,
	//footerrow: true,
	//altRows: true,
	//ExpandColClick: false,
	//toppager: true,
	autowidth: true,
	postData: {
		selectedGameID: function() {
			return document.getElementsByName('gameIDToLoadWinners').item(0).value;
		}
	},
    //mtype: 'GET',
    colNames:['تاریخ','عنوان'],
    colModel :[ 
      {name:'date', index:'date', align:'right', width:100}, 
      {name:'title', index:'title', align:'right'} 
    ],
    //pager: '#pager',
    //rowNum:10,
    //rowList:[10,20,30],
    //sortname: 'invid',
    //sortorder: 'desc',
    viewrecords: true,
	//scroll:true
    //caption: 'تابلوی بورس'
    onCellSelect:function(rowid,iRow,iCol,e){
		var idrec = jQuery("#grid_blank").jqGrid('getGridParam','selrow'); 
		if (idrec) 
		{ 
			
			var ret = jQuery("#grid_blank").jqGrid('getRowData',idrec);
			
			if(iRow==1){
					funcShowPortfolio();
			}
		}
	}
  }); 
  var mydata = [
				{date:"89/1/1",title:""},
				{date:"89/1/1",title:""},
				{date:"89/1/1",title:""},
				{date:"89/1/1",title:""},
				{date:"89/1/1",title:""},
				{date:"89/1/1",title:""}
				]; 
  for(var i=0;i<=mydata.length;i++) $("#grid_blank").jqGrid('addRowData',i+1,mydata[i]);
  //$("#grid_blank").setGridWidth(570); //570
}); 