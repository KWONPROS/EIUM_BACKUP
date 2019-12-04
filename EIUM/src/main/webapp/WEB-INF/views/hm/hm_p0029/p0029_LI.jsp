<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script type="text/javascript">
	var pageheightoffset = 200; //시트높이 계산용
	
	function setSite(){
		site_code=document.getElementById("Psite_code").value;
		site_name=document.getElementById("Psite_name").value;
	};

	//sheet 기본설정
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


		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = { SearchMode : smLazyLoad, ToolTip : 1, MouseHoverMode:2};
		initSheet.HeaderMode = { Sort : 1, ColMove : 1, ColResize : 10, HeaderCheck : 1 };
		initSheet.Cols = [ 
			 	{Header:"NO",Type:"Seq",SaveName:"NUMBER",Width:70, Align:"Center" },
			 	{Header:"사원코드",Type:"Text",SaveName:"employee_CODE",  Align:"Center", Edit: 0,Hidden:1},	
		        {Header:"사원명",Type:"Text",SaveName:"employee_NAME", Width:180,  Align:"Center", Edit: 0},	
		        {Header:"자격종류",Type:"Text",SaveName:"license_NAME", Width:180, Align:"Center", Edit: 0},
				{Header:"취득일",Type:"Text",SaveName:"start_date", Width:180, Align:"Center", Edit: 0},
				{Header:"만료일",Type:"Text",SaveName:"end_date", Width:190, Align:"Center", Edit: 0},
				{Header:"자격증번호",Type:"Text",SaveName:"license_NUMBER", Width:190, Align:"Center", Edit: 0},
				{Header:"발행기관",Type:"Text",SaveName:"institute", Width:200, Align:"Center", Edit: 0},
				{Header:"수당여부",Type:"Text",SaveName:"bonus", Width:200, Align:"Center", Edit: 0},
				{Header:"자격면허코드",Type:"Text",SaveName:"license_CODE", Width:200, Align:"Center", Edit: 0, Hidden:1}
		];

		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditableColorDiff(1);
		mySheet.SetActionMenu("엑셀 파일 저장");
		mySheet.SetSelectionMode(1);
		mySheet.SetColEditable(0, 0);
		mySheet.SetColEditable(1, 0);
		mySheet.SetColEditable(2, 0);
		mySheet.SetColEditable(3, 0);
		mySheet.SetColEditable(4, 0);
		mySheet.SetColEditable(5, 0);
		mySheet.SetColEditable(6, 0);
		mySheet.SetColEditable(7, 0);
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			var param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/hm/p0029/searchList_LI.do", param);
			break;
		case "reset":
			mySheet.RemoveAll();
		    $('#date').attr('value', "");
		    $('#date2').attr('value', "");
		    $('#Select').attr('value', "");
		    $('#p_text').attr('value', "");
		    $('#p_text').attr('placeholder', "내용을 입력해주세요.");
			break;
		}
	}
	
	 //조회조건 팝업(과거)
	 function showPopup_option() { //조회조건
		 var selectItem = $("#searchList").val();
		 
		 if(selectItem == "1. 사업장"){
			 var url = '${contextPath}/hm/p0029/search_Site.do';
			 window.open(url, "a", "width=600, height=500, left=100, top=50");
		 }else if(selectItem == "2. 부서"){
			 var url = '${contextPath}/hm/p0029/search_Dept.do';
			 window.open(url, "a", "width=600, height=500, left=100, top=50");
		 }
	  
	  }
	 function departmentValue(rowData){
		 $("#Psite_name").val(rowData.department_NAME);
		 $("#Psite_code").val(rowData.department_CODE);
	 }
	 /* function showPopup_work(){ //재직구분
		 var url = '${contextPath}/hm/p0029/search_Work.do';
		 window.open(url, "a", "width=600, height=500, left=100, top=50");
	 }
	 function showPopup_position(){ //직급
		 var url = '${contextPath}/hm/p0029/search_Position.do';
		 window.open(url, "a", "width=600, height=500, left=100, top=50");
	 } */

	 //팝업 도움 코드
	 function findPopup(tablename){
	      var pop = window.open("findPopup.do?command="+tablename,"findPopup","width=342,height=520,resizable = no, scrollbars = no"); 

	   }
	 function findPopup(tablename, index){
	      var pop = window.open("findPopup.do?command="+tablename+"&index="+index,"findPopup","width=342,height=520,resizable = no, scrollbars = no"); 

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
#searchBar {
	background: #EBEBEB;
	padding: 15px 125px;
	margin-bottom: 30px;
	border-radius: 5px;
	font-size: 12px;
	/*여기서 중간 텀띄우기*/
}
.searchBarTitle {
	background: #5E5E5E;
	padding: 4px;
	color: white;
	border-radius: 5px;
	margin: 0 5px 0 70px;
	vertical-align: middle;
}
.left{
	position: relative;
	top: 80px;
	left: 30px;
	width: 1403px;
}
.center{
	position: relative;
	top: 60px;
	left: 30px;
	width: 870px;
	/* 670px; */
}
#searchBar input, select {
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-left: 5px;
	vertical-align: middle;
}

#searchBar img {
	margin: 0 10px 0 3px;
	vertical-align: middle;
}
.otherline{
	padding: 10px 10px 0px 10px;
}
.ui-datepicker{ font-size: 12px; width: 160px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
/* #searchBar img {vertical-align: middle; padding: 0px 5px 0px 2px; } */
	
	</style>

</head>
<body onload="LoadPage()">
 		<div class="leftbuttons">
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
        </div> 
        
        <div class="rightbuttons">
		<button type="button" onclick="doAction('reset')" class="IBbutton">초기화</button>
		<button type="button" onclick="doAction('search')" class="IBbutton">조회</button>
		</div>

		<div class="title"> 
        </div>
	<form name="frm">
       
        
        <div class="left">
        <div id="searchBar">
       <span class="searchBarTitle">조회조건</span>
				<select id="searchList" >
					<option selected >1. 사업장</option>
					<option >2. 부서</option>
				</select>
				<input type="text" id="Psite_code" style="width: 60px;"><a href="javascript:showPopup_option();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<input type="text" id="Psite_name">
				<span class="searchBarTitle">재직구분</span>
				<input type="text" id="WORK_STATUS_CODE" style="width: 60px;"><a href="javascript:findPopup('WORK_STATUS');"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<input type="text" id="WORK_STATUS_NAME" style="width: 60px;">
				<span class="searchBarTitle">직급</span>
				<input type="text" id="POSITION_CODE" style="width: 60px;"><a href="javascript:findPopup('POSITION');"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<input type="text" id="POSITION_NAME" style="width: 60px;">
				<div class="otherline">
             	<span class="searchBarTitle">자격증</span>
				<input type="text" id="LICENSE_CODE" style="width: 60px;"><a href="javascript:findPopup('LICENSE');"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<input type="text" id="LICENSE_NAME">
				</div>
           <%--  고과명 : <input type="text" id="Phr_assessment_name"><a href="javascript:showPopup1();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
           사업장 : <input type="text" id="Psite_name"><a href="javascript:showPopup2();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
           <br><br>
            사원명 : <input type="text" id="Pemployee_name"><a href="javascript:showPopup3();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
            고과일자 : <input type="text" id="date" c lass="Datepicker">
             ~ <input type="text" id="date2" class="Datepicker"> --%>
           
        </div>
		</div>

		<div class="center">
			<script type="text/javascript">
				createIBSheet("mySheet", "1500px", "600px");
			</script>
		</div>
      <input type="hidden" id="Psite_code" >
      

	</form>
</body>