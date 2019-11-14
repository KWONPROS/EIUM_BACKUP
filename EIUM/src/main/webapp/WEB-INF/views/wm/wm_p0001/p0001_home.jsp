<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		
		/* MonthPicker 옵션 */
	    options = {
	        pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
	        selectedYear: 2019,
	        startYear: 2000,
	        finalYear: 3000,
	        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
	     
	    /* MonthPicker Set */
	    $('#monthpicker').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('#btn_monthpicker').bind('click', function () {
	        $('#monthpicker').monthpicker('show');
	    });
	    
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [		
		
	        {Header:"사원코드",Type:"Text",SaveName:"employee_CODE", Width:80, KeyField:1, Align:"Center", Edit: 0},	
			{Header:"사원명",Type:"Text",SaveName:"employee_NAME",MinWidth:120, Align:"Center", Edit: 0},			
			{Header:"부서명",Type:"Text",SaveName:"department_NAME",MinWidth:150, Align:"Center", Edit: 0},
			{Header:"부서코드", Type:"Text", SaveName:"department_CODE", Align:"Center", Edit: 0}
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(200);
		
		//아이비시트2------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0};
		initSheet2.HeaderMode = {Sort:1, ColMove:0, ColResize:0, HeaderCheck:1};
		initSheet2.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},	
	        {Header:"NO",Type:"Seq",SaveName:"NUMBER",MinWidth:50, Align:"Center"},
	        {Header:"근태입력고유번호", Type:"Text",SaveName:"working_STATUS_CODE", Width:50, Height:50, Align:"Center", Hidden:1},
	        {Header:"귀속연월", Type:"Text",SaveName:"working_STATUS_MONTH", Width:50, Align:"Center", Format: "MM-dd", CalcLogic:"|5|", Hidden:1},
	        {Header:"출근일자",Type:"Date",SaveName:"working_STATUS_DATE",MinWidth:120,KeyField:1, Align:"Center", Format: "Ymd"},			
			{Header:"출근시간",Type:"Date",SaveName:"working_STATUS_START_TIME",MinWidth:100, Align:"Center", Format: "HH:mm"},
			{Header:"퇴근시간",Type:"Date",SaveName:"working_STATUS_END_TIME",MinWidth:100, Align:"Center", Format: "HH:mm"},
			{Header:"temp_시간",Type:"Date",SaveName:"temp_TIME",MinWidth:100, Align:"Center", Format: "00:00", DefaultValue :"0000", Hidden:1},
			{Header:"근무총시간",Type:"Date",SaveName:"working_STATUS_TOTAL_TIME",MinWidth:50, Align:"Center", Format: "HH:mm", CalcLogic:"|7|+|8|-|6|", Hidden:1},
			{Header:"퇴근-출근시간",Type:"Date",SaveName:"working_STATUS_TOTAL_TIME_CALC",MinWidth:50, Align:"Center",Format:"HH:mm", CalcLogic:"|7|+|8|-|6|"},
			{Header:"비고",Type:"Combo",SaveName:"working_STATUS_DESC",MinWidth:120, Align:"Center", "ComboText":"평일정상근무시간|평일연장근무시간|평일야간근무시간|휴일정상근무시간|휴일연장근무시간|휴일야간근무시간", "ComboCode":"평일정상근무시간|평일연장근무시간|평일야간근무시간|휴일정상근무시간|휴일연장근무시간|휴일야간근무시간", "UpdateEdit":0}
		];
		
		IBS_InitSheet( mySheet2 , initSheet2);
		
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(200);
		/* GetDataLastRow() == mySheet3.GetSelectRow() */
		/* var info = [{StdCol:1 , SumCols:"0|1"}]; 
		mySheet.ShowSubSum (info);  */
		
		//아이비시트 3(총 근태결과)----------------------------------------------------
		mySheet3.RemoveAll();
		var initSheet3 = {};
		initSheet3.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0};
		initSheet3.HeaderMode = {Sort:1, ColMove:0, ColResize:0, HeaderCheck:1};
		initSheet3.Cols = [
			{Header:"상태", Type:"Status", SaveName:"STATUS", Hidden:1},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK", Hidden:1},
			//평일
			{Header:"평일정상근무시간",Type:"Text",SaveName:"weekday_NORMAL_WORK_TIME", Width:130,Edit:0,Align:"Center"},	
			{Header:"평일연장근무시간",Type:"Text",SaveName:"weekday_EXTENSION_WORK_TIME", Width:130,Edit:0,Align:"Center"},			
			{Header:"평일야간근무시간",Type:"Text",SaveName:"weekday_NIGHT_WORK_TIME", Width:130,Edit:0,Align:"Center"},
			
			//휴일
			{Header:"휴일정상근무시간",Type:"Text",SaveName:"holiday_NORMAL_WORK_TIME", Width:130,Edit:0,Align:"Center"},	
			{Header:"휴일연장근무시간",Type:"Text",SaveName:"holiday_EXTENSION_WORK_TIME", Width:130,Edit:0,Align:"Center"},			
			{Header:"휴일야간근무시간",Type:"Text",SaveName:"holiday_NIGHT_WORK_TIME", Width:130,Edit:0,Align:"Center"},
			//etc
			{Header:"평일",Type:"Text",SaveName:"weekday",Edit:0, Width:65,Align:"Center"},	
			{Header:"휴일",Type:"Text",SaveName:"holiday",Edit:0, Width:65,Align:"Center"},			
			{Header:"총정상근무일",Type:"Text",SaveName:"normal_WORK_DAY", Width:110,Edit:0,Align:"Center"},
			{Header:"총연장근무일",Type:"Text",SaveName:"extension_WORK_DAY", Width:110,Edit:0,Align:"Center"}
		];
		
		IBS_InitSheet(mySheet3, initSheet3);
		mySheet3.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet3.SetSheetHeight(71);
		
		mySheet3.SetSelectionMode(1);
		mySheet3.SetColEditable(2,0);
		mySheet3.SetColEditable(3,0);
		mySheet3.SetColEditable(4,0);
		
		mySheet3.SetColEditable(5,0);
		mySheet3.SetColEditable(6,0);
		mySheet3.SetColEditable(7,0);
		
		mySheet3.SetColEditable(8,0);
		mySheet3.SetColEditable(9,0);
		mySheet3.SetColEditable(10,0);
		mySheet3.SetColEditable(11,0);
		
		
		mySheet.DoSearch("${contextPath}/wm/p0001/EMP_searchList.do");
		mySheet3.DataInsert(-1);
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			mySheet.DoSearch("${contextPath}/wm/p0001/EMP_searchList.do");
			/* alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), 6)); */
			console.log(mySheet2.GetRowData(1));
			$('input[name=temp_TIME]').val(mySheet2.GetCellValue(1,3));
			
			//조회조건에 맞도록 조회하기
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			break;
		case "save": // 저장
			var tempStr = mySheet2.GetSaveString();
			alert("서버로 전달되는 문자열 확인 :" + tempStr);
			mySheet2.DoSave("${contextPath}/wm/p0001/saveData.do", "p_emp_code=" + mySheet.GetCellValue(mySheet.GetSelectRow(),0));
			break;
		case "insert":
			var row = mySheet2.DataInsert(-1);
			/* mySheet2.SaveNameCol("temp_TIME") */mySheet2.GetSelectRow()
			/* alert(mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("temp_TIME"), 0000)); */
			alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("temp_TIME")));
			break;
			
		case "deadline": //마감
			break;
		
		case "calculate": //정산
			//mySheet2의 비고에 따라서 퇴근-출근 시간을 계산하여 총 근태 결과에 출력
			/* mySheet3.SetSheetHeight(50);
			alert(mySheet3.GetSheetHeight()); */
			/* mySheet3.SetDataRowHeight(39); */
			mySheet3.DeferredHScroll(3);
			
			break;
		}
	}

	//로우 클릭시
	function mySheet_OnClick(Row, Col) {
		if (Row != 0) {
			mySheet2.DoSearch("${contextPath}/wm/p0001/WS_searchList.do", "P_EMP_CODE=" + mySheet.GetCellValue(Row, 0));
			if(mySheet2.GetCellValue(Row, 6) == "" || mySheet2.GetCellValue(Row, 6) == null){
				mySheet2.SetCellValue(Row, 6, "0000");
			}
		}
		
	}
	function mySheet2_OnSearchEnd(Code, Msg){ //mySheet2 근태 정보 검색하기 전
		var Maskingcell = mySheet2.GetDataLastRow();
		/* for(let i = Maskingcell; i >= 1; i--){ // savename: temp_시간의 col에 00:00 masking 값 입력
			mySheet2.SetCellValue(i, 8, "0000");
			/* alert(mySheet2.GetCellValue(i, 8)); */ //값 확인 완료
		//} 
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

.otherbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	right: 320px;
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

.right{
	position: relative;
	top: -90px;
	left: 470px;
	width: 750px;
}

.bottom{
position: relative;
top:  -60px;
left: 30px;
border: 6px;
}

#searchBar {
	background: #EBEBEB;
	padding: 15px 225px;
	margin-bottom: 30px;
	border-radius: 5px;
	font-size: 12px;
}

