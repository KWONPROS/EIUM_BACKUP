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
	function setPayment(){
	payment_code=document.getElementById("Ppayment_code").value;
	payment_date=document.getElementById("Ppayment_date").value;
	payment_des_name=document.getElementById("Ppayment_des_name").value;
};


	function LoadPage() {
		
		//아이비시트1 
		mySheet1.RemoveAll();
		var initSheet1 = {};
		initSheet1.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet1.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet1.Cols = [		
	        {Header:"NO",Type:"Seq",SaveName:"NUMBER",MinWidth:50, Align:"Center" },	
	        {Header:"사원코드",Type:"Text",SaveName:"employee_code", MinWidth:50,  Align:"Center", KeyField:1, Edit: 0},	
	        {Header:"사원명",Type:"Text",SaveName:"employee_name", MinWidth:120, Align:"Center", Edit: 0},
			{Header:"지급고유번호",Type:"Text",SaveName:"payment_code", MinWidth:120, Align:"Center", Hidden:"1"},
	        {Header:"부서",Type:"Text",SaveName:"department_name", MinWidth:120, Align:"Center", Edit: 0}
		];   
		IBS_InitSheet( mySheet1 , initSheet1);
  
		mySheet1.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet1.SetSheetHeight(250);
		
		//아이비시트2------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0};
		initSheet2.HeaderMode = {Sort:1, ColMove:0, ColResize:0, HeaderCheck:1};
		initSheet2.Cols = [
	        {Header:"지급항목",Type:"Combo", MinWidth:70, SaveName:"payment_receipt_item", ComboText:"|기본급|상여급", ComboCode:"|기본급|상여급", Edit: 0},
			{Header:"총액",Type:"AutoSum", Format:"Integer", SaveName:"payment_receipt_price", MinWidth:70, Align:"Center", Edit: 0}
			
			];
		
		IBS_InitSheet( mySheet2 , initSheet2);
		  
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(250);


		
		mySheet3.RemoveAll();
		var initSheet3 = {};
		initSheet3.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet3.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet3.Cols = [		
	        {Header:"NO",Type:"Seq",SaveName:"NUMBER",MinWidth:50, Align:"Center" },	
	        {Header:"코드",Type:"Text",SaveName:"department_code", MinWidth:50,  Align:"Center", KeyField:1, Edit: 0},	
	        {Header:"부서명",Type:"Text",SaveName:"department_name", MinWidth:120, Align:"Center", Edit: 0},
			{Header:"지급고유번호",Type:"Text",SaveName:"payment_code", MinWidth:120, Align:"Center", Hidden:"1"},
			{Header:"인원수",Type:"Text",SaveName:"employee_code", MinWidth:120, Align:"Center", Edit: 0}
		];   
		IBS_InitSheet( mySheet3 , initSheet3);
  
		mySheet3.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet3.SetSheetHeight(250);
		mySheet3.SetVisible(0); 
		
		mySheet4.RemoveAll();
		var initSheet4 = {};
		initSheet4.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet4.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet4.Cols = [		
	        {Header:"NO",Type:"Seq",SaveName:"NUMBER",MinWidth:50, Align:"Center" },	
	        {Header:"코드",Type:"Text",SaveName:"site_code", MinWidth:50,  Align:"Center", KeyField:1, Edit: 0},	
	        {Header:"사업장명",Type:"Text",SaveName:"site_name", MinWidth:120, Align:"Center", Edit: 0},
			{Header:"지급고유번호",Type:"Text",SaveName:"payment_code", MinWidth:120, Align:"Center", Hidden:"1"},
			{Header:"인원수",Type:"Text",SaveName:"employee_code", MinWidth:120, Align:"Center", Edit: 0}
		];   
		IBS_InitSheet( mySheet4 , initSheet4);
  
		mySheet4.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet4.SetSheetHeight(250);
		mySheet4.SetVisible(0); 
		
		
		mySheet5.RemoveAll();
		var initSheet5 = {};
		initSheet5.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet5.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet5.Cols = [		
	        {Header:"NO",Type:"Seq",SaveName:"NUMBER",MinWidth:50, Align:"Center" },	
	        {Header:"코드",Type:"Text",SaveName:"job_class_code", MinWidth:50,  Align:"Center", KeyField:1, Edit: 0},	
	        {Header:"직종명",Type:"Text",SaveName:"job_class_name", MinWidth:120, Align:"Center", Edit: 0},
			{Header:"지급고유번호",Type:"Text",SaveName:"payment_code", MinWidth:120, Align:"Center", Hidden:"1"},
			{Header:"인원수",Type:"Text",SaveName:"employee_code", MinWidth:120, Align:"Center", Edit: 0}
		];   
		IBS_InitSheet( mySheet5 , initSheet5);
  
		mySheet5.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet5.SetSheetHeight(250);
 		mySheet5.SetVisible(0); 
		
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
			var total = $('#total').val();
			
			if(total =='emp' ){
				mySheet1.DoSearch("${contextPath}/pm/p0002/searchList.do", param);
			}
			
			if(total =='dep' ){
				mySheet3.DoSearch("${contextPath}/pm/p0002/searchList.do", param);
			}
			
			if(total =='sit' ){
				mySheet4.DoSearch("${contextPath}/pm/p0002/searchList.do", param);
			}
			
			if(total =='job' ){
				mySheet5.DoSearch("${contextPath}/pm/p0002/searchList.do", param);
			}
	
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			break;
			
		case "insert":
			var row = mySheet2.DataInsert(-1);
		      break;      
		      
		      

		}
	}
	
	
	

	//로우 클릭시
