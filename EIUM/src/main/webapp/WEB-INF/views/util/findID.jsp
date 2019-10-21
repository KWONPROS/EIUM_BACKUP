<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID찾기</title>
<style>
label {
	margin: 0 10px;
}

input[type=text] {
	width: 40%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 3px solid #a9a9a9;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	outline: none;
}

input[type=text]:focus {
	border: 3px solid #0062cc;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #0062cc;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 20px;
	padding: 15px;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
</head>
<body>
	<h1>ID찾기</h1>
	<form>
		<label for="fnumber">사원번호</label> <br>
		<input type="text" id="fname" placeholder="사원번호" value=""><br>
		<label for="femail">이메일</label><br> <input type="text"
			id="femail" placeholder="이메일" value="">
	</form>
	<button class="button" style="vertical-align: middle">
		<span>다음 </span>
	</button>
</body>
</html>