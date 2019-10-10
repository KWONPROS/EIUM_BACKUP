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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.logo {
	width: auto;
	height: 80px;
}

.box {
	background-color: #212121;
	padding: 10px;
}

.container-1 {
	width: 170px;
	vertical-align: middle;
	white-space: nowrap;
	position: relative;
}

.container-1 input#search {
	width: 170px;
	height: 30px;
	background: #ffffff;
	border: none;
	font-size: 10pt;
	color: #63717f;
	padding-left: 35px;
	border-radius: 5px;
}

.container-1 .icon {
	position: absolute;
	margin-left: -160px;
	margin-top: 3px;
	z-index: 1;
}

.icon {
	color: #4f5b66;
}

.no-underline {
	text-decoration: none;
}
</style>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
</head>
<body>
	<div class="box">
		<a href="${contextPath}/main.do"> <img class="logo"
			src="${contextPath}/resources/image/EIUM_banner.png" />
		</a>
		<div class="container-1">
			<input type="search" id="search" placeholder="찾을 메뉴 입력..." /> <span
				class="icon"><i class="fa fa-search"></i></span>
		</div>
	</div>
	<h1>사이드 메뉴</h1>
	<h1>
		<a href="${contextPath}/member/listMembers.do" class="no-underline">회원관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"   
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		<a href="#" class="no-underline">게시판관리</a><br> <a href="#"
			class="no-underline">상품관리</a><br>
		
	</h1>
</body>
</html>