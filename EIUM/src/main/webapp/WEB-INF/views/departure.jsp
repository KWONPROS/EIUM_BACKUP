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
function LoadPage(){
	var cfg={FrozenCol:3,MergeSheet:msHeaderOnly};
	mySheet.SetConfig(cfg);
	var header = [{Text:"상태|삭제|직책|부서코드|ID|이름|입사일|책임자|급여|COMM",Align:"Center"}];
	var info = {Sort:0,ColMove:1,ColResize:1};
	mySheet.InitHeaders(header,info);
	var cols=[
		{Type:"Status",Width:60,SaveName:"sStatus",Align:"Center"},
		{Type:"DelCheck",Width:60,SaveName:"sDelete",Align:"Center"},
		{Type:"Text",Width:100,SaveName:"JOB",Align:"Center"},
		{Type:"Text",Width:100,SaveName:"DEPTNO",Align:"Center"},
		{Type:"Text",Width:60,SaveName:"EMPNO",Align:"Center"}, 
		{Type:"Text",Width:150,SaveName:"ENAME",Align:""},
		{Type:"Date",Width:120,SaveName:"HIREDATE",Format:"Ymd",Align:"Center",EditLen :8},
		{Type:"Text",Width:120,SaveName:"MGR",Align:"Center"}, 
		{Type:"Int",Width:120,SaveName:"SAL",Align:"Right",Format:"NullInteger"},
		{Type:"Int",Width:60,SaveName:"COMM",Align:"Right",Format:"Integer"}
		];
	mySheet.InitColumns(cols);
}



</script>
</head>
<body>
<script type="text/javascript">
createIBSheet("mySheet","70%","70%");
LoadPage();
</script>
</body>
</html>