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

 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0, MergeSheet:msHeaderOnly};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
		{Header:"상태|상태",Type:"Status",Width:70,SaveName:"Status",Align:"Center"},
		{Header:"삭제|삭제",Type:"DelCheck",Width:70,SaveName:"Delete",Align:"Center"},
		{Header:"NO|NO",Type:"Text",Width:50,SaveName:"department_CODE",Align:"Center"},
		{Header:"지급회수|지급일자",Type:"Text",Width:120,SaveName:"payment_date",Align:"Center"}, 
		{Header:"지급회수|지급분류",Type:"Text",Width:120,SaveName:"payment_des_name",Align:"Center"}, 
		];
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(200);
		mySheet.SetSheetWidth(700); 
		
		//아이비시트2------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg={SearchMode:smLazyLoad,ToolTip:1,MergeSheet:msHeaderOnly};
	initSheet2.HeaderMode = {Sort:1,ColResize:1,HeaderCheck:1};
	initSheet2.Cols=[
		{Header:"상태|상태|상태",Type:"Status",Width:70,SaveName:"Status",Align:"Center"},
		{Header:"삭제|삭제|삭제",Type:"DelCheck",Width:70,SaveName:"Delete",Align:"Center"},
		{Header:"NO|NO|NO",Type:"Text",Width:50,SaveName:"department_CODE",Align:"Center"},
		{Header:"직급직종및급여형태|사업장|사업장",Type:"Text",Width:120,SaveName:"site_CODE",Align:"Center"}, 
		{Header:"직급직종및급여형태|직종|직종",Type:"Text",Width:120,SaveName:"site_NAME",Align:"Center"}, 
		{Header:"직급직종및급여형태|급여형태|급여형태",Type:"Text",Width:120,SaveName:"sector_CODE",Align:"Center"}
		];
	IBS_InitSheet(mySheet2,initSheet2);
		  
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(200);
		mySheet2.SetSheetWidth(700); 


	//아이비시트3 
	

		/* MonthPicker 옵션 */
	    options = {
	        pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
	        selectedYear: 2019,
	        startYear: 2008,
	        finalYear: 2019,
	        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
	     
	    /* MonthPicker Set */
	    $('#monthpicker').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('#btn_monthpicker').bind('click', function () {
	        $('#monthpicker').monthpicker('show');
	    });
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			mySheet.DoSearch("${contextPath}/hm/p0002/searchList.do");
		console.log(mySheet2.GetRowData(1));
			$('input[name=engName]').val(mySheet.GetCellValue(1,3));
			break;

		case "reload": //초기화
			mySheet2.RemoveAll();
			break;
		case "save": // 저장

			var tempStr = mySheet2.GetSaveString();
			tempStr = tempStr + "&table_NAME=" + mySheet.GetCellValue(0, 2);
			alert("서버로 전달되는 문자열 확인 :" + tempStr);
			mySheet.DoSave("${contextPath}/hm/p0002/saveData.do", tempStr);
			break;

		}
	}

	//로우 클릭시
	function mySheet_OnClick(Row, Col) {
		if (Row != 0) {
			mySheet2.DoSearch("${contextPath}/hm/p0002/searchList2.do", "emp_CODE=" + mySheet.GetCellValue(Row, 2));
			
			
			
			
			
			
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

.left{
	position: relative;
	top: 110px;
	left: 60px;
	width: 750px;
}

.right{
	position: relative;
	top: -90px;
	left: 525px;
	width: 750px;
	
}


#searchBar {
	background: #EBEBEB;
	padding: 15px 15px;
	margin-bottom: 30px;
	border-radius: 5px;
	width: 350px;
	font-size: 12px;
}

.left input{
	height: 22px;
	width: 100px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
	vertical-align: middle;
}

.left_rightsearch input{
	height: 22px;
	width: 100px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
	vertical-align: middle;
}
.yearMonth {
	background: #5E5E5E;
	padding: 5px 5px;
	color: white;
	border-radius: 5px;
}
.kindofsearch{
	background: #5E5E5E;
	padding: 5px 5px;
	color: white;
	border-radius: 5px;
}
.left_rightsearch{
	display: inline;
	float: right;
}

.ui-datepicker table{ font-size: 12px; }
.ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button{ width:40%; font-size: 14px; }
img {vertical-align: middle; padding: 0px 5px 0px 2px; }

</style>
</head>
<body onload="LoadPage()" >
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
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 기초환경설정 : 지급일등록
		</header>
	</div>
	<div class="left">
		<form id="searchBar" action="javascript:searchCondition();">
			<span class="yearMonth">귀속연월</span> 
			<input id="monthpicker" type="text">
			<img id="btn_monthpicker"  src="${contextPath}/resources/image/icons/icon_calendar.png">
			<input type="submit" value="조회"  style="background-color:  #5E5E5E; width:50px; height :26px; color: white; border-radius: 5px; margin: 0px 0px 3px 0px ;">
		</form>  

		<script>createIBSheet("mySheet", "100%", "100%");</script>
	</div>
	
	<div class="right">
		<script>createIBSheet("mySheet2", "100%", "100%");</script>
	</div>
	


</body>
</html>