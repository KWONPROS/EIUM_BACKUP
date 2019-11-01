<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function LoadPage(){
	mySheet.RemoveAll();
	//아이비시트 초기화
	var initSheet = {};

	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1,MergeSheet:msHeaderOnly};
	initSheet.HeaderMode = {Sort:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[
		{Header:"상태|상태",Type:"Status",Width:40,SaveName:"Status",Align:"Center"},
		{Header:"삭제|삭제",Type:"DelCheck",Width:50,SaveName:"Delete",Align:"Center"},
		{Header:"NO|NO",Type:"Text",Width:40,SaveName:"department_CODE",Align:"Center"},
		{Header:"지급회수|지급일자",Type:"Text",Width:120,SaveName:"site_CODE",Align:"Center"}, 
		{Header:"지급회수|동시발행",Type:"Text",Width:120,SaveName:"site_NAME",Align:"Center"}, 
		{Header:"지급회수|대상자 선정",Type:"Text",Width:120,SaveName:"sector_CODE",Align:"Center"}, 


		];
	IBS_InitSheet(mySheet,initSheet);

	

	mySheet2.RemoveAll();
	//아이비시트 초기화
	var initSheet2 = {};

	initSheet2.Cfg={SearchMode:smLazyLoad,ToolTip:1,MergeSheet:msHeaderOnly};
	initSheet2.HeaderMode = {Sort:1,ColResize:1,HeaderCheck:1};
	initSheet2.Cols=[
		{Header:"상태|상태|상태",Type:"Status",Width:40,SaveName:"Status",Align:"Center"},
		{Header:"삭제|삭제|삭제",Type:"DelCheck",Width:50,SaveName:"Delete",Align:"Center"},
		{Header:"NO|NO|NO",Type:"Text",Width:40,SaveName:"department_CODE",Align:"Center"},
		{Header:"지급회수|급여구분|급여구분",Type:"Text",Width:120,SaveName:"site_CODE",Align:"Center"}, 
		{Header:"지급회수|입사자상여계산|방법",Type:"Text",Width:120,SaveName:"site_NAME",Align:"Center"}, 
		{Header:"지급회수|입사자상여계산|기준일수",Type:"Text",Width:60,SaveName:"sector_CODE",Align:"Center"}, 
		{Header:"지급회수|퇴사자상여계산|방법",Type:"Text",Width:60,SaveName:"sector_CODE",Align:"Center"}, 
		{Header:"지급회수|퇴사자상여계산|기준일수",Type:"Text",Width:60,SaveName:"sector_CODE",Align:"Center"}, 


		];
	IBS_InitSheet(mySheet2,initSheet2);

	
	
	mySheet3.RemoveAll();
	//아이비시트 초기화
	var initSheet3 = {};

	initSheet3.Cfg={SearchMode:smLazyLoad,ToolTip:1,MergeSheet:msHeaderOnly};
	initSheet3.HeaderMode = {Sort:1,ColResize:1,HeaderCheck:1};
	initSheet3.Cols=[
		{Header:"상태|상태|상태",Type:"Status",Width:30,SaveName:"Status",Align:"Center"},
		{Header:"삭제|삭제|삭제",Type:"DelCheck",Width:30,SaveName:"Delete",Align:"Center"},
		{Header:"NO|NO|NO",Type:"Text",Width:30,SaveName:"department_CODE",Align:"Center"},
		{Header:"직급직종및급여형태|사업장|사업장",Type:"Text",Width:50,SaveName:"site_CODE",Align:"Center"}, 
		{Header:"직급직종및급여형태|직종|직종",Type:"Text",Width:50,SaveName:"site_NAME",Align:"Center"}, 
		{Header:"직급직종및급여형태|급여형태|급여형태",Type:"Text",Width:50,SaveName:"sector_CODE",Align:"Center"}, 
		{Header:"직급직종및급여형태|상여지급대상기간|시작일",Type:"Text",Width:50,SaveName:"sector_CODE",Align:"Center"}, 
		{Header:"직급직종및급여형태|상여지급대상기간|종료일",Type:"Text",Width:50,SaveName:"sector_CODE",Align:"Center"}, 
		{Header:"직급직종및급여형태|상여지급대상기간|일수",Type:"Text",Width:50,SaveName:"sector_CODE",Align:"Center"}, 


		];
	IBS_InitSheet(mySheet3,initSheet3);

	mySheet3.FitColWidth();
	mySheet.FitColWidth();
	mySheet2.FitColWidth();
	



}
function doAction(sAction){
	switch(sAction){
	case "search":      //조회

		var param = FormQueryStringEnc(document.frm);
		mySheet.DoSearch("${contextPath}/sm/p0003/searchList.do", param);

		break;
	case "reload":
		//조회 데이터 삭제
		mySheet.RemoveAll();
		break;
	case "save":
		mySheet.DoSave("${contextPath}/sm/p0003/saveData.do")
		var tempStr = mySheet.GetSaveString();
		alert("서버로 전달되는 문자열 확인 :"+tempStr);

		break;
	case "save2":
		//저장 문자열 추출
		alert("저장될 문자열:"+ JSON.stringify(mySheet.GetSaveJson()));
		break;				
	case "insert":
		
		//신규행 추가
		var row = mySheet.DataInsert(-1);
		var row2 = mySheet2.DataInsert(-1);
		break;

	}
}

</script>
</head>
<body onload="LoadPage()">
<div style="position:absolute; top:100px; left:20px;">
<script>
createIBSheet("mySheet", "700px", "250px");
</script>
</div>


<div style="position:absolute; top:100px; left:800px;">
<script>
createIBSheet("mySheet2", "700px", "250px");
</script>
</div>

<div style="position:absolute; top:400px; left:20px; ;">
<script>
createIBSheet("mySheet3", "1500px", "250px");
</script>
</div>
		
             <div class="rightbuttons">
                <a href="javascript:doAction('reload')" class="IBbutton" >초기화</a>
                <a href="javascript:doAction('insert')" class="IBbutton">추가</a>
                <a href="javascript:doAction('search')" class="IBbutton">조회</a>
                <a href="javascript:doAction('save')" class="IBbutton">저장</a>
                <a href="javascript:doAction('save2')" class="IBbutton">저장 JSON</a> 
            </div>
            
</body>
</html>