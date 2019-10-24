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
   initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
   initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
   initSheet.Cols=[
       {"Header":"No","Type":"Seq","Width":30,"Align":"Center"},
      {"Header":"사원코드","SaveName":"employee_CODE","Type":"Text","Width":100,"Align":"Center"},
      {"Header":"사원명","SaveName":"employee_NAME","Type":"Text","Width":100,"Align":"Center"}
      ];
   
   var initSheet2 = {};
   initSheet2.Cfg={SearchMode:smLazyLoad,ToolTip:1, Page:28};
   initSheet2.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
   initSheet2.Cols=[
       {"Header":"상태","SaveName":"sStatus","Type":"Status","Align":"Center","Width":100},
      {"Header":"메뉴","SaveName":"menu_NAME","Type":"Text","Width":130,"Align":"Center"},
      {"Header":"조회권한","SaveName":"access_SELECT","Type":"CheckBox","Width":100},
      {"Header":"추가권한","SaveName":"access_INSERT","Type":"CheckBox","Width":100},
      {"Header":"수정권한","SaveName":"access_UPDATE","Type":"CheckBox","Width":100},
      {"Header":"삭제권한","SaveName":"access_DELETE","Type":"CheckBox","Width":100},
      {"Header":"출력권한","SaveName":"access_PRINT","Type":"CheckBox","Width":100} 
      ];
   IBS_InitSheet(mySheet,initSheet);
   IBS_InitSheet(mySheet2,initSheet2);
   mySheet.SetEditableColorDiff(1);
   mySheet2.SetEditableColorDiff(1);
   mySheet.SetActionMenu("엑셀 파일 저장");
   mySheet2.SetColEditable(1,0);
   
}
function mySheet_OnSelectMenu(text,code){
   if(text=="엑셀 파일 저장"){
   
   }
}

  
function doAction(sAction){
   switch(sAction){
   case "search":      //조회
      mySheet.DoSearch("${contextPath}/sm/p0005search.do");
      mySheet2.DoSearch("${contextPath}/sm/p0005_01/search.do");
      break;
   case "reset":
      //조회 데이터 삭제
      mySheet.RemoveAll();
      mySheet2.RemoveAll();
      break;
   case "save":
     mySheet2.DoSave("${contextPath}/sm/p0005/saveData.do");
      var tempStr = mySheet2.GetSaveString();
      alert("서버로 전달되는 문자열 확인 :"+tempStr);
      break;
      
      //신규행 추가
      var row = mySheet.DataInsert();
      break;
   
   }
}
   </script>
</head>
<body onload="LoadPage()">
   <form name="frm">
   
   <button type="button" onclick="doAction('print')">인쇄</button>
   <button type="button" onclick="doAction('down')">엑셀</button>

   <button type="button" onclick="doAction('reset')">초기화</button>
   <button type="button" onclick="doAction('search')">조회</button>
   <button type="button" onclick="doAction('save')">저장</button>
   <hr>
   
   <h2>&nbsp;&nbsp;▶ 사용자권한설정</h2><br>

 &nbsp;&nbsp; 사업장 : <select name="sa_Name">
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
       
       <input type="text" placeholder="내용을 입력해주세요.">
<br><br>

<script type="text/javascript">
createIBSheet("mySheet", "100%", "100%");
</script>

<div style="position:absolute; top:171px; left:300px;">
<script>
createIBSheet("mySheet2", "1500px", "600px");
</script>
</div>

   </form>
</body>