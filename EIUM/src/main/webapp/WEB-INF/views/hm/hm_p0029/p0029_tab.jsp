<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style>

.title {
		width: 100%;
	color: #2C3E50;
	font-weight: bold;
	font-size: 20px;
	padding-left: 30px;
	padding-bottom: 10px;
	padding-top: 20px;
	border-top: thin solid #5E5E5E;
	border-bottom: thin dashed #5E5E5E;
	top: 50px;

}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"
	rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"
	type="text/javascript"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script language="javascript">
function PageLoad(){
	var tabBar = document.getElementById("tab"),
	contents = document.getElementById("tab_contents");
	createIBTab(tabBar,contents,"myTabs",{
		widthTabBar: "100%",
		heightContents:($(window).height()-200) + "px"
    });
	
	myTabs.setOptions({
		tabs:[{
			title:"교육",
			style:{
				icon:{

				},
				btnClose:false
			}
		},{
			title:"출장",
			style:{
				icon:{

				},
				btnClose:false
			}
		},{
			title:"자격/면허",
			style:{
				icon:{

				},
				btnClose:false
			}
		},{
			title:"어학시험",
			style:{
				icon:{

				},
				btnClose:false
			}
		}
		],
		contents:[{
			type:"iframe",	
			contents:"searchInit_TN.do"
		},{
			type:"iframe",	
			contents:"searchInit_BN.do"
		},{
			type:"iframe",	
			contents:"searchInit_LI.do"
		},{
			type:"iframe",	
			contents:"searchInit_LA.do"
		}
		]
	});
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.title {
	width: 100%;
	color: #2C3E50;
	font-weight: bold;
	font-size: 20px;
	padding-left: 30px;
	padding-bottom: 10px; 
	padding-top: 20px;
	border-top: thin solid #5E5E5E;
	border-bottom: thin dashed #5E5E5E;
	position: absolute;
	top: 50px;
}

.leftbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	left: 0px;
}

.rightbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	right: 0px;
}

.IBbutton {
	font-size: 13px;
	margin-left: 5px;
	background-color: #2B69A0;
	color: white;
	padding: 5px 15px;
	border-radius: 7px;
	text-decoration: none;
}

.IBbutton:hover {
	background-color: #2C3E50;
}

.left{
	position: relative;
	top: 110px;
	left: 30px;
	width: 1053px;
}

#searchBar {
	background: #EBEBEB;
	padding: 15px 125px;
	margin-bottom: 30px;
	border-radius: 5px;
	font-size: 12px;
	/*여기서 중간 텀띄우기*/
}

.kindofsearch{
	background: #5E5E5E;
	padding: 5px 5px;
	color: white;
	border-radius: 5px;
}
#tab, #tab_contents{
	position: relative;
	top: 80px;

}
.ui-datepicker{ font-size: 12px; width: 160px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
#searchBar img {vertical-align: middle; padding: 0px 5px 0px 2px; }
</style>
</head>
<body  onload='PageLoad()'>
	<div class="leftbuttons">
	<a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a
			href="javascript:doAction('search')" class="IBbutton">조회</a> 
	</div>	
	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 :
			사원정보현황
		</header>
	</div>
  	  <div class="left">
		<form name="frm">
			<div id="searchBar">
				<span class="kindofsearch">조회조건</span>
				<select id="searchList" onchange="itemChange()">
					<option selected>1. 사업장</option>
					<option>2. 부서</option>
				</select>
				<input type="text" id="Psite_name"><a href="javascript:showPopup2();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<span class="kindofsearch">재직구분</span>
				<span class="kindofsearch">직급</span>
			</div>
		</form>
	</div>			
       <div class="main_content">


             <div id="tab" class="ib-tab-tabs">
             </div>
             
             
             <div id="tab_contents" class="ib-tab-contents">
             </div>
        </div>
                <!--main contents-->

</body>
</html>