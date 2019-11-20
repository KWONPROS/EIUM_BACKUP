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
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>


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
		mySheet.SetSheetHeight(300);
		//아이비시트2------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0, ComboEditValidation:1};
		initSheet2.HeaderMode = {Sort:1, ColMove:0, ColResize:0, HeaderCheck:1};
		initSheet2.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center", Hidden:1},
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
			{Header:"비고",Type:"Combo",SaveName:"working_STATUS_DESC",MinWidth:80, Align:"Center", "ComboText":"출근|지각|조퇴|외출", "ComboCode":"00|01|02|03"},
			//평일(table)
			{Header:"평일정상근무시간",Type:"Text",SaveName:"weekday_NORMAL_WORK_TIME", Width:80, Align:"Center",Format:"0000"},	
			{Header:"평일연장근무시간",Type:"Text",SaveName:"weekday_EXTENSION_WORK_TIME", Width:80, Align:"Center",Format:"0000"},			
			{Header:"평일야간근무시간",Type:"Text",SaveName:"weekday_NIGHT_WORK_TIME", Width:80, Align:"Center",Format:"0000"},
			
			//휴일(table)
			{Header:"휴일정상근무시간",Type:"Text",SaveName:"holiday_NORMAL_WORK_TIME", Width:80, Align:"Center",Format:"0000"},	
			{Header:"휴일연장근무시간",Type:"Text",SaveName:"holiday_EXTENSION_WORK_TIME", Width:80, Align:"Center",Format:"0000"},			
			{Header:"휴일야간근무시간",Type:"Text",SaveName:"holiday_NIGHT_WORK_TIME", Width:80, Align:"Center",Format:"0000"}
		];
		
		IBS_InitSheet( mySheet2 , initSheet2);
		
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(700);
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
		mySheet3.SetAutoRowHeight(0);
		mySheet3.SetSheetHeight(75);
		mySheet3.SetDataRowHeight(34); //데이터 row의 높이 조절
		mySheet3.SetHeaderRowHeight(37);  //헤더 행의 높이 조절 
		/* mySheet3.SetSelectionMode(1); */
		

		mySheet3.SetRowHeight(1, 80); 
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
			/* mySheet2.SaveNameCol("temp_TIME") */ //mySheet2.GetSelectRow()
			/* alert(mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("temp_TIME"), 0000)); */
			/* alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("temp_TIME"))); */ //0000
			
			break;
			
		case "deadline": //마감
			break;
		
		case "calculate": //정산
			//mySheet2의 비고에 따라서 퇴근-출근 시간을 계산하여 총 근태 결과에 출력
			/* mySheet3.SetSheetHeight(50);
			alert(mySheet3.GetSheetHeight()); */
			/* mySheet3.SetDataRowHeight(39); */
			/* if(mySheet2.) */
			var Sum3 = mySheet2.ComputeSum("|11|"); // 비고 입력창의 총 합계
			alert(Sum3); 
			var temp_count = "근태코드";
			var count_array = new Array();
			for(var j=0;j<6;j++){ //배열 초기화
			    count_array[j]=0;
			}
			for(let i =1; i <= mySheet2.GetDataLastRow(); i++){
				temp_count = mySheet2.GetCellValue(i,mySheet2.SaveNameCol("working_STATUS_DESC"));
				alert(temp_count);
				switch(temp_count){
					case '00':
						count_array[0]++;
					break;
					
					case '01':
						count_array[1]++;
					break;
					
					case '02':
						count_array[2]++;
					break;
					
					case '03':
						count_array[3]++;
					break;
					
					case '04':
						count_array[4]++;
					break;
					
					case '05':
						count_array[5]++;
					break;
				}
			} 
			for(j=0; j<6; j++){
				alert("@@@@@"+count_array[j]);
			} 
			break;
		}
	}
	
	 
	 
	


	//출근일자나 비고 로 combobox 클릭시
	function mySheet2_OnChange(Row, Col){
		if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))=="0900" && mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))>="1800"){ //정상출근
			//alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC")));
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "00");
			//alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC")));
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))=="0900" & mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))<"1800"){ //조퇴
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "02");
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))>"0900"){ //지각
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "01");
		}
		/* alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME")));
		alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME")));
		alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"))); */
		
	}
	//mySheet(사원)로우 클릭시
	function mySheet_OnClick(Row, Col) {
		//defualt로 숨겨진 0000을 입력
		if (Row != 0) {
			mySheet2.DoSearch("${contextPath}/wm/p0001/WS_searchList.do", "P_EMP_CODE=" + mySheet.GetCellValue(Row, 0));
			/* if(mySheet2.GetCellValue(Row, 6) == "" || mySheet2.GetCellValue(Row, 6) == null){
				mySheet2.SetCellValue(Row, 6, "0000");
			} */
		}
	}
	//mySheet2(출근시간, 퇴근시간 클릭시)로우 클릭시
	function mySheet2_OnClick(Row, Col){
		//오른쪽 근무시간에 아이비시트에서 계산된 것을 뿌려줌
		
	}
	
	//평일정상근무시간 : week_NO_TIME
	//평일연장근무시간 : week_EX_TIME
	//평일야간근무시간 : week_NI_TIME
	//휴일정상근무시간 : holi_NO_TIME
	//휴일연장근무시간 : holi_EX_TIME
	//휴일야간근무시간 : holi_NI_TIME
	function mySheet2_OnSearchEnd(Code, Msg){ //mySheet2 근태 정보 검색하기 전
		var Maskingcell = mySheet2.GetDataLastRow();
		/* for(let i = Maskingcell; i >= 1; i--){ // savename: temp_시간의 col에 00:00 masking 값 입력
			mySheet2.SetCellValue(i, 8, "0000");
			/* alert(mySheet2.GetCellValue(i, 8)); */ //값 확인 완료
		//} 
		/* alert(Maskingcell);
		alert(mySheet2.GetCellValue(1, 5)); */
		getTodayLabel(mySheet2.GetCellValue(1,5)); //화
		
		
		for(let i = 1; i <= Maskingcell; i++){
			var week_NO_TIME = 0, week_EX_TIME = 0, week_NI_TIME = 0, holi_NO_TIME = 0, holi_EX_TIME = 0, holi_NI_TIME = 0;
			if(getTodayLabel(mySheet2.GetCellValue(i, 5)) >=1 & getTodayLabel(mySheet2.GetCellValue(i, 5)) <= 5){ //평일 일 때
				if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"){ //0100 0500 //////////////시작시간이 06시 이전일때

					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))); //평일야간근무 ex) 0100, 0600
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){// 0300 0800
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0500출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
						/* alert(week_NI_TIME);  */
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					}
					if(next_temp_time >= "100"){ //연장근무 시간이 1시간 이상일때 평일 연장 근무시간에 +
						
						week_EX_TIME = week_EX_TIME + next_temp_time;
						/* alert(week_EX_TIME); */
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
						/* alert(week_NI_TIME);  */
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							week_NO_TIME = week_NO_TIME + next_temp_time;
							/* alert(week_NO_TIME); */
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "300");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
						/* alert(week_NI_TIME);  */
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							week_EX_TIME = week_EX_TIME + next_temp_time + 300;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
							
					}else if(next_temp_time < "100"){
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "300");
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){ //0100 2300
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간시간이 1시간 이상일때 평일 야간 근무 시간에 +
						
						week_NI_TIME = week_NI_TIME + next_temp_time;
							
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "700");
					/* alert(week_NI_TIME);  */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0600 0700 ///////////여기서 부터 START 06시작
					//0600~0900시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC")));
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){// 0630 0900
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0800출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 1000 - 0630 = 370 - 40 = 330
					//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					}
					if(next_temp_time >= "100"){ //정상근무 시간이 1시간 이상일때 평일 정상 근무시간에 +
						
						week_NO_TIME = week_NO_TIME + next_temp_time;
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					//3
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 정근무시간에 + ex) 1800 - 0930 = 870 - 40 = 830

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
						/* alert(week_NI_TIME);  */
						/* mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); */
					}
					if(next_temp_time >= "100"){ // 연장 근무 시간이 1시간 이상일때 평일 연장 근무 시간에 +
						
							week_EX_TIME = week_EX_TIME + next_temp_time;
							
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					//4alert("666");
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					/* alert(next_temp_time); */
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
						/* alert(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
						alert(next_temp_time); */
							week_NI_TIME = week_NI_TIME + next_temp_time;
							/* alert(week_NO_TIME); */
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
							
					}else if(next_temp_time < "100"){
						/* mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), "300"); */
					}
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					/* alert(week_NI_TIME); */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					/* alert("666"); */
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0900 1800 ///////////여기서 부터 START 09시작
					//0900~1800시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){// 0930 1830
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //1700출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						week_EX_TIME = week_EX_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					//3
					//4alert("666");
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					/* alert(next_temp_time); */
					if(pre_temp_time >= "100"){ //정상근무 시간이 1시간 이상 일때 평일 정상근무시간에 + ex) 1800 - 1030 = 770 - 40 = 730
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
						/* alert(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
						alert(next_temp_time); */
							week_NI_TIME = week_NI_TIME + next_temp_time;
							/* alert(week_NO_TIME); */
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
							
					}else if(next_temp_time < "100"){
						/* mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), "300"); */
					}
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME); //지우고 100EX에 400을 넣어주어야한다.
					/* alert(week_NI_TIME); */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME );
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					/* alert("666"); */
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					/* alert("666"); */
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //1800 2300 ///////////여기서 부터 START 18시작
					//1800~2200시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){// 1830 2230
					
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //2100출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						week_NI_TIME = week_NI_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					/* week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00 */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){
					/* alert("666"); */
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						week_EX_TIME = week_EX_TIME + next_temp_time;
					}
					week_NI_TIME = week_NI_TIME + 800;
					var temp_EX	= week_EX_TIME % 100;
					alert(temp_EX);
					if(temp_EX/10 == 6){
						week_EX_TIME = week_EX_TIME + 40;
						
					}
					/* week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00 */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						week_NO_TIME = week_NO_TIME + next_temp_time;
					}
					week_NI_TIME = week_NI_TIME + 800;
					week_EX_TIME = week_EX_TIME + 300;
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
				}/* else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900"){
					
					var temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); // 0800출근시간이면 100이 출력
					if(temp_time >= "100"){ //1시간 이상일때 평일 연장 근무시간에 + ex) 0720 - 0900 = 180 - 40 = 140 
						
						week_EX_TIME = week_EX_TIME + temp_time - 40;
						alert(week_EX_TIME);
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){ //평일 정상 근무시간 : 
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC")));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200" || mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){
					mySheet2.SetCellValue(); //먼저 end - 1800한 값을 가지고 연장 근무시간에 + , 그 이후에 ㅏ
				}
				getTodayLabel(mySheet2.GetCellValue(i, 5));
				
			}else if(getTodayLabel(mySheet2.GetCellValue(i, 5)) == 0 || getTodayLavel(mySheet2.GetCellValue(i, 5)) == 6){ // 주말일 때
				/* alert("주말입니다."); */
				//getTodayLabel(mySheet2.GetCellValue(i, 5));
			} 
		}
		/* if(mySheet2.) */
		/* alert(getTodayLabel(mySheet2.GetCellValue(1, 5))); */
	}
	function mySheet2_OnBeforeEdit(Row, Col) {
		//출근, 조퇴, 외출 프로세스
		if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))=="0900" && mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))>="1800"){ //정상출근
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "00");
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))=="0900" & mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))<"1800"){ //조퇴
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "02");
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))>"0900"){ //지각
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "01");
		}
	}
	function mySheet2_OnAfterEdit(Row, Col){
		if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))=="0900" && mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))>="1800"){ //정상출근
			//alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC")));
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "00");
			//alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC")));
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))=="0900" & mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))<"1800"){ //조퇴
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "02");
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))>"0900"){ //지각
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "01");
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
	
	//평일인지 주말인지 구할 메소드 //토일 0, 6 평일(월,화,수,목,금)1,2,3,4,5
	function getTodayLabel(day) {
	    
		var week = ['일', '월', '화', '수', '목', '금', '토'];
		var d_year = day.substring(0,4); //2013
		var d_month = day.substring(4,6); //11
		var d_day = day.substring(6,8); //04
		day = d_year + "-" + d_month + "-" + d_day;
		/* alert(day); */
		var dayOfWeek = new Date(day).getDay();
		return dayOfWeek;

	}
	
		//Formating
	   $(document).ready(function () {
		 //근무시간 
		   $(function () { 
		         $('.WORK_TIME').keydown(function (event) {
		        var key = event.charCode || event.keyCode || 0;
		        $text = $(this);
		        if (key !== 8 && key !== 9) {
		        	if ($text.val().length === 3) {
                        $text.val($text.val() + ':');
                    }
		        }
		        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
		    })
		   }); 
		 
		      
		});//document.ready
		
		
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
.center{
	position: relative;
	top: -190px;
	left: 460px;
	width: 1000px;
	/* 670px; */
}
.right_end{
position: relative;
top: -495px;
left: 1550px;
/* 1150px */
width: 300px;
background: #EDF0F5;
border-radius: 10px;
}
.right_end table{
font-size:13px;
font-weight:bold;
padding: 20px;
}
.right_end table tr td:nth-child(1){
text-align:right;
}
.right_end table tr td:nth-child(2){
width: 20px;
height: 25px;
}

