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


function setPayment(){
	payment_code=document.getElementById("Ppayment_code").value;
	payment_date=document.getElementById("Ppayment_date").value;
	payment_des_name=document.getElementById("Ppayment_des_name").value;
};

	/*Sheet 기본 설정 */
	function LoadPage() {
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [		
	        {Header:"NO",Type:"Seq",SaveName:"NUMBER",MinWidth:50, Align:"Center" },	
	        {Header:"사원코드",Type:"Text",SaveName:"employee_code", MinWidth:50,  Align:"Center", KeyField:1, Edit: 0},	
			{Header:"사원명",Type:"Text",SaveName:"employee_name", MinWidth:120, Align:"Center", Edit: 0},
			{Header:"지급고유번호",Type:"Text",SaveName:"payment_code", MinWidth:120, Align:"Center", Hidden:"1"}

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
       		{Header:"지급항목",Type:"Text", MinWidth:70, SaveName:"payment_receipt_item", DefaultValue :"기본급" , InsertEdit:"0", UpdateEdit:"0"},
			{Header:"금액",Type:"Text",SaveName:"payment_receipt_price",MinWidth:70, Align:"Center"},
       		{Header:"급여계산서고유번호",Type:"Text",SaveName:"payment_receipt_code",MinWidth:70, Align:"Center"},
       		{Header:"사원고유번호",Type:"Text",SaveName:"employee_code",MinWidth:70, Align:"Center"},
       		{Header:"지급고유번호",Type:"Text",SaveName:"payment_code",MinWidth:70, Align:"Center"}
		];
		
		IBS_InitSheet( mySheet2 , initSheet2);
		  
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(250);
		
		/* MonthPicker 옵션 */
	    options = {
	        pattern: 'yy/mm', // Default is 'mm/yyyy' and separator char is not mandatory
	        selectedYear: 2019,
	        startYear: 2008,
	        finalYear: 2019,
	        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
	     
	    /* MonthPicker Set */
	    $('#monthpicker').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('#btn_monthpicker').bind('click', function () {
	        $('#monthpicker').monthpicker('show');
	    });
	    
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/pm/p0001/searchList.do", param);
			//조회조건에 맞도록 조회하기
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			break;
			
		case "insert":
		      var row = mySheet.DataInsert(-1);
		      break;
		      
				
		case "insert2":
		      var row = mySheet2.DataInsert(-1);
		      break;      
		     case "save":
		    	 var tempStr = mySheet2.GetSaveString();
		    	 mySheet2.DoSave("${contextPath}/pm/p0001/saveData.do");
			break;

		}
	}
	
	function mySheet2_OnSearchEnd() {
		mySheet2.DataInsert(-1);
	}
	
	function mySheet2_OnKeyUp(Row, Col, KeyCode, Shift) {
		//if (Modify == 1) { 인사코드 부분 - 수정 가능일시이니까 / 인사기록카드에서는 상관x
	         //console.log("keycode: "+KeyCode+"&col:"+mySheet2.LastCol()+"&row:"+mySheet2.RowCount());
	         /* console.log("keycode: " + KeyCode);*/
	         console.log("col:" + Col + "lastcol:" + mySheet2.LastCol());
	         console.log("row:" + Row + "row갯수:" + mySheet2.RowCount()); 
	         console.log("mySheet2:" +mySheet2.RowCount());
	         if ( KeyCode == 13 &&  Col == mySheet2.LastCol()
	               && Row == mySheet2.RowCount()) { // 엔터를 누르고 / col이 마지막 col이고 / row가 마지막 열일경우
	            doAction("insert2");
	         }
		}

	//로우 클릭시
