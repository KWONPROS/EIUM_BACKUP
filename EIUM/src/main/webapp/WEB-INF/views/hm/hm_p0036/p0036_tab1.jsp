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
   border:0;
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
.rightbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   right: 0px;
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
#searchBar {
	background: #EBEBEB;
	padding: 10px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
}
.leftbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   left: 0px;
}
</style>
	
<script>
	/*Sheet 기본 설정 */
	function LoadPage() {
		var now = new Date();
		var firstDate, lastDate;
		firstDate = new Date(now.getFullYear(), now.getMonth(), 1);
		lastDate = new Date(now.getFullYear(), now.getMonth()+1, 0);
		$("#date").datepicker().datepicker("setDate", firstDate);
		$("#date2").datepicker().datepicker("setDate", lastDate);
		
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3}
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"NO",Type:"Seq",SaveName:"SEQ",Edit:0,Width:"80"},
			{Header:"사원코드",Type:"Text",SaveName:"employee_CODE",Edit:0,Width:"150"},
			{Header:"사원명",Type:"Text",SaveName:"employee_NAME",Edit:0,Width:"150"},
			{Header:"주민등록번호",Type:"Text",SaveName:"resident_RESISTRATION_NUMBER",Edit:0,Width:"150"},	
			{Header:"부서",Type:"Text",SaveName:"department_NAME",Edit:0,Width:"150"},
			{Header:"직책",Type:"Text",SaveName:"duty_NAME",Edit:0,Width:"150"},
			{Header:"입사일",Type:"Text",SaveName:"employee_JOIN_DATE",Edit:0,Width:"150"},
			{Header:"퇴사일",Type:"Text",SaveName:"employee_RESIGNATION_DATE",Edit:0,Width:"150"},
			{Header:"재직기간",Type:"Text",SaveName:"working_YEARS",Edit:0,Width:"150"},
				];
			IBS_InitSheet(mySheet, initSheet);
			
			mySheet.SetEditableColorDiff(0); //편집불가능한 셀 표시 구분
			/* mySheet.SetSheetHeight(1000); */
		}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction){
		case "search": // 조회
			var param = FormQueryStringEnc(document.frm);
		if($("#date").val() == '' || $("#date2").val() == ''){
			alert('기준일은 필수항목입니다');
			}else if($("#date").val() > $("#date2").val()){
				alert("기준일을 확인하여 주십시오");
			}else{
				mySheet.DoSearch("${contextPath}/hm/p0036/searchList.do",param);
			}
			

			break;
		case "reload": //초기화
			//조회 데이터 삭제
			mySheet.RemoveAll();
			$("form").each(function() {  
	            this.reset();
	         });  
			break;
		case "down":
			mySheet.Down2Excel();	
			break;
	}

	}

	
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
	
	
function siteSearch(){
	window.open("${contextPath}/hm/p0040/siteSearch_p01.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
function departmentSearch(){
	window.open("${contextPath}/hm/p0040/departmentSearch_p02.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
function JOB_CLASS(){
	window.open("${contextPath}/hm/p0036/job_class_p01.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
function POSITION(){
	window.open("${contextPath}/hm/p0036/position_p02.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
function DUTY(){
	window.open("${contextPath}/hm/p0036/duty_p03.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
function JOB_DIS(){
	window.open("${contextPath}/hm/p0036/job_dis_p04.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
function WORK_TYPE(){
	window.open("${contextPath}/hm/p0036/work_type_p05.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
function PAY_TYPE(){
	window.open("${contextPath}/hm/p0036/pay_type_p06.do", "a", "width=500, height=700, left=100, top=50 location=0");
}

	
function siteValue(rowData){
	$("#site").val(rowData.site_NAME);
}
function departmentValue(rowData){
	$("#department").val(rowData.department_NAME);
}
function job_class(rowData){
	$("#job_class").val(rowData.job_CLASS_NAME);
}	
function position(rowData){
	$("#position").val(rowData.position_NAME);
}	
function duty(rowData){
	$("#duty").val(rowData.duty_NAME);
}	
function job_dis(rowData){
	$("#job_dis").val(rowData.job_DIS_NAME);
}	
function work_type(rowData){
	$("#work_type").val(rowData.work_TYPE_NAME);
}	
function pay_type(rowData){
	$("#pay_type").val(rowData.pay_TYPE_NAME);
}	


</script>

</head>
<body onload="LoadPage()">
		<form name="frm" >
        <div class="leftbuttons">  
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
        </div> 
		<div class="rightbuttons">
		<button type="button" onclick="doAction('reload')" class="IBbutton">초기화</button>
		<button type="button" onclick="doAction('search')" class="IBbutton">조회</button>
		</div>
		

	   <div class="left">
       <div id="searchBar">
		 사업장<input type="text" id="site">
		<a href="javascript:siteSearch()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		
		부서<input id="department" type="text" >
		<a href="javascript:departmentSearch()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		
		직종<input id="job_class" type="text" >
		<a href="javascript:JOB_CLASS()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		
		직급<input id="position" type="text" >
		<a href="javascript:POSITION()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		
		<div>
		직책<input id="duty" type="text" >
		<a href="javascript:DUTY()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		
		직무<input id="job_dis" type="text" >
		<a href="javascript:JOB_DIS()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		
		고용형태<input id="work_type" type="text" >
		<a href="javascript:WORK_TYPE()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		
		급여형태<input id="pay_type" type="text" >
		<a href="javascript:PAY_TYPE()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		
		기준일<input id="date"type="text"  class="Datepicker">~<input id="date2"type="text"  class="Datepicker">
		
		퇴사자포함<input type="checkbox" id ="resigner" value="1">
		</div>
		</div>	
		</div>
	



<div style="position: absolute; top: 220px; left: 70px;">
<script>
createIBSheet("mySheet", "1500px", "300px");
</script>
</div>
</form>
</body>
</html>