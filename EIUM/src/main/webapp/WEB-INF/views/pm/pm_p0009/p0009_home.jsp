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
<script language="javascript">


	/*Sheet 기본 설정 */
	function LoadPage() {
		//IbSheet Wiwdth function
		var colWidth = (function(){
			var width = $('#searchBar').width();

			return ((width+100)/8);
		}());
		//컬러 fnction
		var pieColors = (function() {
			var colors = [], base = Highcharts.getOptions().colors[0], i;
			for (i = 0; i < 10; i += 1) {
				colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
			}
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
	        {Header:"부서코드",Type:"Text",SaveName:"emp_CODE",MinWidth:0.75*colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"부서명",Type:"Text",SaveName:"emp_CODE",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"사원코드",Type:"Text",SaveName:"emp_CODE",MinWidth:0.75*colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"사원명",Type:"Text",SaveName:"emp_CODE",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Center"},	
			{Header:"기본급",Type:"Text",SaveName:"emp_NAME",MinWidth:colWidth,Edit:0,Align:"Center"},			
			{Header:"칙책수당",Type:"Text",SaveName:"dep_NAME",MinWidth:colWidth,Edit:0,Align:"Center"},
			{Header:"상여",Type:"Text",SaveName:"dep_NAME",MinWidth:colWidth,Edit:0,Align:"Center"},
			{Header:"지급합계",Type:"Text",SaveName:"dep_NAME",MinWidth:1.5*colWidth,Edit:0,Align:"Center"},
			
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetSheetHeight(350);
	
		
		
		
		// 원그래프
		var colors =pieColors,
    categories = [
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
            color: colors[2],
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
            color: colors[1],
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
            color: colors[0],
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
        }/* ,
        {
            y: 5.58,
            color: colors[3],
            drilldown: {
                name: 'Safari',
                categories: [
                    'Safari v11.0',
                    'Safari v10.1',
                    'Safari v10.0',
                    'Safari v9.1',
                    'Safari v9.0',
                    'Safari v5.1'
                ],
                data: [
                    3.39,
                    0.96,
                    0.36,
                    0.54,
                    0.13,
                    0.2
                ]
            }
        },
        {
            y: 4.02,
            color: colors[5],
            drilldown: {
                name: 'Edge',
                categories: [
                    'Edge v16',
                    'Edge v15',
                    'Edge v14',
                    'Edge v13'
                ],
                data: [
                    2.6,
                    0.92,
                    0.4,
                    0.1
                ]
            }
        },
        {
            y: 1.92,
            color: colors[4],
            drilldown: {
                name: 'Opera',
                categories: [
                    'Opera v50.0',
                    'Opera v49.0',
                    'Opera v12.1'
                ],
                data: [
                    0.96,
                    0.82,
                    0.14
                ]
            }
        },
        {
            y: 7.62,
            color: colors[6],
            drilldown: {
                name: 'Other',
                categories: [
                    'Other'
                ],
                data: [
                    7.62
                ]
            }
        } */
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
            color: Highcharts.Color(data[i].color).brighten(brightness).get()
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
        name: 'Browsers',
        data: browserData,
        size: '60%',
        id: 'Browsers'
    }, {
        name: 'Versions',
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
		        color: colors[0],
		        name: '기본급',
		        data: [3, 2, 1, 3, 4]
		    }, {
		        type: 'column', color: colors[1],
		        name: '직책수당',
		        data: [2, 3, 5, 7, 6]
		        
		    }, {
		        type: 'column', color: colors[2],
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
		
		
		
	}//LoadPage
	
	


	//사원검색 조건
	function searchCondition() {
		var cond = document.getElementById("condition").value;

		mySheet.DoSearch('${contextPath}/pm/p0009/searchList.do', 'condition='
				+ cond);
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			mySheet.DoSearch("${contextPath}/pm/p0009/searchList.do");
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			break;

		}
	}

	//로우 클릭시
	function mySheet_OnClick(Row, Col) {
		if (Row != 0) {

			$('input[name=myRow]').val(Row);

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
		<header><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 급여관리 : 월별지급현황</header>
	</div>


	<div id="searchBar">	
		<span class="searchBarTitle">지급일</span> 
		<input type="text" style="width:81px;" readonly><img src="${contextPath}/resources/image/icons/icon_plus.png" ><input type="text" id="">
			
		<span class="searchBarTitle" >지급구분</span>  
		<select style="width:81px;">
		<option value="">전체</option>
		<option value="">급여</option>
		<option value="">상여</option>
		</select>
	
		<span class="searchBarTitle">조회조건</span>
		 <select id="searchTYPE" onchange="selectType()">
			<option selected="selected"></option>
			<option value="">사업장</option>
			<option value="">부서</option>
			<option value="">근무조</option>
			<option value="">프로젝트</option>
		</select> 
		<input type="text" id="">
		<img src="${contextPath}/resources/image/icons/icon_plus.png" >
	</div>

	<div id="mySheet"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
    
    <div id='payByDep' class="payByDep"></div>
    <div id='payByType' class='payByType'></div>
</body>

</html>