function mySheet_OnClick(Row, Col) { 
		var param = "x="+mySheet.GetCellValue(Row, 1)+"&y="+mySheet.GetCellValue(Row, 3);
			mySheet2.DoSearch("${contextPath}/pm/p0001/searchReceipt.do", param);
			
	}
	
	 function showPopup() {
		 var monthpicker = $('#monthpicker').val();
		 var url = '${contextPath}/pm/p0001/searchPaymentdate.do?monthpicker='+monthpicker;

		 window.open(url, "a", "width=600, height=500, left=100, top=50");
	  
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
	  
	function selectSite() {

		$.ajax({

					url : "${contextPath}/sm/p0006/SiteList.do",//목록을 조회 할 url

					type : "POST",

					dataType : "JSON",

					success : function(data) {

						for (var i = 0; i < data['Data'].length; i++) {
							
							

							var option = "<option name='1' value='" + data['Data'][i].site_NAME + "'>"
									+ data['Data'][i].site_NAME + "</option>";

							//대상 콤보박스에 추가

							$('#searchSite').append(option);

						}

					},

					error : function(jqxhr, status, error) {

						alert("에러");

					}

				});

	};
	  
	function selectType() {

		var searchTYPE = $('#searchTYPE').val();
		console.log(searchTYPE);

		$
				.ajax({

					url : "${contextPath}/pm/p0001/TypeList.do",//목록을 조회 할 url

					type : "POST",

					data : {
						"searchTYPE" : searchTYPE
					},

					dataType : "JSON",

					success : function(data) {
						$(".1").remove();
						
						if(data['Data'][0].site_name!= null && data['Data'][0].site_name!= ''){
						for (var i = 0; i < data['Data'].length; i++) {

							var option = "<option class='1' value='" + data['Data'][i].site_name + "'>"
									+ data['Data'][i].site_name
									+ "</option>";

							//대상 콤보박스에 추가
							$('#searchDetail').append(option);

						}
						}
						
						if(data['Data'][0].department_name!= null && data['Data'][0].department_name!= ''){
						for (var i = 0; i < data['Data'].length; i++) {

							var option = "<option class='1' value='" + data['Data'][i].department_name + "'>"
									+ data['Data'][i].department_name
									+ "</option>";

							//대상 콤보박스에 추가
							$('#searchDetail').append(option);

						}
						}
						
						if(data['Data'][0].work_group_name!= null && data['Data'][0].work_group_name!= ''){
						for (var i = 0; i < data['Data'].length; i++) {

							var option = "<option class='1' value='" + data['Data'][i].work_group_name + "'>"
									+ data['Data'][i].work_group_name
									+ "</option>";

							//대상 콤보박스에 추가
							$('#searchDetail').append(option);

						}
						}
						
						if(data['Data'][0].project_name!= null && data['Data'][0].project_name!= ''){
						for (var i = 0; i < data['Data'].length; i++) {

							var option = "<option class='1' value='" + data['Data'][i].project_name + "'>"
									+ data['Data'][i].project_name
									+ "</option>";

							//대상 콤보박스에 추가
							$('#searchDetail').append(option);

						}
						}

					},

					error : function(jqxhr, status, error) {

						alert("에러");

					}

				});

	};
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
	left: 60px;
	width: 1053px;
}

.right{
	position: relative;
	top: -90px;
	left: 500px;
	width: 750px;
	
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

.ui-datepicker table{ font-size: 12px; }
.ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button{ width:40%; font-size: 14px; }
img {vertical-align: middle; padding: 0px 5px 0px 2px; }

</style>
</head>
<body onload="LoadPage()" >
<form name="frm">

	<div class="leftbuttons">
		<a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> 
		<a href="javascript:doAction('insert')" class="IBbutton">추가</a>
		<a href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 급여관리 : 급여입력및계산
		</header>
	</div>
	<div class="left">
	     <div id="searchBar">
            귀속연월 : <input id="monthpicker" type="text">
			<img id="btn_monthpicker"  src="${contextPath}/resources/image/icons/icon_calendar.png">
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		  지급일: <a href="javascript:showPopup();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a><input type="text" id="Ppayment_date"><br><br>
		 사업장구분: <select id="searchSite" onchange="selectSite()">
			<option value="all" selected>전체</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  조회조건: <select id="searchTYPE" onchange="selectType()">
		  	<option value="all" selected>전체</option>
			<option value="department">부서</option>
			<option value="work_group">근무조</option>
			<option value="project">프로젝트</option>
		</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		구분 :<select id="searchDetail" >
		<option value="alldetail" selected>전체</option>
		</select>
		<input type="hidden" id="Ppayment_code">
		<input type="hidden" id="Ppayment_des_name">
		</div>
		

		<script>
		createIBSheet("mySheet", "100%", "100%");
		selectSite();
		</script>
	</div>
	
	<div class="right">
		<script>createIBSheet("mySheet2", "100%", "100%");</script>
	</div>
	
</form>



</body>
</html>