.right_end table tr td:nth-child(3) input{
width: 80px;
height: 20px;
padding-left: 10px;
margin-right:10px;
box-sizing: border-box;
border: 1px solid #CCCCCC;
border-radius: 2px;
} 

.bottom{
position: relative;
top:  -300px;
left: 30px;
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
	
	<div class="center">
		<script>createIBSheet("mySheet2", "100%", "100%");</script>
	</div>
	
	<div class="right_end">
		<table>
			<tr>
				<td>평일정상근무시간</td>
				<td><input type="hidden" name="myRow"></td>
				<td><input type="text" name="weekday_NORMAL_WORK_TIME" maxlength="6" class="WORK_TIME"  placeholder="___:__" >시간</td>
			</tr>
			<tr>
				<td>평일연장근무시간</td>
				<td></td>
				<td><input type="text" name="weekday_EXTENSION_WORK_TIME" maxlength="6" class="WORK_TIME"  placeholder="___:__" >시간</td>
			</tr>
			<tr>
				<td>평일야간근무시간</td>
				<td></td>
				<td><input type="text" name="weekday_NIGHT_WORK_TIME" maxlength="6" class="WORK_TIME"  placeholder="___:__" >시간</td>
			</tr>
			<tr>
				<td>휴일정상근무시간</td>
				<td></td>
				<td><input type="text" name="holiday_NORMAL_WORK_TIME" maxlength="6" class="WORK_TIME"  placeholder="___:__" >시간</td>
			</tr>
			<tr>
				<td>휴일연장근무시간</td>
				<td></td>
				<td><input type="text" name="holiday_EXTENSION_WORK_TIME" maxlength="6" class="WORK_TIME" placeholder="___:__" >시간</td>
			</tr>
			<tr>
				<td>휴일야간근무시간</td>
				<td></td>
				<td><input type="text" name="holiday_NIGHT_WORK_TIME" maxlength="6" class="WORK_TIME" placeholder="___:__" >시간</td>
			</tr>
			<!-- <tr>
				<td>평일</td>
				<td></td>
				<td><input type="text" name="weekday" maxlength="2" class="WORK_TIME" placeholder="__" >일</td>
			</tr>
			<tr>
				<td>휴일</td>
				<td></td>
				<td><input type="text" name="holiday" maxlength="2" class="WORK_TIME" placeholder="__" >일</td>
			</tr>
			<tr>
				<td>총정상근무일</td>
				<td></td>
				<td><input type="text" name="normal_WORK_DAY" maxlength="2" class="WORK_TIME" placeholder="__" >일</td>
			</tr>
			<tr>
				<td>총연장근무일</td>
				<td></td>
				<td><input type="text" name="extension_WORK_DAY" maxlength="2" class="WORK_TIME" placeholder="__" >일</td>
			</tr> -->
		</table>
	</div>
	<div class="bottom">
		<script>createIBSheet("mySheet3", "100%", "100%");</script>
	</div>

</body>
</html>