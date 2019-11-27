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
	
<script>
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3}
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
				{Header:"코드",Type:"Text",SaveName:"employee_TRAINING_CODE",Edit:0},
				{Header:"교육명",Type:"Text",SaveName:"employee_TRAINING_NAME",Edit:0}
				];
			IBS_InitSheet(mySheet, initSheet);
			
			mySheet.SetEditableColorDiff(0); //편집불가능한 셀 표시 구분
			/* mySheet.SetSheetHeight(1000); */
			
			//탭
			
			mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, szeMode:3}
		initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet2.Cols = [
				{Header:"사원코드",Type:"Text",SaveName:"employee_CODE",Edit:0},
				{Header:"사원명",Type:"Text",SaveName:"employee_NAME",Edit:0},
				{Header:"시작일",Type:"Text",SaveName:"employee_TRAINING_START_DATE",Edit:0},
				{Header:"종료일",Type:"Text",SaveName:"employee_TRAINING_END_DATE",Edit:0},
				{Header:"교육시간",Type:"Text",SaveName:"employee_TRAINING_TIME",Edit:0},
				{Header:"교육일수",Type:"Text",SaveName:"employee_TRAINING_DATE_COUNT",Edit:0},
				{Header:"이수여부",Type:"Combo",SaveName:"finish_YN","ComboText":"이수|미이수", "ComboCode":"Y|N",Edit:0},
				{Header:"출석점수",Type:"Text",SaveName:"attendence_SCORE",Edit:0},
				{Header:"태도점수",Type:"Text",SaveName:"attitude_SCORE",Edit:0},
				{Header:"평가점수",Type:"Text",SaveName:"score",Edit:0},
				{Header:"합계",Type:"Text",SaveName:"total",Edit:0},
				{Header:"교육평가",Type:"Text",SaveName:"assessment_DESC",Edit:0},	
				];
			IBS_InitSheet(mySheet2, initSheet2);
			
			mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
			/* mySheet.SetSheetHeight(1000); */
			
			//탭
		}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction){
		case "search": // 조회
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/hm/p0040/searchTraining.do",param);

			break;
		case "reload": //초기화
			//조회 데이터 삭제
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			$("#date").val('');
			$("#date2").val('');
			$("#site").val('');
			$("#department").val('');
			
			break;
	}
	}
	
	//로우 클릭시
	function mySheet_OnClick(Row, Col){
		var param = "param="+mySheet.GetCellValue(Row,0);
		mySheet2.DoSearch("${contextPath}/hm/p0040/searchEmployeeList.do",param);

		
	}

	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
	}
	
	//달력 API
	$(function() {
	  $( ".Datepicker" ).datepicker({
	  	dateFormat: "yymmdd",
	  	showOn: "both", 
	      buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	      buttonImageOnly: true , 
	       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	});
	
function siteSearch(){
	window.open("${contextPath}/hm/p0040/siteSearch_p01.do", "a", "width=500, height=700, left=100, top=50 location=0");
	
}
function departmentSearch(){
	window.open("${contextPath}/hm/p0040/departmentSearch_p02.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
	
function siteValue(rowData){
	console.log("dddd"+rowData.site_NAME);
	$("#site").val(rowData.site_NAME);
}
function departmentValue(rowData){
	$("#department").val(rowData.department_NAME);
}	
</script>

</head>
<body onload="LoadPage()">



<form name="frm" >



교육기간

<input id="date"type="text"  class="Datepicker">
~
<input  id="date2"type="text" class="Datepicker">



<a href="javascript:doAction('reload')" class="IBbutton">초기화</a>
<a href="javascript:doAction('search')" class="IBbutton">조회</a>

</form>

	<div class="left">
	<div class="ib_product">
		<script>
			//IBSheet 객체 생성 (객체 id, 너비, 높이)
			createIBSheet("mySheet", "100%", "304px");

		</script>
	</div>
	</div>

	
	
	

  
	

	<div class="right">
	
	<script>
	createIBSheet("mySheet2", "100%", "304px");
	</script>
	
	</div>
	



</body>
</html>