function mySheet1_OnClick(Row, Col) { 
			x = "x=" + mySheet1.GetCellValue(Row, 1);
			var param = "x="+mySheet1.GetCellValue(Row, 1)+"&y="+mySheet1.GetCellValue(Row, 3) +"&p="+FormQueryStringEnc(document.frm);
			mySheet2.DoSearch("${contextPath}/pm/p0002/searchReceipt.do", param);

	}
	
function mySheet3_OnClick(Row, Col) { 
	x = "x=" + mySheet3.GetCellValue(Row, 1);
	var param = "x="+mySheet3.GetCellValue(Row, 1)+"&y="+mySheet3.GetCellValue(Row, 3) +"&p="+FormQueryStringEnc(document.frm);
	mySheet2.DoSearch("${contextPath}/pm/p0002/searchReceipt.do", param);

}

function mySheet4_OnClick(Row, Col) { 
	x = "x=" + mySheet4.GetCellValue(Row, 1);
	var param = "x="+mySheet4.GetCellValue(Row, 1)+"&y="+mySheet4.GetCellValue(Row, 3) +"&p="+FormQueryStringEnc(document.frm);
	mySheet2.DoSearch("${contextPath}/pm/p0002/searchReceipt.do", param);

}

function mySheet5_OnClick(Row, Col) { 
	x = "x=" + mySheet5.GetCellValue(Row, 1);
	var param = "x="+mySheet5.GetCellValue(Row, 1)+"&y="+mySheet5.GetCellValue(Row, 3) +"&p="+FormQueryStringEnc(document.frm);
	mySheet2.DoSearch("${contextPath}/pm/p0002/searchReceipt.do", param);

}
/* function mySheet2_OnDblClick(Row,Col,Value){
	row=Row;
	col=Col;
	
	if(Col=="4"){
		
	window.open("${contextPath}/pm/p0001/paygrade_Search.do", "a", "width=500, height=700, left=100, top=50"); 
	}
} */

	
	 function showPopup() {
		 var monthpicker = $('#monthpicker').val();
		 var url = '${contextPath}/pm/p0002/searchPaymentdate.do?monthpicker='+monthpicker;

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

		var searchSite = $('#searchSite').val();
		console.log(searchSite);

		$
				.ajax({

					url : "${contextPath}/pm/p0001/TypeList.do",//목록을 조회 할 url

					type : "POST",

					data : {
						"searchSite" : searchSite
					},

					dataType : "JSON",

					success : function(data) {
						$(".1").remove();				
							for (var i = 0; i < data['Data'].length; i++) {

							var option = "<option class='1' value='" + data['Data'][i].department_name + "'>"
									+ data['Data'][i].department_name
									+ "</option>";

							//대상 콤보박스에 추가
							$('#searchTYPE').append(option);

						
						}
						
					},

					error : function(jqxhr, status, error) {

						alert("에러");

					}

				});

	};
	
	
	