.left input{
	height: 22px;
	width: 100px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
	vertical-align: middle;
}

.left_rightsearch input{
	height: 22px;
	width: 100px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
	vertical-align: middle;
}
.yearMonth {
	background: #5E5E5E;
	padding: 5px 5px;
	color: white;
	border-radius: 5px;
}
.kindofsearch{
	background: #5E5E5E;
	padding: 5px 5px;
	color: white;
	border-radius: 5px;
}
.left_rightsearch{
	display: inline;
	float: right;
}
.GridMain1 .GridMain2 .GMMainTable {
	border: 0px;
}
.ui-datepicker table{ font-size: 12px; }
.ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button{ width:40%; font-size: 14px; }
img {vertical-align: middle; padding: 0px 5px 0px 2px; }

</style>
</head>
<body onload="LoadPage()" >
	<div class="leftbuttons">
		<a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>
	<div class="otherbuttons">
		<a href="javascript:doAction('deadline')" class="IBbutton">마감</a>
		<a href="javascript:doAction('calculate')" class="IBbutton">정산</a> 
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> 
		<a href="javascript:doAction('insert')" class="IBbutton">추가</a>
		<a href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 근태관리 : 근태입력
		</header>
	</div>
	<div class="left">
		<form id="searchBar">
			<span class="yearMonth">귀속연월</span> 
			<input id="monthpicker" type="text">
			<img id="btn_monthpicker" src="${contextPath}/resources/image/icons/icon_calendar.png">
			<div class="left_rightsearch"><span class="kindofsearch">조회조건</span>
				<select id="Employee_Select">
		    	<option value="" selected>구분</option>
				<option value="employee_name">사업장</option>
				<option value="employee_code">부서</option>
			</select>
			<input type="text" id="p_text" placeholder="사업장  or 부서">
		</div>
		</form>

		<script>createIBSheet("mySheet", "100%", "100%");</script>
	</div>
	
	<div class="right">
		<script>createIBSheet("mySheet2", "100%", "100%");</script>
	</div>
	
	<div class="bottom">
		<script>createIBSheet("mySheet3", "100%", "200px");</script>
	</div>

</body>
</html>