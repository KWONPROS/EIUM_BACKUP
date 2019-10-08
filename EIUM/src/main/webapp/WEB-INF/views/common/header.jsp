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
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
.logo {
	width: auto;
	height: 80px;
	
}
 

.box{
float: left;
}

.container-1{
  width: 170px;
  vertical-align: middle;
  white-space: nowrap;
  position: relative;
}
.container-1 input#search{
  width: 170px;
  height: 30px;
  background: #ffffff;
  border: none;
  font-size: 10pt;
  color: #63717f;
  padding-left: 35px;
  border-radius: 5px;
}

.container-1 .icon{
  position: absolute;
  margin-left: -160px;
  margin-top: 3px;
  z-index: 1;
  color: #4f5b66;
}

</style>
<meta charset="UTF-8">
<title>헤더</title>
</head>
<body>
	<div class="box">
		<a href="${contextPath}/main.do"> <img class="logo"
			src="${contextPath}/resources/image/EIUM_banner.png" />
		</a>
		<div class="container-1">
			<input type="search" id="search" placeholder="찾을 메뉴 입력..." /><span
				class="icon"><i class="fa fa-search"></i></span>
		</div>
	</div>
	<table border=1 width="100%">
		<tr>
			<td>
				<h1>
					<font size=30>스프링실습 홈페이지!!</font>
				</h1>
			</td>
	
			<td>
				<h1>
					<font size=30>스프링실습 홈페이지!!</font>
				</h1>
			</td>

			<td>
				<!-- <a href="#"><h3>로그인</h3></a> --> <c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
						<h3>환영합니다. ${member.name }님!</h3>
						<a href="${contextPath}/member/logout.do"></a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>


</body>
</html>