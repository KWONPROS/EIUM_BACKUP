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
		mySheet.SetSheetHeight(350);
		
		//아이비시트2------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0};
		initSheet2.HeaderMode = {Sort:1, ColMove:0, ColResize:0, HeaderCheck:1};
		initSheet2.Cols = [
			
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},	
	        {Header:"NO",Type:"Text",SaveName:"NUMBER",MinWidth:50, Align:"Center" },	
			{Header:"출근일자",Type:"Text",SaveName:"working_STATUS_DATE",MinWidth:120,KeyField:1, Align:"Center"},			
			{Header:"출근시간",Type:"Text",SaveName:"working_STATUS_START_TIME",MinWidth:100},
			{Header:"퇴근시간",Type:"Text",SaveName:"working_STATUS_END_TIME",MinWidth:100},
			{Header:"총시간",Type:"Text",SaveName:"working_STATUS_TOTAL_TIME",MinWidth:50},
			{Header:"비고",Type:"Text",SaveName:"working_STATUS_DESC",MinWidth:100}
		];
		
		IBS_InitSheet( mySheet2 , initSheet2);
		  
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(350);
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

.left{
	position: relative;
	top: 130px;
	left: 60px;
	width: 1053px;
}

.right{
	position: relative;
	top: -220px;
	left: 500px;
	width: 750px;
	
}
#searchBar {
	background: #EBEBEB;
	padding: 15px 225px;
	margin-bottom: 30px;
	border-radius: 5px;
	font-size: 12px;
}

.left input{
	height: 22px;
	width: 40px;
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
<% 
java.util.Calendar date = java.util.Calendar.getInstance();
%>
<%int year=date.get(date.YEAR); %>
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
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 근태관리 : 근태입력
		</header>
	</div>
	<div class="left">
		<form id="searchBar">
			<span class="yearMonth">귀속연월</span> <input type="text"
				name="condition" id="condition" placeholder="YYYY"> 년
				<select id="ymd">

<%int month=date.get(date.MONTH)+1; %>
<%for(int i=1;i<13; i++){ %>
<%if(i==month){%>
	<option selected value="<%=i %>"> <%=i%> </option>
<%} else{%>
	<option value="<%=i %>"> <%=i%> </option>	
<%}%>
<%}%>
</select>월
			<div class="left_rightsearch"><span class="kindofsearch">조회조건</span>
				<select id="Employee_Select" float=right;>
		    	<option value="" selected>구분</option>
				<option value="employee_name">사업장</option>
				<option value="employee_code">부서</option>
			</select>
			<input type="text" id="p_text" placeholder="사업장  or 부서">
		</div>
		</form>

		<script>createIBSheet("mySheet", "100%", "100%");</script>
	</div>
	
	<div class="right">
		<script>createIBSheet("mySheet2", "100%", "100%");</script>
	</div>

</body>
</html>