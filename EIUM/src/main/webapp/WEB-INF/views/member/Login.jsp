<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.login-container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.login-form {
	background-color: white;
	padding: 5px;
	padding-bottom: 65px;
	height: auto;
	width: 400px;
	height: auto;
	width: 400px;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form h3 {
	text-align: left;
	color: #333;
}

.login-form .logo {
	width: 40px;
	height: auto;
}

.login-container form {
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 5%;
	padding-bottom: 5%;
}

.login-form .btnSubmit {
	font-weight: 600;
	color: #fff;
	background-color: #0062cc;
}

.login-form .form-control {
	border: 0px;
	width: 315px;
	height: 30px;
	padding-left: 10px;
	border-bottom: #0062cc 1px solid;
	margin-bottom: 5px;
	outline:none;
}

.login-form .Forget {
	font-size: 12px;
	color: #0062cc;
	font-weight: 600;
	padding-left: 20px;
	text-decoration: none;
}
.login-form .Forget:hover {
	text-decoration: underline;
}

.btnSubmit {
	float: right;
	width: 25%;
	margin-top: 30px;
	padding: 1.5%;
	border: none;
	cursor: pointer;
	padding: 1.5%;
}
.btnSubmit:hover{
	background: #045FB4;
}

#video {
	position: absolute;
	top: 0px;
	left: 0px;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1;
	overflow: hidden;
}
</style>

<meta charset="UTF-8">
<title>Welcome EIUM</title>
</head>
<body>
	<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
		<source src="${contextPath}/resources/image/init_background.mp4">
	</video>
	<div class="login-container">
			<div class="login-form">
				<form  name="frmLogin" method="post"  action="${contextPath}/member/loginDo.do">
				<h3><img class="logo" alt="logo" src="${contextPath}/resources/image/EIUM_logo.png"> EIUM</h3>
					<h3>로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" value="" /><br>
						<input type="password" class="form-control" placeholder="Password" value="" /><br> 
						<a href="#" class="Forget">ID 찾기</a><br> 
						<a href="#" class="Forget">비밀번호 찾기</a>
						<input type="submit" class="btnSubmit" value="다음" />
					</div>
				</form>
			</div>
	</div>
</body>
</html>