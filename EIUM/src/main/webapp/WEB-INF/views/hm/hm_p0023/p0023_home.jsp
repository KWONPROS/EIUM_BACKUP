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
div.sheet_search{
border:1px solid#dbdbdb;
background:#f9f9f9;
padding:4px 4px 4px  10px;
overflow:auto;
}

.Mandatory:after {
    color: #e32;
    content: "*";
    display: inline;
    font-weight: bold;
    font-size: 12px;
}
.bbit-dp-input {
    width: 100px;
    height: 18px;
    padding-left: 4px;
}
div.sheet_title {
    clear: both;
    overflow: auto;
}
div.sheet_title li.txt {
    float: left;
    font-weight: bold;
    height: 35px;
    line-height: 35px;
}
div.sheet_title li.btn {
    float: right;
    height: 28px;
    padding-top: 7px;
}
ul, ol {
    list-style: none;
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
initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3, MergeSheet:msHeaderOnly}
initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
initSheet.Cols = [
      {Header:"상태|상태",Type:"Status",SaveName:"Status", Align:"Center"},
      {Header:"삭제|삭제",Type:"DelCheck",SaveName:"DEL_CHK"},
      {Header:"발령일자|발령일자",Type:"Date",SaveName:"appoint_DATE",Align:"Center",Width:100},
      {Header:"발령번호|발령번호",Type:"Text",SaveName:"appoint_CODE",Align:"Center",Width:100},   
      {Header:"제목|제목",Type:"Text",SaveName:"appoint_TITLE",Align:"Center",Width:100},         
      {Header:"마감/취소|마감/취소",Type:"Button",SaveName:"appoint_YN",Align:"Center",Width:100},         
      {Header:"작성자|직원번호",Type:"Text",SaveName:"masterEmployee_CODE",Format:"Ymd",Width:100},
      {Header:"작성자|작성자명",Type:"Text",SaveName:"masterEmployee_NAME",Align:"Center",Width:100},
      {Header:"작성자|사업장",Type:"Text",SaveName:"site_NAME",Align:"Center",Width:100},
      {Header:"작성자|부서",Type:"Text",SaveName:"department_NAME",Align:"Center",Width:100},
      {Header:"작성자|직책",Type:"Text",SaveName:"duty_NAME",Align:"Center",Width:100}
      ];
   IBS_InitSheet(mySheet1, initSheet);
   mySheet1.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분

   
   mySheet2.RemoveAll();
   //아이비시트 초기화
   var initSheet2 = {};
   initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3, FrozenCol:5}
   initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
   initSheet2.Cols = [
         {Header:"상태",Type:"Status",SaveName:"Status", Align:"Center"},
         {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK"},
         {Header:"인사발령내역고유번호",Type:"Text",SaveName:"appoint_HISTORY_CODE",Align:"Center",Width:100,"Hidden":1},   
         {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",Align:"Center",Width:100},
         {Header:"사원명",Type:"Text",SaveName:"employee_NAME",Align:"Center",Width:100},         
         {Header:"시작일자",Type:"Text",SaveName:"department_NAME",Align:"Center",Width:100},         
         {Header:"종료일자",Type:"Text",SaveName:"duty_NAME",Align:"Center",Width:100},
         {Header:"발령유형",Type:"Text",SaveName:"hr_APPOINT_INDEX_NAME",Align:"Center",Width:100},
         {Header:"발령구분",Type:"Text",SaveName:"appoint_INDEX_NAME",Align:"Center",Width:100},
         {Header:"재직상태",Type:"Text",SaveName:"work_STATE",Align:"Center",Width:100},
         {Header:"입사일자",Type:"Text",SaveName:"join_DATE",Align:"Center",Width:100},
         {Header:"사업장",Type:"Text",SaveName:"site_NAME",Align:"Center",Width:100},
         {Header:"부서",Type:"Text",SaveName:"department_NAME",Align:"Center",Width:100},
         {Header:"직종",Type:"Text",SaveName:"job_CLASS_NAME",Align:"Center",Width:100},
         {Header:"직급",Type:"Text",SaveName:"position_NAME",Align:"Center",Width:100},
         {Header:"직책",Type:"Text",SaveName:"duty_NAME",Align:"Center",Width:100},
         {Header:"직무",Type:"Text",SaveName:"job_DIS_NAME",Align:"Center",Width:100},
         {Header:"급여유형",Type:"Text",SaveName:"pay_TYPE_NAME",Align:"Center",Width:100},
         {Header:"급여호봉",Type:"Text",SaveName:"pay_GRADE_NAME",Align:"Center",Width:100},
         {Header:"퇴직사유",Type:"Text",SaveName:"out_REASON_NAME",Align:"Center",Width:100}
         ];
      IBS_InitSheet(mySheet2,initSheet2);
      mySheet2.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분

      mySheet3.RemoveAll();
      //아이비시트 초기화
      var initSheet3 = {};
      initSheet3.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3, FrozenCol:5}
      initSheet3.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
      initSheet3.Cols = [
            {Header:"상태",Type:"Status",SaveName:"Status", Align:"Center"},
            {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK"},
            {Header:"인사발령내역고유번호",Type:"Text",SaveName:"appoint_HISTORY_CODE",Align:"Center",Width:100,"Hidden":1},   
            {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",Align:"Center",Width:100},
            {Header:"사원명",Type:"Text",SaveName:"employee_NAME",Align:"Center",Width:100},         
            {Header:"시작일자",Type:"Text",SaveName:"department_NAME",Align:"Center",Width:100},         
            {Header:"종료일자",Type:"Text",SaveName:"duty_NAME",Align:"Center",Width:100},
            {Header:"발령유형",Type:"Text",SaveName:"hr_APPOINT_INDEX_NAME",Align:"Center",Width:100},
            {Header:"발령구분",Type:"Text",SaveName:"appoint_INDEX_NAME",Align:"Center",Width:100},
            {Header:"재직상태",Type:"Text",SaveName:"work_STATE",Align:"Center",Width:100},
            {Header:"입사일자",Type:"Text",SaveName:"join_DATE",Align:"Center",Width:100},
            {Header:"사업장",Type:"Text",SaveName:"site_NAME",Align:"Center",Width:100},
            {Header:"부서",Type:"Text",SaveName:"department_NAME",Align:"Center",Width:100},
            {Header:"직종",Type:"Text",SaveName:"job_CLASS_NAME",Align:"Center",Width:100},
            {Header:"직급",Type:"Text",SaveName:"position_NAME",Align:"Center",Width:100},
            {Header:"직책",Type:"Text",SaveName:"duty_NAME",Align:"Center",Width:100},
            {Header:"직무",Type:"Text",SaveName:"job_DIS_NAME",Align:"Center",Width:100},
            {Header:"급여유형",Type:"Text",SaveName:"pay_TYPE_NAME",Align:"Center",Width:100},
            {Header:"급여호봉",Type:"Text",SaveName:"pay_GRADE_NAME",Align:"Center",Width:100},
            {Header:"퇴직사유",Type:"Text",SaveName:"out_REASON_NAME",Align:"Center",Width:100}
            ];
         IBS_InitSheet(mySheet3,initSheet3);
         mySheet3.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분

}


function doAction(sAction) {
	switch (sAction) {
	case "search":
		var param = FormQueryStringEnc(document.frm);
	    mySheet.DoSearch("${contextPath}/wm/p0005/searchList.do", param);
		break;
	case "reset":
		mySheet.RemoveAll();
	    $('#date').attr('value', "");
	    $('#date2').attr('value', "");
	    $('#p_text').attr('value', "");
	    $('#p_text').attr('placeholder', "사원의 이름을 입력해주세요.");
		break;
	}
}
</script>
<meta charset="UTF-8">
<title>인사발령</title>
</head>
<body onload="LoadPage()">
<form id="sendForm" name="sendForm" method="post">
<div class= "sheet_search outer">
<div>
<table>
<tbody>
<tr>
<td>
<span class="Mandatory">
"발령일"
</span>
<input  type="text" id="date" class="Datepicker">
"~"
<input type="text" id="date2" class="Datepicker">
</td>
<td>
<span>제목</span>
<input id = "title"  type="text" class="text" style="width: 160px">
</td>
<td>
<span>작성자</span>
<input id="masterEmpl" type="text" class="text">
</td>
<td id="commonSearchEmpId">
<span id="">대상자</span>
<input id="emplyCode" type="text" class="text" style="width:160px"><a href="" class="IBbutton"></a>
<input id="emply" type="text" class="text" style="width:160px">

</td>
<td>
<a href="javascript:doAction('search')" class="IBbutton">조회</a>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</form>
<table border="0" cellspacing="0" cellpadding="0" class="sheet_main">
<tbody>
<tr>
<td>
<div class="inner">
<div class="sheet_title">
<ul>
<li class="txt">발령제목</li>
<li class="btn">
<a href="" class="IBbutton">입력</a>
<a href="" class="IBbutton">저장</a>
</li>
</ul>
</div>
</div>
<script type="text/javascript"> 
createIBSheet("mySheet1","100%","30%");
</script>
<tr>
<td>
<div class = "inner">
<div class="sheet_title">
<ul>
<li class="txt">발령후내역</li>
<li class="btn">
<a href="" class="IBbutton">입력</a>
<a href="" class="IBbutton">저장</a>
</li>
</ul>
</div>
</div>
<script type="text/javascript">
createIBSheet("mySheet2","100%","40%");
</script>
</td>
</tr>
<tr>
<td>
<div class="inner">
<div class="sheet_title">
<ul>
<li class="txt">발령전내역</li>
</ul>
</div>
</div>
<script>
createIBSheet("mySheet3","100%","10%");
</script>
</td>
</tr>
</tbody>
</table>

</body>
</html>