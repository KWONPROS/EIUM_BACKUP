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
<script type="text/javascript">
	var pageheightoffset = 200; //시트높이 계산용

	//sheet 기본설정
	function LoadPage() {

		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = { SearchMode : smLazyLoad, ToolTip : 1, MouseHoverMode : 2 };
		initSheet.HeaderMode = { Sort : 1, ColMove : 1, ColResize : 10, HeaderCheck : 1 };
		initSheet.Cols = [ 
			               { "Header":"상태","SaveName":"sStatus","Type":"Status","Align":"Center","Width":50 },
			               { "Header":"삭제","SaveName":"DEL_CHK","Type":"DelCheck" },
			               { "Header" : "사원코드", "SaveName" : "employee_CODE", "Type" : "Popup", "Width" : 100, "Align" : "Center" }, 
			               { "Header" : "사원명", "SaveName" : "employee_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "부서명", "SaveName" : "department_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "직급", "SaveName" : "position_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "현재 잔여일수", "SaveName" : "vacation_REMAIN_DATE", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "근태종류", "SaveName" : "vacation_TYPE", "Type" : "Combo", "Width" : 100, "Align" : "Center", "ComboText":"연차|특별휴가|경조휴가", "ComboCode":"0|1|2", "UpdateEdit":0 },
			               { "Header" : "시작일", "SaveName" : "vacation_START_DATE", "Type" : "Date", "Width" : 100, "Align" : "Center", "Format":"Ymd" },
			               { "Header" : "종료일", "SaveName" : "vacation_END_DATE", "Type" : "Date", "Width" : 100, "Align" : "Center", "Format":"Ymd" },
			               { "Header" : "신청일수", "SaveName" : "vacation_APPLY_DATE", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "신청 후 잔여일수", "SaveName" : "REMAIN_DATE", "Type" : "Text", "Width" : 100, "Align" : "Center", "CalcLogic":"|6|-|10|" } 
		                 ];

		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditableColorDiff(1);
		mySheet.SetActionMenu("엑셀 파일 저장");
		mySheet.SetSelectionMode(1);
		mySheet.SetColEditable(6,0);
		mySheet.SetColEditable(10,0);
		mySheet.SetColEditable(11,0);
		
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			var param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/wm/p0002/searchList.do", param);
			break;
		case "reset":
			mySheet.RemoveAll();
			break;
		case "save":
			mySheet.DoSave("${contextPath}/wm/p0002/saveData.do");
			break;
		case "insert":
		    var row = mySheet.DataInsert();
		    break;
		}
	}
	
	function mySheet_OnChange(Row,Col){
		var sd=mySheet.GetCellValue(Row,Col-1);
	    var ed=mySheet.GetCellValue(Row,Col);
		
		if(Col==9){
			
		function x(sd,ed){
			    var stDate = new Date(sd.substring(0,4),sd.substring(4,6),sd.substring(6,8)) ;
			    var endDate = new Date(ed.substring(0,4),ed.substring(4,6),ed.substring(6,8)) ;
			    var btMs = endDate.getTime() - stDate.getTime() ;
			    btDay = btMs / (1000*60*60*24) ;
			 	return btDay;
				
			}
		
		x(sd,ed);
		
		mySheet.SetCellValue(Row,Col+1,btDay);
			
		if(mySheet.GetCellValue(Row,Col+2) < 0) {
			mySheet.SetCellBackColor(Row, Col+2, "#FF0000"); 
		} else {
			mySheet.SetCellBackColor(Row, Col+2, "yellow"); 
		}
		
		}
		
	}
	
	function mySheet_OnPopupClick(Row,Col) {
		row=Row;
		col=Col;
		
		if(Col=="2"){
		window.open("${contextPath}/wm/p0002/employeeSearch_Init.do", "a", "width=500, height=700, left=100, top=50");
		}
	}
	
	function setEmployee(){
		employeeCode=document.getElementById("PemployeeCode").value;
		employeeName=document.getElementById("PemployeeName").value;
		departmentName=document.getElementById("PdepartmentName").value;
		positionName=document.getElementById("PpositionName").value;
		vacationremainDate=document.getElementById("PvacationremainDATE").value;
		mySheet.SetCellText(row,col,employeeCode);
		mySheet.SetCellText(row,col+1,employeeName);
		mySheet.SetCellText(row,col+2,departmentName);
		mySheet.SetCellText(row,col+3,positionName);	
		mySheet.SetCellText(row,col+4,vacationremainDate);	
	}

</script>


<script>
	function selectSite() {

		$.ajax({

					url : "${contextPath}/sm/p0006/SiteList.do",//목록을 조회 할 url

					type : "POST",

					dataType : "JSON",

					success : function(data) {

						for (var i = 0; i < data['Data'].length; i++) {
							
							

							var option = "<option value='" + data['Data'][i].site_NAME + "'>"
									+ data['Data'][i].site_NAME + "</option>";

							//대상 콤보박스에 추가

							$('#SiteList').append(option);

						}

					},

					error : function(jqxhr, status, error) {

						alert("에러");

					}

				});

	};

	function selectDept() {

		var SiteList = $('#SiteList').val();

		$
				.ajax({

					url : "${contextPath}/sm/p0006/DeptList.do",//목록을 조회 할 url

					type : "POST",

					data : {
						"SiteList" : SiteList
					},

					dataType : "JSON",

					success : function(data) {
						$(".1").remove();

						for (var i = 0; i < data['Data'].length; i++) {

							var option = "<option class='1' value='" + data['Data'][i].department_NAME + "'>"
									+ data['Data'][i].department_NAME
									+ "</option>";

							//대상 콤보박스에 추가
							$('#DeptList').append(option);

						}

					},

					error : function(jqxhr, status, error) {

						alert("에러");

					}

				});

	};
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
	width: 850px;
}
	
	</style>

</head>
<body onload="LoadPage()">
	<form name="frm">
        <div class="leftbuttons">  
		<button type="button" onclick="doAction('print')" class="IBbutton">인쇄</button>
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
        </div> 
        
        <div class="rightbuttons">
		<button type="button" onclick="doAction('reset')" class="IBbutton">초기화</button>
		<button type="button" onclick="doAction('search')" class="IBbutton">조회</button>
		<button type="button" onclick="doAction('insert')" class="IBbutton">추가</button>
		<button type="button" onclick="doAction('save')" class="IBbutton">저장</button>
		</div>

		<div class="title"> 
        <header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 휴가관리</header>
        </div>
        
        <div class="left">
        <div id="searchBar">
            &nbsp;&nbsp; 귀속연월 : <select id="SiteList" onchange="selectDept()">
			<option value="" selected>전체</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 근태종류 : <select id="vacaTYPE">
			<option value="" selected>전체</option>
			<option value="y" >연차</option>
			<option value="t" >특별휴가</option>
			<option value="k" >경조휴가</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 조회조건 : <select id="Select">
		    <option value="" selected>구분</option>
			<option value="s">사업장</option>
			<option value="b">부서</option>
		</select>
		<input type="text" id="p_text" placeholder="내용을 입력해주세요.">
        </div>
		</div>

		<div style="position: absolute; top: 220px; left: 70px;">
			<script type="text/javascript">
				createIBSheet("mySheet", "1500px", "600px");
				selectSite();
			</script>
		</div>
    <input type="hidden" id="PemployeeCode">
	<input type="hidden" id="PemployeeName">
	<input type="hidden" id="PdepartmentName">
	<input type="hidden" id="PpositionName">
	<input type="hidden" id="PvacationremainDATE">

	</form>
</body>