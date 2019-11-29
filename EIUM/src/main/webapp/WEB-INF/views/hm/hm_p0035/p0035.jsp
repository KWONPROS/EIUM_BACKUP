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
		initSheet.Cols = [ { "Header" : "사원코드", "SaveName" : "employee_CODE", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "사원명", "SaveName" : "employee_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "부서", "SaveName" : "department_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "직책", "SaveName" : "duty_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "입사일", "SaveName" : "employee_JOIN_DATE", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "직종", "SaveName" : "job_CLASS_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "급여형태", "SaveName" : "pay_TYPE_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "지급일자", "SaveName" : "payment_DATE", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "연봉", "SaveName" : "year", "Type" : "Text", "Width" : 100, "Align" : "Center", "CalcLogic" : "|9|*12" },
			               { "Header" : "월급", "SaveName" : "payment_RECEIPT_PRICE", "Type" : "Text", "Width" : 100, "Align" : "Center" },
			               { "Header" : "일급", "SaveName" : "month", "Type" : "Text", "Width" : 100, "Align" : "Center", "CalcLogic" : "|9|*12" },
			               { "Header" : "시급","SaveName" : "time","Type" : "Text","Width" : 100,"Align" : "Center" }
		                 ];

		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditableColorDiff(1);
		mySheet.SetActionMenu("엑셀 파일 저장");
		mySheet.SetSelectionMode(1);
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			var param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/hm/p0035/searchList.do", param);
			break;
		case "reset":
			mySheet.RemoveAll();
			$("select#SiteList option[name='1']").remove();
			$("select#DeptList option[class='1']").remove();
			$('#SiteList').val(selectSite());
			$('#Employee_Select').val('');
			$('#p_text').val('');
			$('#p_text').attr('placeholder', "내용을 입력해주세요.");
			break;

		}

	}

</script>


<script>
	function selectSite() {

		$.ajax({

					url : "${contextPath}/hm/p0035/SiteList.do",//목록을 조회 할 url

					type : "POST",

					dataType : "JSON",

					success : function(data) {

						for (var i = 0; i < data['Data'].length; i++) {
							
							

							var option = "<option name='1' value='" + data['Data'][i].site_NAME + "'>"
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

					url : "${contextPath}/hm/p0035/DeptList.do",//목록을 조회 할 url

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
	width: 800px;
}
	
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
		</div>

		<div class="title"> 
        <header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 : 책정임금현황</header>
        </div>
        
        <div class="left">
        <div id="searchBar">
            &nbsp;&nbsp; 사업장 : <select id="SiteList" onchange="selectDept()">
			<option value="" selected>전체</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 부서 : <select id="DeptList">
			<option value="" selected>전체</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <select id="Employee_Select">
		    <option value="" selected>구분</option>
			<option value="employee_name">사원명</option>
			<option value="employee_code">사원코드</option>
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

	</form>
</body>