function selectDivision() {
		
		var total = $('#total').val();
		console.log(total);
		
		if(total =='emp' ){
			mySheet1.SetVisible(1);
			mySheet3.SetVisible(0); 
			mySheet4.SetVisible(0); 
			mySheet5.SetVisible(0); 
		}
		
		if(total =='dep' ){
			mySheet1.SetVisible(0);
			mySheet3.SetVisible(1); 
			mySheet4.SetVisible(0); 
			mySheet5.SetVisible(0); 
		}
		
		if(total =='sit' ){
			mySheet1.SetVisible(0);
			mySheet3.SetVisible(0); 
			mySheet4.SetVisible(1); 
			mySheet5.SetVisible(0); 
		}
		
		if(total =='job' ){
			mySheet1.SetVisible(0);
			mySheet3.SetVisible(0); 
			mySheet4.SetVisible(0); 
			mySheet5.SetVisible(1); 
		}
			
	


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
	position: absolute;
 	 top : 240px;
 	left: 450px;
	width: 750px;
	
}

.bottom{
	top:-60px;
	position: relative;
	padding: 60px;	
	width: 1053px;
	margin-bottom: 50px;
	
}
#searchBar {
	background: #EBEBEB;
	padding: 15px 225px;
	margin-bottom: 30px;
	border-radius: 5px;
	font-size: 12px;
}

#bottomBar {
	background: #EBEBEB;
	width :100%;
	border-radius: 5px;
	font-size: 12px;
	margin-bottom: 50px;
	
}

 .sheet2 {
 	position: absolute;
 	top : 120px;
 
 }
 
 .sheet3 {
 	position: absolute;
  	top : 120px;
 
 }
 
 .sheet4 {
 	position: absolute;
 	 top : 120px;
 	
 
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
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 급여관리 : 급여대장
		</header>
	</div>
	<div class="left">
	     <div id="searchBar">
            귀속연월 : <input id="monthpicker" type="text">
			<img id="btn_monthpicker"  src="${contextPath}/resources/image/icons/icon_calendar.png">
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		  지급일: <a href="javascript:showPopup();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a><input type="text" id="Ppayment_date"><br><br>
		 사업장구분: <select id="searchSite" onchange="selectType()">
			<option value="all" selected>전체</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  
		  부서: <select id="searchTYPE">
		  	<option value="all" selected>전체</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		  집계: <select id="total"  onchange="selectDivision()">
		  	<option value="emp" selected>1.사원별</option>
		  	<option value="dep">2.부서별</option>
		  	<option value="sit">3.사업장별</option>
		  	<option value="job">4.직종별</option>
		  	
		</select> 
		</div>
		<input type="hidden" id="Ppayment_code">
		<input type="hidden" id="Ppayment_des_name">
		
		
		<script>		
		createIBSheet("mySheet1", "100%", "100%");

		selectSite();
		</script>
		
		
		<div class = sheet2>
		<script>
		createIBSheet("mySheet3", "100%", "100%");
		</script>
		</div>
		
		<div class = sheet3>
		<script>
		createIBSheet("mySheet4", "100%", "100%");
		</script>
		</div>


		<div class = sheet4>
		<script>
		createIBSheet("mySheet5", "100%", "100%");
		</script>
		</div>
		
	</div>
	
	<div class="right">
		<script>createIBSheet("mySheet2", "100%", "100%");</script>
	</div>	
</form>



</body>
</html>