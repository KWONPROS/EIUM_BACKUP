<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"
	rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"
	type="text/javascript"></script>
<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [		
			
	        {Header:"사원코드",Type:"Text",SaveName:"emp_CODE",KeyField:1},	
			{Header:"사원명",Type:"Text",SaveName:"emp_NAME",MinWidth:120, Align:"Center"},			
			{Header:"부서명",Type:"Text",SaveName:"dep_NAME",MinWidth:170}						
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(600);
		
		
		
		
		
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet2.Cols = [		
	        {Header:"사원코드",Type:"Text",SaveName:"emp_CODE",KeyField:1,Hidden:1},	
			{Header:"사원명(영문)",Type:"Text",SaveName:"emp_NAME_EN", Hidden:1},			
			{Header:"사원명(한자)",Type:"Text",SaveName:"emp_NAME_HN", Hidden:1},			
			{Header:"내외국인구분",Type:"Text",SaveName:"foreign_YN", Hidden:1},			
			{Header:"주민등록번호",Type:"Text",SaveName:"rr_NUM", Hidden:1},			
			{Header:"성별",Type:"Text",SaveName:"sex", Hidden:1},			
			{Header:"생년월일",Type:"Text",SaveName:"birth", Hidden:1},			
			{Header:"전화번호",Type:"Text",SaveName:"contact", Hidden:1},			
			{Header:"최종학력",Type:"Text",SaveName:"final_EDU", Hidden:1},			
			{Header:"사진",Type:"Text",SaveName:"picture", Hidden:1},			
			{Header:"주민등록주소",Type:"Text",SaveName:"res_ADDRESS", Hidden:1},			
			{Header:"상세주소",Type:"Text",SaveName:"res_ADDRESS_DETAIL", Hidden:1},			
			{Header:"영문주소",Type:"Text",SaveName:"res_ADDRESS_EN", Hidden:1},			
			{Header:"이메일",Type:"Text",SaveName:"email", /* Hidden:1 */},			
			{Header:"출입카드번호",Type:"Text",SaveName:"card_NUM", Hidden:1},			
			{Header:"세대주여부",Type:"Text",SaveName:"hh_YN", Hidden:1},			
			{Header:"장애인구분",Type:"Text",SaveName:"hc_YN", Hidden:1},			
			{Header:"국적",Type:"Text",SaveName:"nationality", Hidden:1},			
			{Header:"병역구분",Type:"Text",SaveName:"mil_TYPE", Hidden:1},			
			{Header:"군번",Type:"Text",SaveName:"mil_NUM", Hidden:1},			
			{Header:"채용구분",Type:"Text",SaveName:"hire_TYPE", Hidden:1},					
			{Header:"기수",Type:"Text",SaveName:"hire_NUM", Hidden:1}					
		];   
		IBS_InitSheet( mySheet2 , initSheet2);
  
	
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			mySheet.DoSearch("${contextPath}/hm/p0004/searchList.do");
		console.log(mySheet2.GetRowData(1));
			$('input[name=engName]').val(mySheet2.GetCellValue(1,3));
			break;

		case "reload": //초기화
			mySheet2.RemoveAll();
			break;
		case "save": // 저장

			var tempStr = mySheet2.GetSaveString();
			tempStr = tempStr + "&table_NAME=" + mySheet2.GetCellValue(0, 2);
			alert("서버로 전달되는 문자열 확인 :" + tempStr);
			mySheet.DoSave("${contextPath}/hm/p0004/saveData.do", tempStr);
			break;

		}
	}

	//로우 클릭시
	function mySheet_OnClick(Row, Col) {
		if (Row != 0) {
			mySheet2.DoSearch("${contextPath}/hm/p0004/searchList2.do", "emp_CODE=" + mySheet.GetCellValue(Row, 2));
			
			
			
			
			
			
		}

	}

	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
</script>
<style type="text/css">
.title {
	width: 100%;
	color: #2C3E50;
	font-weight: bold;
	font-size: 20px;
	padding-left: 30px;
	padding-bottom: 10px;
	padding-top: 20px;
	border-top: thin solid #5E5E5E;
	border-bottom: thin dashed #5E5E5E;
	position: absolute;
	top: 50px;
}

.leftbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	left: 0px;
}

.rightbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	right: 0px;
}

.IBbutton {
	font-size: 13px;
	margin-left: 5px;
	background-color: #2B69A0;
	color: white;
	padding: 5px 15px;
	border-radius: 7px;
	text-decoration: none;
}

.IBbutton:hover {
	background-color: #2C3E50;
}
.pictureUpload{
	font-size: 13px;
	margin-left: 5px;
	background-color: #3498DB;
	color: white;
	padding: 5px 50px;
	border-radius: 7px;
	text-decoration: none;
}
.pictureUpload:hover {
	background-color: #2C3E50;
}

.left {
	position: relative;
	top: 130px;
	left: 60px;
	width: 1000px;
}

.right {
	position: relative;
	top: -560px;
	left: 500px;
	height: 700px;
	width: 1150px;
	background: #EBEBEB;
	border-radius:5px;
}

#searchBar {
	background: #EBEBEB;
	padding: 50px 40px;
	margin-bottom: 30px;
	border-radius: 5px;
	font-size: 12px;
}

.tg input,select{
height: 22px;
border-radius: 3px;
border : none;
}

.tg  {border-collapse:collapse;border-spacing:0; width:70%;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:7px 2px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:0px 5px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-yyj2{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:#bebebe;text-align:left;vertical-align:center}
.tg .tg-dm68{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:#bebebe;text-align:center;vertical-align:center}
.tg .tg-lu1x{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#333333;color:#ffffff;border-color:inherit;text-align:center;vertical-align:center;width:40px; border-radius:2px;}
.tg .tg-au0w{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;border-color:inherit;text-align:left;vertical-align:center}
.tg .tg-8thm{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:inherit;text-align:right;vertical-align:center}
.tg .tg-v9i9{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:inherit;text-align:left;vertical-align:center}

.yearMonth {
	background: #212121;
	color: white;
}

</style>
</head>
<body onload="LoadPage()" style="overflow-x: hidden">
	<div class="leftbuttons">
		<a href="javascript:doAction('print')" class="IBbutton">인쇄</a> <a
			href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> 
		<a href="javascript:doAction('insert')" class="IBbutton">추가</a>
		<a href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 : 인사정보등록
		</header>
	</div>
	<div class="left">
		<form id="searchBar">
			<span class="yearmonth">귀속연월</span>
		</form>

		<script>createIBSheet("mySheet", "100%", "100%");</script>
	</div>

</body>
</html>