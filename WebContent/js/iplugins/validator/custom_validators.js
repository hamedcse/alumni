var intNumber_RExpr=/^\d+$/;
var farsi_withSpace_RExpr=/^[آا-ی]+[آا-ی -  ئ]*$/;
var username_RExpr=/^[a-zA-Z]+[a-zA-Z]+[a-zA-Z]+\d*[a-zA-Z0-9]*$/;

//--create game
var gameName_RExpr=/^[آا-ی]+[آا-ی - ]*.*$/;
var time_RExpr=/^\d\d:\d\d$/;
var money_RExpr=/^(\d\d\d\d\d\d)+[0-9]*$/;
var float_RExpr=/^((\d+(\.\d*)?)|((\d*\.)?\d+))$/;
//--

function checkFarsiWithSpace(field, rules, i, options){
	if(!farsi_withSpace_RExpr.test(field.val()))
		return options.allrules.checkFarsiWithSpace.alertText;
}


function checkUsername(field, rules, i, options){
	if(!username_RExpr.test(field.val()))
		return options.allrules.checkUsername.alertText;
}


function checkIntNumber(field, rules, i, options){
	if(field.val()!="")
	if(!intNumber_RExpr.test(field.val()))
		return options.allrules.checkIntNumber.alertText;
}

function checkGameName(field, rules, i, options){
	if(!gameName_RExpr.test(field.val()))
		return options.allrules.checkGamename.alertText;
}

function checkTime(field, rules, i, options){
	if(!time_RExpr.test(field.val()))
		return options.allrules.checkTime.alertText;
}

function checkMoney(field, rules, i, options){
	if(!money_RExpr.test(field.val()))
		return options.allrules.checkMoney.alertText;
}

function checkFloatNumber(field, rules, i, options){
	if(!float_RExpr.test(field.val()))
		return options.allrules.checkFloatNumber.alertText;
}

function checkEmailCustom(field, rules, i, options){
	//email started by 'WWW.' example: 'WWW.hmd_jfr@yahoo.com'
		if(field.val().indexOf("www.")==0)
			return options.allrules.checkEmailCustom.alertText;
		
}

function checkSellPrice(field, rules, i, options){
		if(field.val()<1)
			return options.allrules.checkSellPrice.alertText;
		
}


/******* exact fileds validators ********/

//-- signup + profile --
function signupRequiredGender(field, rules, i, options){
	if(document.getElementById('selGender').value=="")
		return options.allrules.signupRequiredGender.alertText;
}


function signupRequiredMarried(field, rules, i, options){
	if(document.getElementById('selMarried').value=="")
		return options.allrules.signupRequiredMarried.alertText;
}


function signupRequiredEducationLevel(field, rules, i, options){
	if(document.getElementById('selEducationLevel').value=="")
		return options.allrules.signupRequiredEducationLevel.alertText;
}


function signupMatchPasswords(field, rules, i, options){
	if(document.getElementById('password').value!=document.getElementById('password2').value)
		return options.allrules.signupMatchPasswords.alertText;
}


function signupRequiredHowIMetIrvex(field, rules, i, options){
	if(document.getElementById('selHowIMetIrvex').value=="")
		return options.allrules.signupRequiredHowIMetIrvex.alertText;
}


//--profile
function profileMatchPasswords(field, rules, i, options){
	if(document.getElementById('newPassword').value!=document.getElementById('newPassword2').value)
		return options.allrules.signupMatchPasswords.alertText;
}


//--eachStock InRightClick
function addAlertMaxLessThanMin(field, rules, i, options){
	if(document.getElementsByName('max').item(0).value<document.getElementsByName('min').item(0).value)
		return options.allrules.addAlertMaxLessThanMin.alertText;
}
function addAlertMaxLessThanMinFund(field, rules, i, options){
	if(document.getElementsByName('max_fund').item(0).value<document.getElementsByName('min_fund').item(0).value)
		return options.allrules.addAlertMaxLessThanMin.alertText;
}


//-- buy
function buyRequiredSelectedGame(field, rules, i, options){
	if(document.getElementById('selectedG').value=="-")
		return options.allrules.buyRequiredSelectedGame.alertText;
}

function groupBuyRequiredSelectedGame(field, rules, i, options){
	if(document.getElementById('selectedG_groupBuy').value=="-")
		return options.allrules.buyRequiredSelectedGame.alertText;
}

function buyStockIsNotOffered(field, rules, i, options){
	if(document.getElementById('price').value=="0")
		return options.allrules.buyStockIsNotOffered.alertText;
}

function buyInvalidShares(field, rules, i, options){
	if(document.getElementById('shares').value=="0")
		return options.allrules.buyInvalidShares.alertText;
}

function groupBuyGridRequired(field, rules, i, options){
	if(jQuery("#grid_buy_group").jqGrid('getRowData').length==0)
		return options.allrules.required.alertText;
}

//-- sell
function sellRequiredSelectedGame(field, rules, i, options){
	if(document.getElementById('selectedGameID').value=="-")
		return options.allrules.sellRequiredSelectedGame.alertText;
}


//-- admincreategame.jsp
function checkAdminCreateGameTime(field, rules, i, options){
	if((document.getElementsByName('startTime').item(0).value!='00:00') && (document.getElementsByName('endTime').item(0).value=='00:00'))
		return options.allrules.checkAdminCreateGameTime.alertText;
}
function checkAdminCreateGameInitialMoney(field, rules, i, options){
	intMoney=parseInt(document.getElementsByName('initialMoney').item(0).value);
	if(intMoney<100000)
		return options.allrules.checkAdminCreateGameInitialMoney.alertText;
}
function checkAdminCreateGameInitialMoneyMax(field, rules, i, options){
	intMoney=parseInt(document.getElementsByName('initialMoney').item(0).value);
	if(intMoney>1000000000)
		return options.allrules.checkAdminCreateGameInitialMoneyMax.alertText;
}
function checkAdminCreateGameBuyLimitationPercent(field, rules, i, options){
	if((document.getElementsByName('buyLimitationPercent').item(0).value>100)||(document.getElementsByName('buyLimitationPercent').item(0).value<1))
		return options.allrules.checkAdminCreateGameBuyLimitationPercent.alertText;
}