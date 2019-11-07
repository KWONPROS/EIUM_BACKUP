<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사등록</title>
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
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0}
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
				{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
				{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
				{Header:"교육코드",Type:"Text",SaveName:"employee_TRAINING_CODE",MinWidth:80, Align:"Center"},
				{Header:"교육명",Type:"Text",SaveName:"employee_TRAINING_NAME",MinWidth:170, Align:"Center"},			
				{Header:"시작일",Type:"Text",SaveName:"employee_TRAINING_START_DATE",MinWidth:80, Edit: 1, Align:"Center",Format:"Ymd"},			
				{Header:"종료일",Type:"Text",SaveName:"employee_TRAINING_END_DATE",MinWidth:80,Format:"Ymd"},			
				{Header:"교육일수",Type:"Text",SaveName:"employee_TRAINING_DATE_COUNT",  Hidden:1},
				{Header:"교육목적",Type:"Text",SaveName:"employee_TRAINING_GOAL",Hidden:1},
				{Header:"교육장소",Type:"Text",SaveName:"employee_TRAINING_LOCATION",Hidden:1},			
				{Header:"담당강사",Type:"Text",SaveName:"employee_TRAINING_TEACHER", Hidden:1},			
				{Header:"교육기관",Type:"Text",SaveName:"employee_TRAINING_INSITUTION" ,Hidden:1},			
				{Header:"교육시간",Type:"Text",SaveName:"employee_TRAINING_TIME",Hidden:1},			
				{Header:"대상인원",Type:"Text",SaveName:"employee_TRAINING_PEOPLE", Hidden:1},			
				{Header:"사내외구분",Type:"Text",SaveName:"employee_TRAINING_IN_OUT" ,Hidden:1,},			

				];
			IBS_InitSheet(mySheet, initSheet);
			
			mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
			/* mySheet.SetSheetHeight(1000); */
			
			//탭

		}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction){
		case "search": // 조회
			mySheet.DoSearch("${contextPath}/hm/p0018/searchList.do");
			//mySheet.DoSearch("transaction_data2.json");
			break;
		case "reload": //초기화
			//조회 데이터 삭제
			mySheet.RemoveAll();
			break;
		case "save": //저장
		
			mySheet.SetCellValue($('input[name=myRow]').val(),6,$('input[name=employee_TRAINING_DATE_COUNT]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),7,$('input[name=employee_TRAINING_GOAL]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),8,$('input[name=employee_TRAINING_LOCATION]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),9,$('input[name=employee_TRAINING_TEACHER]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),10,$('input[name=employee_TRAINING_INSITUTION]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),11,$('input[name=employee_TRAINING_TIME]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),12,$('input[name=employee_TRAINING_PEOPLE]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),13,$('select[name=employee_TRAINING_IN_OUT]').val());

			var tempStr = mySheet.GetSaveString();
			alert("서버로 전달되는 문자열 확인 : " + tempStr);
			mySheet.DoSave("${contextPath}/hm/p0018/saveData.do");		
			break;
		case "save2": //저장 JSON
		//저장 문자열 추출
			alert("저장될 문자열:" + JSON.stringify(mySheet.GetSaveJson()));
			break;
		case "insert": //신규행 추가
			var row = mySheet.DataInsert(-1);
			break;
		}
	}
	
	//로우 클릭시
	function mySheet_OnClick(Row, Col){
		//alert("row"+Row+"col"+Col);
console.log(Row,Col);
		if(Row!=0){
			$('input[name=myRow]').val(Row);
			$('input[name=employee_TRAINING_DATE_COUNT]').val(mySheet.GetCellValue(Row,6));
			$('input[name=employee_TRAINING_GOAL]').val(mySheet.GetCellValue(Row,7));
		    $('input[name=employee_TRAINING_LOCATION]').val(mySheet.GetCellValue(Row,8));
		    $('input[name=employee_TRAINING_TEACHER]').val(mySheet.GetCellValue(Row,9));
		    $('input[name=employee_TRAINING_INSITUTION]').val(mySheet.GetCellValue(Row,10));
		    $('input[name=employee_TRAINING_TIME]').val(mySheet.GetCellValue(Row,11));
		    $('input[name=employee_TRAINING_PEOPLE]').val(mySheet.GetCellValue(Row,12));
		    $('select[name=employee_TRAINING_IN_OUT]').val(mySheet.GetCellValue(Row,13));
		
		    sd=mySheet.GetCellValue(Row,4);
		    ed=mySheet.GetCellValue(Row,5);



	}
	}
	
	function mySheet_OnChange(Row,Col){
		var sd=mySheet.GetCellValue(Row,Col-1);
	    var ed=mySheet.GetCellValue(Row,Col);
		
		if(Col==5){
			
		function x(sd,ed){
			    var stDate = new Date(sd.substring(0,4),sd.substring(4,6),sd.substring(6,8)) ;
			    var endDate = new Date(ed.substring(0,4),ed.substring(4,6),ed.substring(6,8)) ;
			    var btMs = endDate.getTime() - stDate.getTime() ;
			    btDay = btMs / (1000*60*60*24)+1 ;
			 	return btDay;
				
			}
		
		x(sd,ed);
		
			
			$('input[name=employee_TRAINING_DATE_COUNT]').val(btDay);
			
			
		}
		
	}
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}
	
	
	
