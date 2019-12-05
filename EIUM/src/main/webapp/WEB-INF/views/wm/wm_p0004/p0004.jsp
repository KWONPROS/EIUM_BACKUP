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
		initSheet.Cfg = { SearchMode : smLazyLoad, ToolTip : 1, MouseHoverMode : 2 };
		initSheet.HeaderMode = { Sort : 1, ColMove : 1, ColResize : 10, HeaderCheck : 1 };
		initSheet.Cols = [ 
			               { "Header":"상태","SaveName":"sStatus","Type":"Status","Align":"Center","Width":50 },
			               { "Header":"삭제","SaveName":"DEL_CHK","Type":"DelCheck" },
			               { "Header" : "출장고유코드", "SaveName" : "business_TRIP_CODE", "Type" : "Text", "Width" : 100, "Align" : "Center", "Hidden" : 1 }, 
			               { "Header" : "사원코드", "SaveName" : "employee_CODE", "Type" : "Popup", "Width" : 100, "Align" : "Center" }, 
			               { "Header" : "사원명", "SaveName" : "employee_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "부서명", "SaveName" : "department_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "직급", "SaveName" : "position_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "시작일", "SaveName" : "start_DATE", "Type" : "Date", "Width" : 100, "Align" : "Center", "Format":"Ymd" },
			               { "Header" : "종료일", "SaveName" : "end_DATE", "Type" : "Date", "Width" : 100, "Align" : "Center", "Format":"Ymd" },
			               { "Header" : "국가코드", "SaveName" : "country_CODE", "Type" : "Text", "Width" : 100, "Align" : "Center", "Hidden" : 1 },
			               { "Header" : "출장국가", "SaveName" : "country_NAME", "Type" : "Popup", "Width" : 100, "Align" : "Center" },
			               { "Header" : "출장지", "SaveName" : "area", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "항공료", "SaveName" : "flight_COST", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "본인부담", "SaveName" : "self_BURDEN", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "회사부담", "SaveName" : "company_BURDEN", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "기타비용", "SaveName" : "ect_COST", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "총비용", "SaveName" : "total_COST", "Type" : "Text", "Width" : 100, "Align" : "Center", "CalcLogic":"|13|+|14|+|15|" },
			               { "Header" : "목적", "SaveName" : "purpose", "Type" : "Text", "Width" : 100, "Align" : "Center" }
		                 ];

		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditableColorDiff(1);
		mySheet.SetActionMenu("엑셀 파일 저장");
		mySheet.SetSelectionMode(1);
		mySheet.SetColEditable(4,0);
		mySheet.SetColEditable(5,0);
		mySheet.SetColEditable(6,0);
		mySheet.SetColEditable(16,0);
		
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			var param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/wm/p0004/searchList.do", param);
			break;
		case "reset":
			mySheet.RemoveAll();
		    $('#date').attr('value', "");
		    $('#date2').attr('value', "");
		    $('#p_text').attr('value', "");
		    $('#p_text').attr('placeholder', "사원의 이름을 입력해주세요.");
			break;
		case "save":
			mySheet.DoSave("${contextPath}/wm/p0004/saveData.do");
			break;
		case "insert":
		    var row = mySheet.DataInsert();
		    break;
		case "down":
			mySheet.Down2Excel();
		    break;
		}
	}
	
	
	function mySheet_OnPopupClick(Row,Col) {
		row=Row;
		col=Col;
		
		if(Col=="3"){
		window.name = "parent";
		window.open("${contextPath}/wm/p0004/employeeSearch_Init.do", "a", "width=500, height=700, left=100, top=50");
		}
		
		if(Col=="10"){
			window.name = "parent2";
			window.open("${contextPath}/wm/p0004/countrySearch_Init.do", "a", "width=500, height=700, left=100, top=50");
		}
	}
	
	function GetData(x){
		mySheet.SetRowData(mySheet.GetSelectRow(),x);
	}
	
	function GetData2(x){
		mySheet.SetRowData(mySheet.GetSelectRow(),x);
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
	padding: 10px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
}
.left {
	position: relative;
	top: 130px;
	left: 60px;
	width: 900px;
}
.ui-datepicker{ font-size: 12px; width: 160px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
#searchBar img {vertical-align: middle; padding: 0px 5px 0px 2px; }
	
	</style>

</head>
<body onload="LoadPage()">
	<form name="frm">
        <div class="leftbuttons">  
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
        </div> 
        
        <div class="rightbuttons">
		<button type="button" onclick="doAction('reset')" class="IBbutton">초기화</button>
		<button type="button" onclick="doAction('search')" class="IBbutton">조회</button>
		<button type="button" onclick="doAction('insert')" class="IBbutton">추가</button>
		<button type="button" onclick="doAction('save')" class="IBbutton">저장</button>
		</div>

		<div class="title"> 
        <header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 근태관리 : 출장관리</header>
        </div>
        
        <div class="left">
        <div id="searchBar">
            &nbsp;&nbsp; 조회기간 : <input type="text" id="date" class="Datepicker">
             ~ <input type="text" id="date2" class="Datepicker">
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		       사원명 : <input type="text" id="p_text" placeholder="사원의 이름을 입력해주세요.">
        </div>
		</div>

		<div style="position: absolute; top: 220px; left: 70px;">
			<script type="text/javascript">
				createIBSheet("mySheet", "1600px", "600px");
			</script>
		</div>
	</form>
</body>