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
<script type="text/javascript">
	function printClock() {
		var clock = document.getElementById("clock"); // 출력할 장소 선택
		var currentDate = new Date(); // 현재시간
		var dd = currentDate.getDate();
		var mm = (currentDate.getMonth() + 1);

		if (dd < 10) {
			dd = '0' + dd;
		}
		if (mm < 10) {
			mm = '0' + mm;
		}
		var calendar = currentDate.getFullYear() + "-" + mm + "-" + dd; // 현재 날짜
		var amPm = 'AM'; // 초기값 AM
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);
		if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
			amPm = 'PM';
			currentHours = addZeros(currentHours - 12, 2);
		}
		clock.innerHTML = calendar + " " + currentHours + ":" + currentMinute
				+ ":" + currentSeconds + " " + amPm; //날짜를 출력해 줌

		setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
	}

	function addZeros(num, digit) { // 자릿수 맞춰주기
		var zero = '';
		num = num.toString();
		if (num.length < digit) {
			for (i = 0; i < digit - num.length; i++) {
				zero += '0';
			}
		}
		return zero + num;
	}
</script>


<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
.logo {
	width: auto;
	height: 80px;
	
}
 
.box{
float: left;
background-color: #212121;
padding: 10px;
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
.currentInfo{
float:left;  
padding:0px 0px 95px 10px;
color: #212121;
}
.currentInfo{
float:left;  
padding:0px 0px 95px 10px;
color: #212121;
font-size: 12px;   
}
.currentInfo span{
margin-right: 15px;
font-weight: normal;
}
.currentInfo span b{
font-weight: normal;
}      

</style>
<meta charset="UTF-8">
<title>헤더</title>
</head>
<body onload="printClock()">

	<table border=1 width="100%">
		<tr>
			<td rowspan="2" width="1px">
				<div class="box">
					<a href="${contextPath}/main.do"> <img class="logo"
						src="${contextPath}/resources/image/EIUM_banner.png" />
					</a>
					<div class="container-1">
						<input type="search" id="search" placeholder="찾을 메뉴 입력..." /><span
							class="icon"><i class="fa fa-search"></i></span>
					</div>
				</div>
			</td>

			<td>
				<div class="currentInfo">
					<span class="user">사용자 : OOO</span> <span class="company">회사
						: (주)00전자</span> <span class="logindate">접속일시 : <b id="clock"></b>
					</span>
				</div>

			</td>
	
			<td>
				<a href="#"><h3>로그인</h3></a>
				
				<%-- <c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
						<h3>환영합니다. ${member.name }님!</h3>
						<a href="${contextPath}/member/logout.do"></a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
					</c:otherwise>
				</c:choose> --%>
			</td>
		</tr>
	</table>


</body>
</html>