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


	/*Sheet 기본 설정 */
	function LoadPage() {
		//IbSheet Wiwdth function
		var colWidth = (function(){
			var width = $('#searchBar').width();

			return ((width+100)/8);
		}());
		//컬러 fnction
		var graphColors = (function() {
			var colors = [];
			colors[0]="#1ABC9C";
			colors[1]="#3498DB";
			colors[2]="#2980B9";
			colors[3]="#2C3E50";
			
			return colors;
		}());
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,SumPosition:1};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [		
			{Header:"상태",Type:"Status",SaveName:"STATUS" ,Hidden:1},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Hidden:1},	
	        {Header:"부서코드",Type:"Text",SaveName:"department_CODE",MinWidth:0.75*colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"부서명",Type:"Text",SaveName:"department_NAME",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",MinWidth:0.75*colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"사원명",Type:"Text",SaveName:"employee_NAME",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Center"},	
			{Header:"기본급",Type:"AutoSum",SaveName:"basic_SALARY",MinWidth:colWidth,Edit:0,Align:"Right"},			
			{Header:"칙책수당",Type:"AutoSum",SaveName:"position_SALARY",MinWidth:colWidth,Edit:0,Align:"Right"},
			{Header:"상여",Type:"AutoSum",SaveName:"bonus_SALARY",MinWidth:colWidth,Edit:0,AutoSum:1,Align:"Right"},
			{Header:"지급합계",Type:"AutoSum" ,CalcLogic:' (|6| + |7|+ |8|) ', SaveName:"total_SALARY",MinWidth:1.5*colWidth,Edit:0,Align:"Right"},
			
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetSheetHeight(350);
		mySheet.ShowSubSum([{
            "StdCol": '3',
            "SumCols": "6|7|8|9",
            "CaptionText" : "소계"
        }]);
		
		
		
		
		// 원그래프
		
   var categories = [
        'Chrome',
        'Firefox',
        'Internet Explorer',
        'Safari',
        'Edge',
        'Opera',
        'Other'
    ],
    data = [
        {
            y: 62.74,
            color: graphColors[0],
            drilldown: {
                name: 'Chrome',
                categories: [
                    'Chrome v65.0',
                    'Chrome v64.0',
                    'Chrome v63.0',
                    'Chrome v62.0',
                    'Chrome v61.0',
                    'Chrome v60.0',
                    'Chrome v59.0',
                    'Chrome v58.0',
                    'Chrome v57.0',
                    'Chrome v56.0',
                    'Chrome v55.0',
                    'Chrome v54.0',
                    'Chrome v51.0',
                    'Chrome v49.0',
                    'Chrome v48.0',
                    'Chrome v47.0',
                    'Chrome v43.0',
                    'Chrome v29.0'
                ],
                data: [
                    0.1,
                    1.3,
                    53.02,
                    1.4,
                    0.88,
                    0.56,
                    0.45,
                    0.49,
                    0.32,
                    0.29,
                    0.79,
                    0.18,
                    0.13,
                    2.16,
                    0.13,
                    0.11,
                    0.17,
                    0.26
                ]
            }
        },
        {
            y: 10.57,
            color: graphColors[1],
            drilldown: {
                name: 'Firefox',
                categories: [
                    'Firefox v58.0',
                    'Firefox v57.0',
                    'Firefox v56.0',
                    'Firefox v55.0',
                    'Firefox v54.0',
                    'Firefox v52.0',
                    'Firefox v51.0',
                    'Firefox v50.0',
                    'Firefox v48.0',
                    'Firefox v47.0'
                ],
                data: [
                    1.02,
                    7.36,
                    0.35,
                    0.11,
                    0.1,
                    0.95,
                    0.15,
                    0.1,
                    0.31,
                    0.12
                ]
            }
        },
        {
            y: 7.23,
            color: graphColors[2],
            drilldown: {
                name: 'Internet Explorer',
                categories: [
                    'Internet Explorer v11.0',
                    'Internet Explorer v10.0',
                    'Internet Explorer v9.0',
                    'Internet Explorer v8.0'
                ],
                data: [
                    6.2,
                    0.29,
                    0.27,
                    0.47
                ]
            }
        }
        ],
    browserData = [],
    versionsData = [],
    i,
    j,
    dataLen = data.length,
    drillDataLen,
    brightness;


