<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.currentInfo {
	padding: 0px 0px 95px 10px;
	color: #212121;
	font-size: 12px;
}
.currentInfo #headerinfo  {
	margin-right: 15px;
}
.currentInfo #headerinfo b {
	font-weight: normal;
}
.homelogin {
	padding: 0px 0px 95px 10px;
	color: #212121;
	font-size: 15px;
	position : absolute;
	top: 5px;
	right: 15px;
	
}
.homelogin #headerinfo {
	margin-right: 15px;
	margin-left: 15px;
}
.homelogin A:link {
	color:#212121; 	
	text-decoration: none;
}

.homelogin A:visited {
	color:#212121; 	
	text-decoration: none;
}

.homelogin A:active {
	bacolor: #FF6000;
	text-decoration: none;
}

.homelogin A:hover {
	color: #FF6000;
	text-decoration: none;
}

</style>
<meta charset="UTF-8">
<title>헤더</title>
</head>
<body>

	<div class="currentInfo">
		<span id="headerinfo" class="user">사용자 : OOO</span> <span id="headerinfo" class="company">회사 :
			(주)00전자</span> <span id="headerinfo" class="logindate">접속일시 : <b id="systemClock"></b>
		</span>
	</div>

	<div class="homelogin">
		<a href="#"><span id="headerinfo" class="icon"><i class="fa fa-home">
					Home</i></span></a> <a href="#"><span id="headerinfo" class="icon"><i class="fa fa-share-square-o"> Logout</i></span></a>
	</div>

</body>
</html>