</script>

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
	margin: 20px;
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

</head>
<body onload="LoadPage()">



    <div class="rightbuttons">
	  <a href="javascript:doAction('reload')"  class="IBbutton">초기화</a>
	  <a href="javascript:doAction('insert')"  class="IBbutton">추가</a>
	  <a href="javascript:doAction('search')" class="IBbutton">조회</a>
	  <a href="javascript:doAction('save')" class="IBbutton">저장</a>
	  <a href="javascript:doAction('save2')" class="IBbutton">저장 JSON</a> 
	</div>

	<div class="clear hidden"></div>
	<div class="left">
	<div class="ib_product">
		<script>
			//IBSheet 객체 생성 (객체 id, 너비, 높이)
			createIBSheet("mySheet", "100%", "304px");
		</script>
	</div>
	</div>
	

  
	
	<form name="form" id="form" method="post">
	
	<div class="right">
		<table>
			<tr>
			
				<td>교육일수</td>
				<td><input type="hidden" name="myRow"></td>
				<td><input type="text" name="employee_TRAINING_DATE_COUNT" >일</td>
			</tr>
			<tr>
				<td>교육목적</td>
				<td></td>
				<td><input type="text" name="employee_TRAINING_GOAL" ></td>
			</tr>
			<tr>
				<td>교육장소</td>
				<td></td>
				<td><input type="text" name="employee_TRAINING_LOCATION" ></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td></td>
				<td><input type="text" name=employee_TRAINING_TEACHER ></td>
			</tr>
			<tr>
				<td>교육기관</td>
				<td></td>
				<td><input type="text" name="employee_TRAINING_INSITUTION" ></td>
			</tr>
			<tr>
				<td>교육시간</td>
				<td></td>
				<td><input type="text" name="employee_TRAINING_TIME" maxlength="5" placeholder="___:__" >시간</td>
			</tr>
			<tr>
				<td>대상인원</td>
				<td></td>
				<td><input type="text" name="employee_TRAINING_PEOPLE" id="employee_TRAINING_PEOPLE" >명</td>
			</tr>
			<tr>
				<td>사내외구분</td>
				<td></td>
				<td><select name="employee_TRAINING_IN_OUT"  id="employee_TRAINING_IN_OUT" >
				<option value="1.사내" selected>1.사내</option>
				<option value="2.사외">2.사외</option>
				</select></td>
			</tr>
		</table>		
	</div>
	</form>

</body>
</html>