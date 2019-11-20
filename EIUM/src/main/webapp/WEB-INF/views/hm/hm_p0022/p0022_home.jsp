<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	

<style>


</style>

<script>
function LoadPage() {
//달력 API
$(function() {
  $( ".Datepicker" ).datepicker({
  	dateFormat: "yy-mm-dd",
  	showOn: "both", 
      buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
      buttonImageOnly: true , 
       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
});
});

mySheet1.RemoveAll();
//아이비시트 초기화
var initSheet = {};
initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3, MergeSheet:msHeaderOnly,MouseHoverMode:2}
initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
initSheet.Cols = [
      {Header:"상태|상태",Type:"Status",SaveName:"Status", Align:"Center"},
      {Header:"삭제|삭제",Type:"DelCheck",SaveName:"DEL_CHK"},
      {Header:"발령일자|발령일자",Type:"Date",SaveName:"appoint_DATE",Align:"Center",Width:100},
      {Header:"발령번호|발령번호",Type:"Text",SaveName:"appoint_CODE",Align:"Center",Width:100},   
      {Header:"제목|제목",Type:"Text",SaveName:"appoint_TITLE",Align:"Center",Width:100},         
      {Header:"마감/취소|마감/취소",Type:"Button",SaveName:"appoint_YN",Align:"Center",Width:100,},         
      {Header:"작성자|직원번호",Type:"Popup",SaveName:"masterEmployee_CODE",Align:"Center",Width:100},
      {Header:"작성자|작성자명",Type:"Text",SaveName:"employee_NAME",Align:"Center",Width:100,InsertEdit:0},
      {Header:"작성자|사업장",Type:"Text",SaveName:"site_NAME",Align:"Center",Width:100,InsertEdit:0},
      {Header:"작성자|부서",Type:"Text",SaveName:"department_NAME",Align:"Center",Width:100,InsertEdit:0},
      {Header:"작성자|직책",Type:"Text",SaveName:"duty_NAME",Align:"Center",Width:100,InsertEdit:0}
      ];
   IBS_InitSheet(mySheet1, initSheet);
   mySheet1.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분

   
   mySheet2.RemoveAll();
   //아이비시트 초기화
   var initSheet2 = {};
   initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3, FrozenCol:5,MouseHoverMode:2}
   initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
   initSheet2.Cols = [
         {Header:"상태",Type:"Status",SaveName:"Status", Align:"Center"},
         {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK"},
         {Header:"인사발령내역고유번호",Type:"Text",SaveName:"appoint_HISTORY_CODE",Align:"Center",Width:100,"Hidden":1},   
         {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",Align:"Center",Width:100},
         {Header:"사원명",Type:"Popup",SaveName:"employee_NAME",Align:"Center",Width:100},         
         {Header:"시작일자",Type:"Date",SaveName:"start_DATE",Align:"Center",Width:100,Format:"Ymd"},         
         {Header:"종료일자",Type:"Date",SaveName:"end_DATE",Align:"Center",Width:100,Format:"Ymd"},
         {Header:"발령구분",Type:"Combo",SaveName:"hr_APPOINT_INDEX_NAME",Align:"Center",Width:100,"ComboText":"|승진|이동|파견|파견복귀|휴직|복직|퇴직|보직|보직해제|조직개편|계약연장|정직|정직해제", "ComboCode":"|1|2|3|4|5|6|7|8|9|10|11|12|13"},
         {Header:"재직상태",Type:"Combo",SaveName:"work_STATUS",Align:"Center",Width:100,"ComboText":"|재직|휴직|정직|퇴직", "ComboCode":"|재직|휴직|정직|퇴직"},
         {Header:"입사일자",Type:"Text",SaveName:"employee_JOIN_DATE",Align:"Center",Width:100,Format:"Ymd"},
         {Header:"사업장",Type:"Popup",SaveName:"site_NAME",Align:"Center",Width:100},
         {Header:"사업장코드",Type:"Text",SaveName:"site_CODE",Align:"Center",Width:100,Hidden:1},
         {Header:"부서",Type:"Popup",SaveName:"department_NAME",Align:"Center",Width:100},
         {Header:"부서코드",Type:"Text",SaveName:"department_CODE",Align:"Center",Width:100,Hidden:1},
         {Header:"직종",Type:"Combo",SaveName:"job_CLASS_NAME",Align:"Center",Width:100,"ComboText":"|서비스|제조", "ComboCode":"|100|200"},
         {Header:"직급",Type:"Combo",SaveName:"position_NAME",Align:"Center",Width:100,"ComboText":"|대표이사|부사장|전무|상무|이사|부장|차장|과장|생산계장|대리|주임|사원|생산사원|계약직", "ComboCode":"|100|120|150|200|300|400|500|600|650|700|800|900|910|990"},
         {Header:"직책",Type:"Combo",SaveName:"duty_NAME",Align:"Center",Width:100,"ComboText":"|생산부장|생산과장", "ComboCode":"|100|200"},
         {Header:"직무",Type:"Combo",SaveName:"job_DIS_NAME",Align:"Center",Width:100,"ComboText":"|CEO|CTO", "ComboCode":"|100|200"},
         {Header:"급여유형",Type:"Combo",SaveName:"pay_TYPE_NAME",Align:"Center",Width:100},
         {Header:"급여호봉",Type:"Combo",SaveName:"pay_GRADE_NAME",Align:"Center",Width:100,"ComboText":"|1호봉|2호봉|3호봉|4호봉|5호봉|6호봉|7호봉|8호봉|9호봉|10호봉", "ComboCode":"|C01|C02|C03|C04|C05|C06|C07|C08|C09|C10"},
         {Header:"퇴직사유",Type:"Combo",SaveName:"out_REASON_NAME",Align:"Center",Width:100,"ComboText":"|해고|병가", "ComboCode":"|100|200"}         ];
      IBS_InitSheet(mySheet2,initSheet2);
      mySheet2.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분



}

function mySheet1_OnClick(Row,Col){
	var status=mySheet1.GetCellValue(Row,0);
	if(status!="I" && Col!=5){

	appointCode ="appointCode="+mySheet1.GetCellValue(Row,3);
	mySheet2.DoSearch("${contextPath}/hm/p0022/appointList2.do",appointCode)
	}
	
}


function doAction(sAction) {
	switch (sAction) {
	case "search":
		var param = FormQueryStringEnc(document.frm);
	    mySheet1.DoSearch("${contextPath}/hm/p0022/appointList.do", param);
	    mySheet2.RemoveAll();
		break;
	case "reset":
		mySheet.RemoveAll();
	    $('#date').attr('value', "");
	    $('#date2').attr('value', "");
	    $('#p_text').attr('value', "");
	    $('#p_text').attr('placeholder', "사원의 이름을 입력해주세요.");
		break;
	case "insert1":
		mySheet1.DataInsert(-1);
		break;
	case "insert2":
		mySheet2.DataInsert(-1);
		break;
	case "save1": //저장
		mySheet1.DoSave("${contextPath}/hm/p0022/saveData1.do");		
		break;
	case "save2": //저장
		console.log(appointCode);
		mySheet2.DoSave("${contextPath}/hm/p0022/saveData2.do",appointCode);		
		break;
	}
}



function goPopup(){
	window.open("${contextPath}/hm/p0022/homeInit_p03.do", "a", "width=500, height=700, left=100, top=50 location=0");
}

function popupValue(emplyCode,emplyName){
	$("#masterEmpl").val(emplyName);
	$("#masterEmplCode").val(emplyCode);
	
	
	
}
function popupValue2(rowData){

	
	mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData);
	
}
function popupValue3(rowData){
	
	mySheet1.SetRowData(mySheet1.GetSelectRow(),rowData);
	
}
function popupValue4(rowData){
	
	mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData);
	
}
function popupValue5(rowData){
	
	mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData);
	
}
function mySheet1_OnButtonClick(Row,Col){
	var result = confirm('')
	
}
function mySheet2_OnPopupClick(Row,Col) {  	
	
	if(Col==4){
		window.open("${contextPath}/hm/p0022/homeInit_p01.do", "a", "width=500, height=700, left=100, top=50 location=no");
	}
	 if(Col==10){
		 window.open("${contextPath}/hm/p0022/homeInit_p04.do", "a", "width=500, height=700, left=100, top=50 location=no");
	 }
	 if(Col==12){
		 window.open("${contextPath}/hm/p0022/homeInit_p05.do", "a", "width=500, height=700, left=100, top=50 location=no");
	 }
}
function mySheet1_OnPopupClick(Row,Col){
	if(Col==6){
	window.open("${contextPath}/hm/p0022/homeInit_p02.do", "a", "width=500, height=700, left=100, top=50 location=no")
	}
}
function mySheet1_OnButtonClick(Row,Col){
	alert("현세찡");
	
}

</script>
<meta charset="UTF-8">
<title>인사발령</title>
</head>
<body onload="LoadPage()">

<form name="frm" >



"발령일"

<input id="date"type="text"  class="Datepicker">
"~"
<input  id="date2"type="text" class="Datepicker">

<span>제목</span>
<input id = "title"  type="text" class="" style="width: 160px">

<span>작성자</span>
<input id="masterEmpl" type="text" >
<input id="masterEmplCode" type="hidden">
<a href="javascript:goPopup()" >사원검색</a>


<a href="javascript:doAction('search')" class="IBbutton">조회</a>

</form>


발령제목

<a href="javascript:doAction('insert1')" class="IBbutton">입력</a>
<a href="javascript:doAction('save1')" class="IBbutton">저장</a>


<script type="text/javascript"> 
createIBSheet("mySheet1","100%","30%");
</script>



발령후내역

<a href="javascript:doAction('insert2')" class="IBbutton">입력</a>
<a href="javascript:doAction('save2')" class="IBbutton">저장</a>


<script type="text/javascript">
createIBSheet("mySheet2","100%","40%");
</script>




</body>
</html>