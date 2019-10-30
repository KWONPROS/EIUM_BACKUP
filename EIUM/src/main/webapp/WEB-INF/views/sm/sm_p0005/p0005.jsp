<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

<script type="text/javascript">
var pageheightoffset = 200; //시트높이 계산용

//sheet 기본설정
function LoadPage(){
	
   mySheet.RemoveAll();
   mySheet2.RemoveAll();
   //아이비시트 초기화
   var initSheet = {};
   initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1,MouseHoverMode:2};
   initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
   initSheet.Cols=[
	    {"Header":"상태","SaveName":"sStatus","Type":"Status","Align":"Center","Width":50},
	    {"Header":"삭제","SaveName":"DEL_CHK","Type":"DelCheck"},
		{"Header":"권한코드","SaveName":"authority_CODE","Type":"Text","Width":100,"Align":"Center","UpdateEdit":0},
		{"Header":"권한명","SaveName":"authority_NAME","Type":"Text","Width":100,"Align":"Center"}
      ];
   
   var initSheet2 = {};
   initSheet2.Cfg={SearchMode:smLazyLoad, ToolTip:1,  MergeSheet:msPrevColumnMerge + msHeaderOnly};
   initSheet2.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
   initSheet2.Cols=[
	    {"Header":"상태","SaveName":"sStatus","Type":"Status","Align":"Center","Width":100,"ColMerge":0},
		{"Header":"사용가능한메뉴","SaveName":"access_GRANT","Type":"CheckBox","Width":50,"Align":"Center","ColMerge":0},
		{"Header":"사용가능한메뉴","SaveName":"menu_NAME","Type":"Text","Width":130,"Align":"Center","ColMerge":0},
		{"Header":"조회권한","SaveName":"access_RANGE","Type":"Text","Width":100,"ColMerge":0},
		{"Header":"추가","SaveName":"access_INSERT","Type":"CheckBox","Width":100,"ColMerge":0},
		{"Header":"수정","SaveName":"access_UPDATE","Type":"CheckBox","Width":100,"ColMerge":0},
		{"Header":"삭제","SaveName":"access_DELETE","Type":"CheckBox","Width":100,"ColMerge":0},
		{"Header":"출력","SaveName":"access_PRINT","Type":"CheckBox","Width":100,"ColMerge":0} 
      ];
   IBS_InitSheet(mySheet,initSheet);
   IBS_InitSheet(mySheet2,initSheet2);
   mySheet.SetEditableColorDiff(1);
   mySheet2.SetEditableColorDiff(1);
   mySheet.SetActionMenu("엑셀 파일 저장");
   mySheet2.SetColEditable(2,0);
   mySheet.SetSelectionMode(1);
}

function mySheet_OnClick(Row){
    x = "x=" + mySheet.GetCellValue(Row, 2);
	mySheet2.DoSearch("${contextPath}/sm/p0005_01/search.do", x);
}
  
function doAction(sAction){
   switch(sAction){
   case "search":
      mySheet.DoSearch("${contextPath}/sm/p0005/searchList.do");
      break;
   case "reset":
      mySheet.RemoveAll();
      mySheet2.RemoveAll();
      break;
   case "save":
	  mySheet.DoSave("${contextPath}/sm/p0005/saveData.do", x);
	  mySheet2.DoSave("${contextPath}/sm/p0005_01/saveData.do", x);
	  mySheet2.RemoveAll();
      break;

   case "insert":
      var row = mySheet.DataInsert();
      break;
   
   }
  
   
}
	</script>
	<script>

	
	</script>
</head>
<body onload="LoadPage()">
	<form name="frm">
	
	<button type="button" onclick="doAction('print')">인쇄</button>
	<button type="button" onclick="doAction('down')">엑셀</button>

	<button type="button" onclick="doAction('reset')">초기화</button>
	<button type="button" onclick="doAction('search')">조회</button>
	<button type="button" onclick="doAction('insert')">추가</button>
	<button type="button" onclick="doAction('save')">저장</button>
	<hr>
	
	<h2>&nbsp;&nbsp;▶ 권한관리</h2><br>

<!--  &nbsp;&nbsp; 사업장 : <select name="sa_Name">
		  <option>나의 사업장</option>
		  <option>너의 사업장</option>
		  <option>우리의 사업장</option>
		</select>
		
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 부서 : <select name="sa_Dept">
		  <option>인사</option>
		  <option>아싸</option>
		  <option>안사</option>
		</select>
		
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <select name="sa_Select">
          <option>사원명</option>
          <option>사원코드</option>
       </select>
       
       <input type="text" placeholder="내용을 입력해주세요.">  -->

<div style="position:absolute; top:100px; left:20px;">
<script type="text/javascript">
createIBSheet("mySheet", "1500px", "600px");
</script>
</div>

<div style="position:absolute; top:100px; left:400px;">
<script>
createIBSheet("mySheet2", "1500px", "600px");
</script>
</div>

	</form>
</body>