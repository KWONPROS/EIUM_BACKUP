<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발령구분팝업</title>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<script>

function LoadPage(){
	mySheet.RemoveAll();
	//아이비시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[

		{Header:"NO",Type:"Seq",Width:100,SaveName:"NO",Align:"Center"},
		{Header:"코드",Type:"Text",Width:100,SaveName:"hr_APPOINT_INDEX_CODE",Align:"Center"},
		{Header:"명",Type:"Text",Width:100,SaveName:"hr_APPOINT_INDEX_NAME",Align:"Center"},


		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);

	mySheet.SetColEditable(2,0);
	mySheet.DoSearch("${contextPath}/hm/p0022/appointCodeSearch_p01.do")


}

function mySheet_OnDblClick(Row, Col, Value) { 

	 var selectRowJson = mySheet.GetRowData(Row);
 	 var Ccode=selectRowJson.hr_APPOINT_INDEX_CODE;
	 var Cname=selectRowJson.hr_APPOINT_INDEX_NAME;

		 document.getElementById("Ccode").setAttribute('value', Ccode);
		 document.getElementById("Cname").setAttribute('value', Cname);
		 opener.document.getElementById("Pcode").value=document.getElementById("Ccode").value;
		 opener.document.getElementById("Pname").value=document.getElementById("Cname").value;
		 opener.setAppoint();


	    
	self.close(); 
	
	return false; //창을 닫는 경우에는 false를 리턴해 줘야 함. }
}
</script>

</head>
<body onload="LoadPage()">
<script>
createIBSheet("mySheet","100%","500px");
</script>
	<input type="hidden" id="Ccode">
	<input type="hidden" id="Cname">
</body>
</html>