<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"type="text/javascript"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<link rel="stylesheet"href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"	type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script language="javascript">

var graphColors = (function() {
	var colors = [];
	colors[0]="#1ABC9C";
	colors[1]="#3498DB";
	colors[2]="#2C3E50";
	colors[3]="#2980B9";

	
	return colors;
}());
	/*Sheet 기본 설정 */
	function LoadPage() {
		//IbSheet Wiwdth function
		var colWidth = (function(){
			var width = $("#mySheet").width();

			return (width/6);
		}());
		//컬러 fnction
		$("#mySheet3").width($("#mySheet").width()-$("#mySheet2").width()-60);
		
		var colWidth3 = (function(){
			var width = $("#mySheet3").width();

			return (width/4);
		}());
		
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,SumPosition:1};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [		
			{Header:"상태",Type:"Status",SaveName:"STATUS" ,Hidden:1},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Hidden:1},	
	        {Header:"비교연월",Type:"Text",SaveName:"department_CODE",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"인원",Type:"Text",SaveName:"department_NAME",MinWidth:0.5*colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"기본급",Type:"AutoSum",SaveName:"basic_SALARY",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"직책수당",Type:"AutoSum",SaveName:"position_SALARY",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Right"},	
			{Header:"상여금",Type:"AutoSum",SaveName:"bonus_SALARY",MinWidth:colWidth,Edit:0,Align:"Right"},			
			{Header:"지급합계",Type:"AutoSum" ,CalcLogic:' (|4| + |5|+ |6|) ', SaveName:"total_SALARY",MinWidth:1.5*colWidth,Edit:0,Align:"Right"}
			
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetSheetHeight(165);
		
		//아이비시트2
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,SumPosition:1};
		initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet2.Cols = [		
			{Header:"상태",Type:"Status",SaveName:"STATUS" ,Hidden:1},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Hidden:1},	
	        {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",MinWidth:100,Edit:0,Align:"Center"},	
	        {Header:"사원명",Type:"Text",SaveName:"employee_NAME",MinWidth:130,Edit:0,Align:"Center"},	
	        {Header:"부서명",Type:"Text",SaveName:"department_NAME",MinWidth:130,Edit:0,Align:"Center"},	
			{Header:"부서코드",Type:"Text",SaveName:"department_CODE",Edit:0,Hidden:1}			
					
		];   
		IBS_InitSheet( mySheet2 , initSheet2);
  
		mySheet2.SetSheetHeight(200);
		
		//아이비시트2
		mySheet3.RemoveAll();
		var initSheet3 = {};
		initSheet3.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,SumPosition:1};
		initSheet3.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet3.Cols = [		
			{Header:"상태",Type:"Status",SaveName:"STATUS" ,Hidden:1},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Hidden:1},	
	        {Header:"지급구분",Type:"Text",SaveName:"department_CODE",MinWidth:colWidth3,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"해당 월",Type:"AutoSum",SaveName:"department_NAME",MinWidth:colWidth3,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"평균(1년)",Type:"AutoSum",SaveName:"basic_SALARY",MinWidth:colWidth3,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"합계(1년)",Type:"AutoSum",SaveName:"position_SALARY",MinWidth:colWidth3,KeyField:1,Edit:0,Align:"Right"},	

		];   
		IBS_InitSheet( mySheet3 , initSheet3);
  
		mySheet3.SetSheetHeight(200);


		
		
		  
		
		
		
		(function selectSite() {
			
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
		})();
		  
		
	
		/* MonthPicker 옵션 */
	    var options = {
	        pattern: 'yy/mm',  
	        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
	     
	    /* MonthPicker Set */
	    $('input[name=monthpicker]').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('img[name=btn_monthpicker]').on('click', function () {
	        $(this).prev().monthpicker('show');    	
	        	

	    });
	    
	    $("#searchDate2").change(function() {
	    	if($("#searchDate1").val()>$("#searchDate2").val()){
	    		alert("종료일이 시작일 보다 커야합니다.");
	    		$(this).val("");
	    		return;
	    	}
	    	});

	    mySheet.DoSearch("${contextPath}/pm/p0009/searchList.do");	    
	}//LoadPage

	
	function selectDept() {
		if($('#Ppayment_code').val()==""){
			alert("지급일을 먼저 설정해주세요.");
			return false;
		}
		
		var SiteList = $('#searchSite').val();
		$.ajax({
					url : "${contextPath}/sm/p0006/DeptList.do",//목록을 조회 할 url
					type : "POST",
					data : {
						"SiteList" : SiteList
					},
					dataType : "JSON",
					success : function(data) {
						$(".1").remove();
						for (var i = 0; i < data['Data'].length; i++) {
							var option = "<option class='1' value='" + data['Data'][i].department_NAME + "'>"
									+ data['Data'][i].department_NAME
									+ "</option>";
							//대상 콤보박스에 추가
							$('#DeptList').append(option);
						}
					},
					error : function(jqxhr, status, error) {
						alert("에러");
					}
				});
	};
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			var param = FormQueryStringEnc(document.frm);
			console.log(param);
		
			mySheet.DoSearch("${contextPath}/pm/p0009/searchList.do",param);
			break;

		case "reload": //초기화		
			mySheet.RemoveAll();
			break;

		}
	}


	// 저장완료 후 처리할 작업
	function mySheet_OnSearchEnd(code, msg) {

		var subPieData=[],genPieData=[];
		var barNames=[],barBasic_SALARY=[],barPosition_SALARY=[],barBonus_SALARY=[],barTotal_SALARY=[]
		
		var subrow = mySheet.FindSubSumRow().split("|");
		var colorSelect=0;
		 for(var i = 1; i<=mySheet.GetDataLastRow();i++){
			 if(subrow.includes(i.toString())){		
				subPieData.push({		//파이소계행
					name: mySheet.GetCellValue(i-1,3),
					y: mySheet.GetCellValue(i,9),
					color: graphColors[colorSelect]
				})
					colorSelect++;
			}else{
				//막대그래프
				barNames.push(mySheet.GetCellValue(i,5));
				barBasic_SALARY.push(mySheet.GetCellValue(i,6));
				barPosition_SALARY.push(mySheet.GetCellValue(i,7));
				barBonus_SALARY.push(mySheet.GetCellValue(i,8));
				barTotal_SALARY.push(mySheet.GetCellValue(i,9));
				
				genPieData.push({			//파이일반행
					name: mySheet.GetCellValue(i,5),
					y: mySheet.GetCellValue(i,9),
					color: graphColors[colorSelect]
				});	  				
			}
		} 
		 
		 
		// 막대
			Highcharts.chart('payByType', {
			    title: {
			    	text : '지급구분 사원별 지급액',
					verticalAlign : 'bottom',
					align: 'center',
					x: 30,
					style : {
						color : '#111820',
						fontFamily : 'san-serif',
						fontSize : '18px',
						fontWeight: 'bold'

					}
			    },
			    legend: {
				    align: 'left',
				    layout: 'vertical',
				    verticalAlign: 'bottom',
				    x: 0,
				    y: -50
				},
			    xAxis: {
			        categories: barNames
				},
				  
			    yAxis: [{ // Primary yAxis
			        labels: {
			        	format: '{value:,.0f}'
			        },
			        title: {
			            text: '금액',
			        }
			    }],
			    
			
			    series: [{
			        type: 'column',
			        color: graphColors[0],
			        name: '기본급',
			        data: barBasic_SALARY
			    }, {
			        type: 'column', 
			        color: graphColors[1],
			        name: '직책수당',
			        data: barPosition_SALARY
			        
			    }, {
			        type: 'column', color: graphColors[2],
			        name: '상여',
			        data: barBonus_SALARY
			        
			    }, {
			        type: 'spline', color: '#212121',
			        name: '합계',
			        data: barTotal_SALARY,
			        marker: {
			            lineWidth: 2,
			            lineColor: '#212121'
			         
			        }
			    }]
			});
				 
		 Highcharts.chart('payByDep', {
			
			    chart: {
			        type: 'pie'
			    },
			    title: {
			        text: '부서별 지급액',
			        verticalAlign : 'bottom',
					align: 'center',
					style : {
						color : '#111820',
						fontFamily : 'san-serif',
						fontSize : '18px',
						fontWeight: 'bold'
					}
			    },
			    legend: {
				    align: 'left',
				    layout: 'vertical',
				    verticalAlign: 'bottom',
				    x: -20,
				    y: -40,  
				    floating:true
				},
			    plotOptions: {
			    	pie: {
			            allowPointSelect: true,
			            cursor: 'pointer',
			            dataLabels: {
			                enabled: false
			            }    
			        }
			    },
			    tooltip: {
			        valueSuffix: '원'
			    },
			    series: [{
			        name: '금액',
			        data: subPieData,
			        size: '60%',
			        id: 'subPieData',
			        showInLegend: true
			    }, {
			        name: '금액',
			        data: genPieData,
			        size: '80%',
			        innerSize: '60%',
			        showInLegend: false,
			        id: 'genPieData'
			    }],
			  
			});	
		
	}
	
	
	 function payPopup() {
		 var monthpicker = $('input[name=monthpicker]').val();
		 if(monthpicker==""){
			 alert("귀속년월을 지정해주세요.");
			 return;
		 }
		 var url = '${contextPath}/pm/p0001/searchPaymentdate.do?monthpicker='+monthpicker;

		 window.open(url, "a", "width=342,height=520,resizable = no, scrollbars = no");
	  
	  }
	 function setPayment(){}
	
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