// Build the data arrays
for (i = 0; i < dataLen; i += 1) {

    // add browser data
    browserData.push({
        name: categories[i],
        y: data[i].y,
        color: data[i].color
    });

    // add version data
    drillDataLen = data[i].drilldown.data.length;
    for (j = 0; j < drillDataLen; j += 1) {
        brightness = 0.2 - (j / drillDataLen) / 5;
        versionsData.push({
            name: data[i].drilldown.categories[j],
            y: data[i].drilldown.data[j],
            color: data[i].color
        });
    }
}

// Create the chart
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
            },
            showInLegend: true
        }
    },
    tooltip: {
        valueSuffix: '%'
    },
    series: [{
        name: '부서',
        data: browserData,
        size: '60%',
        id: 'Browsers'
    }, {
        name: '이름',
        data: versionsData,
        size: '80%',
        innerSize: '60%',
        showInLegend: false,
        id: 'versions'
    }],
  
});

		
		
		
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
		        categories: ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
			},
		    yAxis: [{ // Primary yAxis
		        labels: {
		            format: '{value}',
		            style: {
		                color: Highcharts.getOptions().colors[1]
		            }
		        },
		        title: {
		            text: '금액',
		            style: {
		                color: Highcharts.getOptions().colors[1]
		            }
		        }
		    }],
		    tooltip: {
		        shared: true
		    },
		    
		    series: [{
		        type: 'column',
		        color: graphColors[0],
		        name: '기본급',
		        data: [3, 2, 1, 3, 4]
		    }, {
		        type: 'column', color: graphColors[1],
		        name: '직책수당',
		        data: [2, 3, 5, 7, 6]
		        
		    }, {
		        type: 'column', color: graphColors[2],
		        name: '상여',
		        data: [4, 3, 3, 9, 0]
		        
		    }, {
		        type: 'spline', color: '#212121',
		        name: '합계',
		        data: [12, 23, 3, 6.33, 3.33],
		        marker: {
		            lineWidth: 2,
		            lineColor: '#212121'
		         
		        }
		    }]
		});
		
		
		
		  
		
	
	
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
	    $('#monthpicker').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('#btn_monthpicker').bind('click', function () {
	        $('#monthpicker').monthpicker('show');
	    });
		
		
	}//LoadPage

	
	function selectDept() {
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
			mySheet.DoSearch("${contextPath}/pm/p0009/searchList.do",param);
			break;

		case "reload": //초기화		
			mySheet.RemoveAll();
			break;

		}
	}


	// 저장완료 후 처리할 작업
	function mySheet_OnSearchEnd(code, msg) {
		console.log(mySheet.GetRowData(2));

		// 원그래프
		
   var categories = [
        'Chrome',
        'Firefox',
        'Internet Explorer',
        'Safari',
        'Edge',
        'Opera',
        'Other'
    ],
    data = [
        {
            y: 62.74,
            color: graphColors[0],
            drilldown: {
                name: 'Chrome',
                categories: [
                    'Chrome v65.0',
                    'Chrome v64.0',
                    'Chrome v63.0',
                    'Chrome v62.0',
                    'Chrome v61.0',
                    'Chrome v60.0',
                    'Chrome v59.0',
                    'Chrome v58.0',
                    'Chrome v57.0',
                    'Chrome v56.0',
                    'Chrome v55.0',
                    'Chrome v54.0',
                    'Chrome v51.0',
                    'Chrome v49.0',
                    'Chrome v48.0',
                    'Chrome v47.0',
                    'Chrome v43.0',
                    'Chrome v29.0'
                ],
                data: [
                    0.1,
                    1.3,
                    53.02,
                    1.4,
                    0.88,
                    0.56,
                    0.45,
                    0.49,
                    0.32,
                    0.29,
                    0.79,
                    0.18,
                    0.13,
                    2.16,
                    0.13,
                    0.11,
                    0.17,
                    0.26
                ]
            }
        },
        {
            y: 10.57,
            color: graphColors[1],
            drilldown: {
                name: 'Firefox',
                categories: [
                    'Firefox v58.0',
                    'Firefox v57.0',
                    'Firefox v56.0',
                    'Firefox v55.0',
                    'Firefox v54.0',
                    'Firefox v52.0',
                    'Firefox v51.0',
                    'Firefox v50.0',
                    'Firefox v48.0',
                    'Firefox v47.0'
                ],
                data: [
                    1.02,
                    7.36,
                    0.35,
                    0.11,
                    0.1,
                    0.95,
                    0.15,
                    0.1,
                    0.31,
                    0.12
                ]
            }
        },
        {
            y: 7.23,
            color: graphColors[2],
            drilldown: {
                name: 'Internet Explorer',
                categories: [
                    'Internet Explorer v11.0',
                    'Internet Explorer v10.0',
                    'Internet Explorer v9.0',
                    'Internet Explorer v8.0'
                ],
                data: [
                    6.2,
                    0.29,
                    0.27,
                    0.47
                ]
            }
        }
        ],
    browserData = [],
    versionsData = [],
    i,
    j,
    dataLen = data.length,
    drillDataLen,
    brightness;


// Build the data arrays
for (i = 0; i < dataLen; i += 1) {

    // add browser data
    browserData.push({
        name: mySheet.GetCellValue(i,3), //부서명
        y: mySheet.GetCellValue(i,9),
        color: graphColors[i]
    });

    // add version data
    drillDataLen = data[i].drilldown.data.length;
    for (j = 0; j < drillDataLen; j += 1) {
        versionsData.push({
            name: data[i].drilldown.categories[j],
            y: data[i].drilldown.data[j],
            color: data[i].color
        });
    }
}
		
		
	}
	
	
	 function payPopup() {
		 var monthpicker = $('#monthpicker').val();
		 console.log(monthpicker);
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
width: 100%;
}

