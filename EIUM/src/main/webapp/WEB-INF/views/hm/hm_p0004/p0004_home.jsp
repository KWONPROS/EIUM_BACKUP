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
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},	
	        {Header:"사원코드",Type:"Text",SaveName:"emp_CODE",KeyField:1,Hidden:1},	
			{Header:"사원명",Type:"Text",SaveName:"emp_NAME",MinWidth:120, Align:"Center"},			
			{Header:"부서명",Type:"Text",SaveName:"dep_NAME",MinWidth:170}						
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(600);
		mySheet.DoSearch("${contextPath}/hm/p0004/searchList.do");
		
		
		
		//탭
		createIBTab($('#ib_sheetTab')[0], $('#ib_sheetContents')[0], 'sheetTab', {
		    themes: {
		        tabs: "flat_blue",
		        contents: "flat_blue",
		        contextMenu: "flat_blue"
		    },
		    allowCloseBTN: false
		});

	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			mySheet.DoSearch("${contextPath}/hm/p0004/searchList.do");
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
			mySheet2.DoSearch("${contextPath}/hm/p0003/searchList2.do",
					"admin_LIST_NAME=" + mySheet.GetCellValue(Row, 2));
			mySheet2.SetCellValue(0, 2, mySheet.GetCellValue(Row, 2));

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

.left {
	position: relative;
	top: 130px;
	left: 60px;
	width: 403px;
}

.right {
	position: relative;
	top: -560px;
	left: 500px;
	height: 700px;
	width: 1150px;
}

#searchBar {
	background: #E0E0E0;
	padding: 10px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
}
</style>
</head>
<body onload="LoadPage()" style="overflow-x: hidden">
	<div class="leftbuttons">
		<a href="javascript:doAction('print')" class="IBbutton">인쇄</a> <a
			href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a
			href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 : 인사정보등록
		</header>
	</div>
	<div class="left">
		<form id="searchBar">
			조회기준 <input type="radio" name="emp_radio"onclick="mySheet.DoSearch('${contextPath}/hm/p0004/searchList.do','command=doWork');">재직 
			<input type="radio" name="emp_radio"onclick="mySheet.DoSearch('${contextPath}/hm/p0004/searchList.do','command=noWork');">퇴직 
			<input type="radio" name="emp_radio"onclick="mySheet.DoSearch('${contextPath}/hm/p0004/searchList.do');"checked="checked"> 전체<br>
			사원검색 <input type="text" name="" id=""> <input type="submit" value="조회">
		</form>

		<script>createIBSheet("mySheet", "100%", "100%");</script>
	</div>

	<div class="right" style="background: #E0E0E0">

		<div id="ib_sheetTab">
			<div class="ib-tab-tabs-item">
				<a class="ib-tab-tabs-item__link is-active"><span class="ib-tab-tabs-item__title">인적정보 </span></a> 
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">재직정보 </span></a> 
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">급여정보</span></a>
			</div>
		</div>

		<div id="ib_sheetContents">
			<div class="ib-tab-contents__item" style="background: none;">
				<div id='ib-container1' >fasdfsadfsdfasfsdf</div>
			</div>
			<div class="ib-tab-contents__item">
				<div id='ib-container2'>afdsfsadfsdafsad</div>
			</div>
			<div class="ib-tab-contents__item">
				<div id='ib-container3'>asdfggsaggr</div>
			</div>
		</div>
	</div>
</body>
</html>