#searchBar {
	position: relative;
	top: 110px;
	background: #EBEBEB;
	padding: 20px 100px 20px 0px;
	border-radius: 5px;
	font-size: 12px;
	border-radius: 5px;
	vertical-align: middle;
	width: 90%;
}
.searchBarTitle {
	background: #5E5E5E;
	padding: 4px;
	color: white;
	border-radius: 5px;
	margin: 0 5px 0 70px;
	vertical-align: middle;
}

#searchBar input, select {
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-left: 5px;
	vertical-align: middle;
}

#searchBar img {
	margin: 0 10px 0 3px;
	vertical-align: middle;
}
#mySheet{
position: relative;
top:115px;
width: 1640px;

padding-bottom: 15px;
border-bottom: 2px solid #C3C3C3;
}
#mySheet2{
position: relative;
top:115px;
width: 360px;
padding: 15px 30px 0 0;
border-right: 2px solid #C3C3C3;
}
#mySheet3{
position: relative;
top:-115px;
left:390px;
z-index:100;
padding: 30px 0 0 30px;
}
.graph1 {
	position:relative;
	top:-110px;
	left:50px;
	width: 350px;
	height: 260px;
	z-index:10;
}
.graph2 {
background:gray;
	position:relative;
	top:-370px;
	left:450px;
	width: 400px;
	height: 260px;
	z-index:10;
}
.graph3 {
position:relative;
	top:-630px;
	left:900px;
	width: 750px;
	height: 310px;
}

