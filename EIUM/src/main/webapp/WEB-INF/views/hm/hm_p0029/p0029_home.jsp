<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css" rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js" type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js" type="text/javascript"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		
		
		
		
		
		

		//탭
		createIBTab($('#ib_sheetTab')[0], $('#ib_sheetContents')[0], 'sheetTab', {
		    themes: {
		        tabs: "flat_blue",
		        contents: "flat_blue",
		        contextMenu: "flat_blue"
		    },
		    allowCloseBTN: false
		});
		
		
		
		
		//달력 API
		$(function() {
		    $( ".Datepicker" ).datepicker({
		    	changeMonth: true,
		    	changeYear: true,
		    	dateFormat: "yy-mm-dd",
		    	showOn: "both", 
		    	yearRange: "-100:+0",
		    	constrainInput: false,
		    	showMonthAfterYear: true,
		        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
		        buttonImageOnly: true , 
		         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		  });
		});
		
		
	}
	
	//사원검색 조건
	function searchCondition(){
		 var cond =document.getElementById("condition").value;
		 
		 mySheet.DoSearch('${contextPath}/hm/p0029/searchList.do','condition='+cond);
	   }
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			mySheet.DoSearch("${contextPath}/hm/p0029/searchList.do");		
			break;

		 case "reload": //초기화
	            mySheet.RemoveAll();
	            break;
	         case "save": // 저장
	         
	               
	            sendData();
	            
	           
	            mySheet.DoSave("${contextPath}/hm/p0029/saveData.do");
	            break;      
		}
	}

	//로우 클릭시
	function mySheet_OnClick(Row, Col) {
		if (Row != 0) {

		}

	}

	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
	

	   
	 //분류코드 팝업   
	   function findPopup(tablename){
	      var pop = window.open("findPopup.do?command="+tablename,"findPopup","width=342,height=520,resizable = no, scrollbars = no"); 

	   }
	   function findPopup(tablename, index){
	      var pop = window.open("findPopup.do?command="+tablename+"&index="+index,"findPopup","width=342,height=520,resizable = no, scrollbars = no"); 

	   }
	  

	 //조회조건 : 1. 사업장 or 2. 부서 선택시
	 function itemChange(){
		 var selectItem = $("#searchList").val();
		 alert(selectItem);
		 var changeItem;
		 
		 if(selectItem == "1. 사업장"){
		 }
		 
	 }  
	
</script>
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

.ui-datepicker{ font-size: 12px; width: 160px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
#searchBar img {vertical-align: middle; padding: 0px 5px 0px 2px; }
</style>
</head>
<body onload="LoadPage()">
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
	<script type="text/javascript">
				createIBSheet("mySheet", "1500px", "600px");
	</script>
		

		
	



</body>

</html>