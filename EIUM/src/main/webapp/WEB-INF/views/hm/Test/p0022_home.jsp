<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<style type="text/css">

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
position: absolute;
top: 145px;
left: 50px;
}

.rightbuttons {
	margin-top: 50px;
	margin: 11px;
	position: absolute;
	right: 30px;
}
.right{
position: relative;
top: 150px;
left: 600px;
width: 700px;
background: #EDF0F5;
border-radius: 10px;
}

.right table{
font-size:13px;
font-weight:bold;
position: relative;
left: 40px;
padding: 20px;
}
.right table tr td:nth-child(1){
text-align:right;
}
.right table tr td:nth-child(2){
width: 20px;
height: 25px;
}
.right table tr td:nth-child(3) input{
width: 130px;
height: 20px;
padding-left: 10px;
margin-right:10px;
box-sizing: border-box;
border: 1px solid #CCCCCC;
border-radius: 2px;
} 
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


</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"
	rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"
	type="text/javascript"></script>


<script>

	function set_p02value(Ccode,Cname,site_NAME,department_NAME){
		
		$('input[name=hr_APPOINT_MASTER_CODE]').val(Ccode);
		$('input[name=employee_NAME]').val(Cname);
		$('input[name=department_NAME]').val(department_NAME);
		$('input[name=site_NAME]').val(site_NAME);
	
		
		
	}
	
	function popupValue(rowData){
		



	for(i=0;i<rowData.length;i++){
	
	mySheet2.DataInsert(-1);
	mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData[i]);

	
	}
		
	}
	
	
	function setAppoint(Pcode,Pname){

	mySheet.SetCellValue(mySheet.GetSelectRow(),5,Pcode);
	mySheet.SetCellValue(mySheet.GetSelectRow(),6,Pname);
		
	};


	function LoadPage() {
		
		//시트1
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3}
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
				{Header:"상태",Type:"Status",SaveName:"Status", Align:"Center"},
				{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK"},
				{Header:"NO",Type:"Seq",SaveName:"NO", Align:"Center"},
				{Header:"발령호수",Type:"Text",SaveName:"hr_APPOINT_NUMBER",Align:"Center",Width:100},
				{Header:"제목",Type:"Text",SaveName:"hr_APPOINT_TITLE",Align:"Center",Width:100},	
				{Header:"발령코드",Type:"Text",SaveName:"hr_APPOINT_INDEX_CODE",Align:"Center",Width:100,Hidden:1},			
				{Header:"발령구분",Type:"Popup",SaveName:"hr_APPOINT_INDEX_NAME",Align:"Center",Width:100,UpdateEdit:0},			
				{Header:"발령일자",Type:"Date",SaveName:"hr_APPOINT_DATE",Format:"Ymd",Width:100},
				{Header:"발령자코드",Type:"Text",SaveName:"hr_APPOINT_MASTER_CODE",Align:"Center",Hidden:1},
				{Header:"발령자이름",Type:"Text",SaveName:"employee_NAME",Align:"Center",Hidden:1},
				{Header:"발신사업장",Type:"Text",SaveName:"site_NAME",Align:"Center",Hidden:1},
				{Header:"발신부서",Type:"Text",SaveName:"department_NAME",Align:"Center",Hidden:1},
				{Header:"인사발령고유번호",Type:"Text",SaveName:"HR_APPOINT_CODE",Align:"Center",Hidden:1},
				
				];
			IBS_InitSheet(mySheet, initSheet);
			mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
			mySheet.DoSearch("${contextPath}/hm/p0022/appointList.do");
			

			
			
		    //시트2
			
			mySheet2.RemoveAll();
			//아이비시트 초기화
			var initSheet2 = {};
			initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3}
			initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
			initSheet2.Cols = [
					{Header:"상태",Type:"Status",SaveName:"Status", Align:"Center"},
					{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK"},
					{Header:"사원코드",Type:"Popup",SaveName:"employee_CODE",Align:"Center",Width:100},
					{Header:"사원명",Type:"Text",SaveName:"employee_NAME",Align:"Center",InsertEdit:0,Width:100},			
					{Header:"부서",Type:"Text",SaveName:"department_NAME",Align:"Center",InsertEdit:0,Width:100},			
					{Header:"직책",Type:"Text",SaveName:"duty_NAME",Align:"Center",InsertEdit:0,Width:100}	,

					];
				IBS_InitSheet(mySheet2,initSheet2);
			

	
				

				
				mySheet2.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분

	}
	
	
	
	
	function doAction(sAction){
	switch(sAction){
	case "search":
		//조회 데이터 삭제
	mySheet.DoSearch("${contextPath}/hm/p0022/appointList.do");
		break;
	case "reload":
		//조회 데이터 삭제
		mySheet.RemoveAll();
		mySheet2.RemoveAll();
		break;
	case "save":
		mySheet.SetCellValue($('input[name=myRow]').val(),6,$('input[name=hr_APPOINT_INDEX_NAME]').val());
		mySheet.SetCellValue($('input[name=myRow]').val(),8,$('input[name=hr_APPOINT_MASTER_CODE]').val());
		mySheet.SetCellValue($('input[name=myRow]').val(),9,$('input[name=employee_NAME]').val());
		mySheet.SetCellValue($('input[name=myRow]').val(),10,$('input[name=site_NAME]').val());
		mySheet.SetCellValue($('input[name=myRow]').val(),11,$('input[name=department_NAME]').val());

		mySheet.DoSave("${contextPath}/hm/p0022/saveData.do")
		mySheet2.DoSave("${contextPath}/hm/p0022/saveData2.do")
		break;
			
	case "insert1":
		
		//신규행 추가
		var row = mySheet.DataInsert(-1);
		break;
	case "insert2":
		
		//신규행 추가
		var row = mySheet2.DataInsert(-1);
		break;	
	case "reload":
		//조회 데이터 삭제
		mySheet.RemoveAll();

		break;
	
	}
	
}

	function mySheet_OnPopupClick(Row,Col){
		var status = mySheet.GetCellValue(Row,0);
		if(Col=="6"&&status=="I"){	
		window.open("${contextPath}/hm/p0022/appointCodeList_p01.do", "a", "width=500, height=700, left=100, top=50"); 
		}
		
	}
	
	function mySheet_OnClick(Row, Col){

console.log(Row,Col);
		if(Row!=0){
			$('input[name=myRow]').val(Row);
			$('input[name=hr_APPOINT_INDEX_NAME]').val(mySheet.GetCellValue(Row,6));
			$('input[name=hr_APPOINT_MASTER_CODE]').val(mySheet.GetCellValue(Row,8));
		    $('input[name=employee_NAME]').val(mySheet.GetCellValue(Row,9));
		    $('input[name=site_NAME]').val(mySheet.GetCellValue(Row,10));
		    $('input[name=department_NAME]').val(mySheet.GetCellValue(Row,11));

		    
			var param ="param="+mySheet.GetCellValue(Row,3);
			console.log("파람=="+param);
			
			mySheet2.DoSearch("${contextPath}/hm/p0022/homeEmployeeSearch.do",param);

		}
	}


		