</style>
</head>
<body onload="LoadPage()">
	<div class="leftbuttons">
		<a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a href="javascript:doAction('search')" class="IBbutton">조회</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 급여관리 : 사원임금통계
		</header>
	</div>


	<div id="searchBar">
		<form name="frm">
			<span class="searchBarTitle">조회기간</span> <input id="searchDate1" name="monthpicker"
				type="text" style="width: 100px;"> <img name="btn_monthpicker"
				src="${contextPath}/resources/image/icons/icon_calendar.png">
				~ <input id="searchDate2" name="monthpicker"type="text" style="width: 100px;"> 
				<img name="btn_monthpicker" src="${contextPath}/resources/image/icons/icon_calendar.png">
			
			 <span class="searchBarTitle">사업장구분</span> <select id="searchSite"
				style="width: 150px;" onclick="selectDept()">
				<option selected>전체</option>
			</select> <span class="searchBarTitle">부서</span> <select id="DeptList"
				style="width: 150px;">
				<option selected>전체</option>
			</select>
		</form>

	</div>

	<div id="mySheet"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
	<div id="mySheet2"><script>createIBSheet("mySheet2", "100%", "100%");</script></div>
	<div id="mySheet3"><script>createIBSheet("mySheet3", "100%", "100%");</script></div>
    
    <div id='payByDep' class="graph1"></div>
    <div id='' class="graph2"></div>
    <div id='payByType' class='graph3'></div>
</body>

</html>