.payByDep {
	position:relative;
	top:120px;
	left:70px;
	width: 350px;
	height: 320px;
}
.payByType {
position:relative;
	top:-200px;
	left:480px;
	width: 1150px;
	height: 320px;
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
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 급여관리 : 월별지급현황
		</header>
	</div>


	<div id="searchBar">
		<form name="frm">
			<span class="searchBarTitle">귀속연월</span> <input id="monthpicker"
				type="text" style="width: 100px;"> <img id="btn_monthpicker"
				src="${contextPath}/resources/image/icons/icon_calendar.png">
			<span class="searchBarTitle">지급일</span> 
			<input type="hidden" id="Ppayment_code">
			
			<a href="javascript:payPopup();" style="text-decoration: none;"> <input
				type="text" id="Ppayment_date" style="width: 100px;">
				<input type="text" id="Ppayment_des_name" style="width:50px;"> 
				<img src="${contextPath}/resources/image/icons/icon_plus.png">
			</a> <span class="searchBarTitle">사업장구분</span> <select id="searchSite"
				style="width: 150px;" onchange="selectDept()">
				<option selected>전체</option>
			</select> <span class="searchBarTitle">부서</span> <select id="DeptList"
				style="width: 150px;">
				<option selected>전체</option>
			</select>
		</form>

	</div>

	<div id="mySheet"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
    
    <div id='payByDep' class="payByDep"></div>
    <div id='payByType' class='payByType'></div>
</body>

</html>