<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,MouseHoverMode:2, MergeSheet:msHeaderOnly};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:10,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"대상직급|직급코드",Type:"Text",SaveName:"position_CODE",MinWidth:80,KeyField:1, Align:"Center"},
			{Header:"대상직급|직급명",Type:"Text",SaveName:"position_NAME",MinWidth:170,KeyField:1, Align:"Center"}		
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(440);
		
		
		//아이비시트2 -----------------------------------------------------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,MergeSheet:msHeaderOnly};
		initSheet2.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
		initSheet2.Cols = [
			{Header:"tmp직급코드|직급코드",Type:"Text",SaveName:"temp_POSITION_CODE"},
			{Header:"tmp호봉코드|호봉코드",Type:"Text",SaveName:"temp_PAY_GRADE_CODE"},
			{Header:"호봉코드|호봉코드",Type:"Text",SaveName:"pay_GRADE_CODE"},
	        {Header:"호봉|호봉",Type:"Text",SaveName:"pay_GRADE_NAME",MinWidth:50 ,KeyField:1, Align:"Center","UpdateEdit":0},			
			{Header:"호봉테이블|기본급",Type:"Int",SaveName:"salary",MinWidth:90 , Align:"Center"},
			{Header:"합계|합계",Type:"Int",SaveName:"tot_salary",MinWidth:90 , Align:"Center", CalcLogic:"|4|"}
		];   
		IBS_InitSheet( mySheet2 , initSheet2);
  
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(330);
		
		
		//아이비시트3 -----------------------------------------------------------------------------------------------------
		mySheet3.RemoveAll();
		var initSheet3 = {};
		initSheet3.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,MergeSheet:msHeaderOnly};
		initSheet3.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
		initSheet3.Cols = [
	     	{Header:"상태|상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
	        {Header:"삭제|삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},	
			{Header:"호봉이력|적용시작연월",Type:"Text",SaveName:"start_DATE",MinWidth:50, Align:"Center"},
	        {Header:"호봉이력|적용종료연월",Type:"Text",SaveName:"end_DATE",MinWidth:50, Align:"Center"}			
		];   
		IBS_InitSheet( mySheet3 , initSheet3);
  
		mySheet3.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet3.SetSheetHeight(200);
		
		
		mySheet.DoSearch("${contextPath}/hm/p0001/searchList.do");
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
				mySheet2.DoSearch("${contextPath}/hm/p0001/searchList2.do","position_CODE="+mySheet.GetCellValue(mySheet.GetSelectRow(),0));
				alert(mySheet.GetCellValue(mySheet.GetSelectRow(),0));
				mySheet2.SetCellValue(0, 0, mySheet.GetCellValue(mySheet.GetSelectRow(),0));
				break;
				
			case "reload": //초기화
				mySheet2.RemoveAll();
				mySheet3.RemoveAll();
				break;
			case "save": // 저장
				var tempStr = mySheet2.GetSaveString();
				tempStr = tempStr + "&p_position_CODE="+mySheet2.GetCellValue(0,2);
				alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet2.DoSave("${contextPath}/hm/p0001/saveData.do",tempStr);
				break;					
			case "insert": //신규행 추가
				var row = mySheet2.DataInsert();
				break;
		}
	}
	
	//로우 클릭시 (직급코드 선택시)
	function mySheet_OnClick(Row) {
		if(Row!=0){
			alert(mySheet.GetCellValue(Row, 0));
			mySheet2.DoSearch("${contextPath}/hm/p0001/searchList2.do", "position_CODE=" + mySheet.GetCellValue(Row, 0));
			mySheet2.SetCellValue(0, 0, mySheet.GetCellValue(Row,0));
		}
	}  
	//직급코드 선택후 호봉코드를 선택시(1번째) - 시작연월 종료연월
	function mySheet2_OnSearchEnd(code,msg){
		mySheet2.SetCellValue(0, 1, mySheet2.GetCellValue(2, 2));
		mySheet3.DoSearch("${contextPath}/hm/p0001/searchList3.do", "position_CODE2=" + mySheet2.GetCellValue(0,0) + "&pay_GRADE_CODE=" + mySheet2.GetCellValue(0, 1));
		
	}
	
	//로우 클릭시 (호봉 선택시)
	function mySheet2_OnClick(Row){
		if(Row!=0){
			alert(mySheet2.GetCellValue(Row,2));
			mySheet2.SetCellValue(0, 1, mySheet2.GetCellValue(Row, 2));
			mySheet3.DoSearch("${contextPath}/hm/p0001/searchList3.do", "position_CODE2=" + mySheet2.GetCellValue(0,0) + "&pay_GRADE_CODE=" + mySheet2.GetCellValue(0, 1));
		}
		
		if(mySheet3.GetCellValue(3, 4)=="00000000"){
			alert("0000000");
		}
	}
	//시작연월 종료연월아래에 insert 띄워주기
	function mySheet3_OnSearchEnd(code,msg){
		mySheet3.DataInsert(-1);
		alert(mySheet3.GetCellValue(2, 3));
		if(mySheet3.GetCellValue(2,3)=="00000000"){
			mySheet3.SetCellValue(2, 3, "");
		}
	}

	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}
	
	
</script>
<style type="text/css">

.title {
 	width:100%;
	color: #2C3E50;
	font-weight: bold;
	font-size: 20px;
	padding-left : 30px;
	padding-bottom: 10px;
	padding-top:20px;
	border-top: thin solid #5E5E5E;
	border-bottom: thin dashed #5E5E5E;
	position: absolute;
	top: 50px;

}
.leftbuttons{
	margin-top:40px;
	margin:10px;
	position: absolute;
	left: 0px;
}
.rightbuttons{
	margin-top:40px;
	margin:10px;
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
left: 40px;
}
.right{
 position: relative;
top: -270px;
left: 330px; 
}
.bottom{
position: relative;
top:  -570px;
left: 800px;
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
			href="javascript:doAction('insert')" class="IBbutton">추가</a> <a
			href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

<div class="title"> 
<header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 기초환경설정 : 호봉테이블등록</header>
</div>
	<div class="left"><script>createIBSheet("mySheet", "1000px", "300px");</script></div>
	<div class="right"><script>createIBSheet("mySheet2", "1500px", "300px");</script></div>
	<div class="bottom"><script>createIBSheet("mySheet3", "1500px", "300px");</script></div>
</body>
</html>