/* 		function mySheet_OnDblClick(Row,Col,Value){
			var status=mySheet.GetCellValue(Row,0);
			row=Row;
			col=Col;

			if(Col=="6"&&status=="I"){	
			window.open("${contextPath}/hm/p0022/appointCodeList_p01.do", "a", "width=500, height=700, left=100, top=50"); 
			}
	
	} */
		
		function mySheet_OnChange(Row,Col){

			if(Col==6){
				
				$('input[name=hr_APPOINT_INDEX_NAME]').val(mySheet.GetCellValue(Row,6));
					
				}
			}
		function goPopup(){
			window.open("${contextPath}/hm/p0022/home_p02Init.do", "a", "width=500, height=700, left=100, top=50");
	
		}
		function emplyoeeSearch_Popup(){
			window.open("${contextPath}/hm/p0022/home_p03Init.do", "a", "width=500, height=700, left=100, top=50");
			
		}
		
</script>
<meta charset="UTF-8">
<title>인사발령등록</title>
</head>
<body onload="LoadPage()">

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 :
			인사발령등록
		</header>
	</div>
	
	 <div class="rightbuttons">
	  <a href="javascript:doAction('insert1')" class="IBbutton">발령추가</a>
	  <a href="javascript:emplyoeeSearch_Popup();" class="IBbutton">사원추가</a>
	  <a href="javascript:doAction('reload')"  class="IBbutton">초기화</a>
	  <a href="javascript:doAction('search')"  class="IBbutton">조회</a>
	  <a href="javascript:doAction('save')" class="IBbutton">저장</a>
	  
	</div>
  
	<div class="left">
		<script>
			createIBSheet("mySheet", "1500px", "200px");
			
		</script>
	</div>

		
	<form name="form" id="form" method="post">
	
	<div class="right">
		<table>
			<tr>
				<td>발령구분</td>
				<td><input type="hidden" name="myRow"></td>
				<td><input type="text" name="hr_APPOINT_INDEX_NAME" ></td>
			</tr>
			<tr>
				<td>발령자</td>
				<td></td>
				<td><input type="text" name="hr_APPOINT_MASTER_CODE" ><a href="javascript:goPopup();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a><input type="text" name="employee_NAME" ></td>
			</tr>
			<tr>
				<td>발신사업장</td>
				<td></td>
				<td><input type="text" name="site_NAME" ></td>
			</tr>
			<tr>
				<td>발신부서</td>
				<td></td>
				<td><input type="text" name="department_NAME" ></td>
			</tr>
			
		</table>	
		<script>
	createIBSheet("mySheet2","1500px","200px");
	</script>	
	</div>
	</form>


	<input type="hidden" id="Pcode">
	<input type="hidden" id="Pname">
	<input type="hidden" id="PsiteName">
	<input type="hidden" id="PdepartmentName">
	
	<input type="hidden" id="Pcode2">
	<input type="hidden" id="Pname2">
</body>
</html>