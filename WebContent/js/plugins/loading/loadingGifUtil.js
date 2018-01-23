function startGif_colored(divId,bgColor){
	document.getElementById(divId).innerHTML='<img id="loading_img" src="images/loading/'+bgColor+'_24.gif" alt="بارگذاری..."/>';
	document.getElementById(divId).style.display='block';
}

function startGif(divId){
	document.getElementById(divId).innerHTML='<img id="loading_img" src="images/loading_img.gif" alt="بارگذاری..."/>';
	document.getElementById(divId).style.display='block';
}

function resumeGif(divId){
	document.getElementById(divId).style.display='block';
}

function stopGif(divId){
	document.getElementById(divId).style.display='none';
}

function startProcess(loadingDivID,bgColor,buttonID){
	startGif(loadingDivID,bgColor);
	document.getElementById(buttonID).disabled=true;
}

function stopProcess(loadingDivID,buttonID){
	stopGif(loadingDivID);
	document.getElementById(buttonID).disabled=false;
}

function lockButton(buttonID){
	document.getElementById(buttonID).disabled=true;
}

function unlockButton(buttonID){
	document.getElementById(buttonID).disabled=false;
}

function startLoadingOverlay(divID){
	$("#"+divID).showInCenter(document.getElementById(divID).style.width,document.getElementById(divID).style.height);
}

function stopLoadingOverlay(divID){
	//$("#"+divID).hide('highlight',{},'1000');
	$("#"+divID).fadeOut();
}

function hideLoadingOverlay(divID){
	$("#"+divID).hide();
}

function showMessageOverlay(divID){
	$("#"+divID).showInCenter(document.getElementById(divID).style.width,document.getElementById(divID).style.height);
	window.setTimeout('hideMessageOverlay("'+divID+'");',3000);
}

function hideMessageOverlay(divID){
	//$("#"+divID).hide('highlight',{},'1000');
	$("#"+divID).hide();
}

//--Centerizer
jQuery.fn.showInCenter = function (divWidth,divHeight) {
	divWidth=divWidth.replace("px","");
	divHeight=divHeight.replace("px","");
	divWidth=(divWidth/2);
	divHeight=(divHeight/2);

	this.css("position","fixed");
	this.css("left",(($(window).width())/2)-(divWidth) );
	this.css("top", (($(window).height())/2)-(divHeight));
	this.show();
	return this;
}

/*this.css("top", "50%");
this.css("left","50%");
this.css("margin-top", divHeight+ "px");
this.css("margin-left",divWidth+ "px");
this.css("top", (($(window).height() - this.outerHeight()) / 2) + $(window).scrollTop() + "px");
this.css("left", (($(window).width() - this.outerWidth()) / 2) + $(window).scrollLeft() + "px");*/