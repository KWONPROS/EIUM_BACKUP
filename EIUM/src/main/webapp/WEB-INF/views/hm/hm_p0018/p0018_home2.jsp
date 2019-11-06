<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
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

<script>
	/*Sheet 기본 설정 */
	
	function setEdu(){
	
	 eduName=document.getElementById("PeduName").value;
	 eduCode=document.getElementById("PeduCode").value;
	$("#eduCode").val(eduCode);
	$("#eduName").val(eduName);
	
	LoadPage();
};


	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0}
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [

				{Header:"교육코드",Type:"Text",SaveName:"employee_TRAINING_CODE",MinWidth:80, Align:"Center"},
				{Header:"교육명",Type:"Text",SaveName:"employee_TRAINING_NAME",MinWidth:170, Align:"Center"},			
				{Header:"시작일",Type:"Text",SaveName:"employee_TRAINING_START_DATE",MinWidth:80, Edit: 1, Align:"Center",Format:"Ymd"},			
				{Header:"종료일",Type:"Text",SaveName:"employee_TRAINING_END_DATE",MinWidth:80,Format:"Ymd"},			
				{Header:"교육일수",Type:"Text",SaveName:"employee_TRAINING_DATE_COUNT"},
				{Header:"교육목적",Type:"Text",SaveName:"employee_TRAINING_GOAL"},
				{Header:"교육장소",Type:"Text",SaveName:"employee_TRAINING_LOCATION"},			
				{Header:"담당강사",Type:"Text",SaveName:"employee_TRAINING_TEACHER"},			
				{Header:"교육기관",Type:"Text",SaveName:"employee_TRAINING_INSITUTION" },			
				{Header:"교육시간",Type:"Text",SaveName:"employee_TRAINING_TIME"},			
				{Header:"대상인원",Type:"Text",SaveName:"employee_TRAINING_PEOPLE"},			
				{Header:"사내외구분",Type:"Text",SaveName:"employee_TRAINING_IN_OUT"},			

				];
			IBS_InitSheet(mySheet, initSheet);
			if($("#eduCode").val()!=""){
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/hm/p0018/searchList.do",param);
			}
			mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
			/* mySheet.SetSheetHeight(1000); */

			
			
			
			mySheet2.RemoveAll();
			//아이비시트 초기화
			var initSheet2 = {};
			initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0}
			initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
			initSheet2.Cols = [
					{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
					{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
					{Header:"사원코드",Type:"Text",SaveName:"employee_TRAINING_CODE",MinWidth:80, Align:"Center"},
					{Header:"사원명",Type:"Text",SaveName:"employee_TRAINING_NAME",MinWidth:170, Align:"Center"},			
					{Header:"부서",Type:"Text",SaveName:"employee_TRAINING_START_DATE",MinWidth:80, Edit: 1, Align:"Center",Format:"Ymd"},			
					{Header:"직책",Type:"Text",SaveName:"employee_TRAINING_END_DATE",MinWidth:80,Format:"Ymd"},			

					];
				IBS_InitSheet(mySheet2, initSheet2);
				
				mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
				/* mySheet.SetSheetHeight(1000); */
		}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction){
		case "search": // 조회
			var param = FormQueryStringEnc(document.frm);
			mySheet2.DoSearch("${contextPath}/hm/p0018/searchList.do",param);
			
	
			break;
		case "reload": //초기화
			//조회 데이터 삭제
			mySheet2.RemoveAll();
			break;
		case "save": //저장
			var tempStr = mySheet.GetSaveString();
			alert("서버로 전달되는 문자열 확인 : " + tempStr);
			mySheet2.DoSave("${contextPath}/hm/p0018/saveData.do");		
			break;
		case "save2": //저장 JSON
		//저장 문자열 추출
			alert("저장될 문자열:" + JSON.stringify(mySheet.GetSaveJson()));
			break;
		case "insert": //신규행 추가
			var row = mySheet2.DataInsert(-1);
			break;
		}
	}
	

	

	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
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
	
	  
	  function showPopup() { window.open("${contextPath}/hm/p0018/home2_p01.do", "a", "width=600, height=500, left=100, top=50");
	  
	  }
	 
	
</script>

<style type="text/css">

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
position: absolute;
top: 145px;
left: 50px;
}

.rightbuttons {
	margin-top: 50px;
	margin: 20px;
	position: absolute;
	right: 30px;
}
.right{
position: relative;
top: 150px;
left: 600px;
width: 700px;
background: #EDF0F5;
border-radius: 10px;
}

.right table{
font-size:13px;
font-weight:bold;
position: relative;
left: 40px;
padding: 20px;
}
.right table tr td:nth-child(1){
text-align:right;
}
.right table tr td:nth-child(2){
width: 20px;
height: 25px;
}
.right table tr td:nth-child(3) input{
width: 130px;
height: 20px;
padding-left: 10px;
margin-right:10px;
box-sizing: border-box;
border: 1px solid #CCCCCC;
border-radius: 2px;
} 
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


</style>

</head>
<body onload="LoadPage()">




	<div class="clear hidden"></div>
	<div class="left">
	<div class="ib_product">
		<script>
			//IBSheet 객체 생성 (객체 id, 너비, 높이)
			createIBSheet("mySheet", "100%", "304px");
			createIBSheet("mySheet2", "100%", "304px");
			
		</script>
	</div>
	</div>
	



    <div class="rightbuttons">
	  <a href="javascript:doAction('reload')"  class="IBbutton">초기화</a>
	  <a href="javascript:doAction('insert')"  class="IBbutton">추가</a>
	  <a href="javascript:doAction('search')" class="IBbutton">조회</a>
	  <a href="javascript:doAction('save')" class="IBbutton">저장</a>
	  <a href="javascript:doAction('save2')" class="IBbutton">저장 JSON</a> 
	</div>
  
	
	<form name="frm" >
	교육코드<input type="text" id="eduCode" value="" onChange="LoadPage()"><a href="javascript:showPopup();" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a> <input type="text" id="eduName">
	</form>
	<input type="hidden" id="PeduCode">
	<input type="hidden" id="PeduName">

</body>
</html>