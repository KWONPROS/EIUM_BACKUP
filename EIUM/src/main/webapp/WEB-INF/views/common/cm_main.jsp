<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='${contextPath}/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<script src='${contextPath}/resources/fullcalendar/core/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/interaction/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/daygrid/main.js'></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script>


 //달력
   document.addEventListener('DOMContentLoaded', function() {  
    
	  var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction',  'dayGrid', 'list' ],
      locale:'ko',
      height:400,
      editable: true,
      selectable: true,
      eventLimit: true, // allow "more" link when too many events
      select: function(start, end, allDay) {
    	    alert(start);
    	    var title = prompt('일정을 입력하세요.');
    	           
    	    },	  
      events: [
        {
          title: 'All Day Event',
          start: '2019-08-01'
        },
        {
          title: 'Long Event',
          start: '2019-08-07',
          end: '2019-08-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-08-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-08-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2019-08-11',
          end: '2019-08-13'
        },
        
        {
          title: 'Birthday Party',
          start: '2019-08-13T07:00:00'
        	  , color : "#FF0000"
                  , textColor : "#FFFF00"
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          
          start: '2019-08-28'
        }
      ]
    });

    calendar.render();
    
    

	// 현재인원 그래프
		Highcharts.chart('circlegraph', {
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie'
			},
			title : {
				text : '현재 인원',
				style : {
					color : '#111820',
					fontFamily : 'san-serif',
					fontWeight : 'bold',
					fontSize : '21px'
				}
			},

			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					colors : pieColors,
					dataLabels : {
						enabled : false,
					},
					showInLegend : {
						enabled : true
					}

				}

			},
			series : [ {
				name : '인원',
				colorByPoint : true,
				data : [ {
					name : '출근',
					y : 45
				}, {
					name : '휴가',
					y : 5
				}, {
					name : '병가',
					y : 1
				}, {
					name : '출장',
					y : 3
				}, {
					name : '기타',
					y : 4
				}, ]
			}, {
				name : '인원',
				colors : [ '#FFFFFF' ],
				size : '50%',
				center : [ '50%', '50%' ],
				dataLabels : {
					enabled : true,
					style : {
						textOutline : false,
						textShadow : false,
				 		fontWeight : 'bold',
						fontFamily : 'san-serif',
						fontSize : '25px'
					},
					distance : -65,
					format : '{point.y}'
				},
				showInLegend : false,
				data : [ [ '전체', 58 ] ]
			} ]
		});

	
		
	
	
	});
	//컬러 fnction
	var pieColors = (function() {
		var colors = [], base = Highcharts.getOptions().colors[0], i;

		for (i = 0; i < 10; i += 1) {
			// Start out with a darkened base color (negative brighten), and end
			// up with a much brighter color
			colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
		}
		return colors;
	}());
	
	function createTab(r,c,v){
		parent.leftMenu_OnClick(r,c,v);
	}
	
	
</script>
<style>
#calendar {
	margin: 20px 0 0 20px;
	max-width: 700px;
	font-size: 12px;
}
.topright {
	width: 700px;
	height: 370px;
	margin:25px;
	margin-left:50px;
	position: relative;
	left: 780px;
	top: -400px;
}
.bottomleft {
	width: 750px;
	height: 390px;
	position: relative;
	left: 10px;
	top: -390px;
}
.bottomright {
	width: 800px;
	height: 360px;
	position: relative;
	left: 780px;
	top: -770px;
}
.notice {
	position: relative;
	top: 0%;
	left: 0%;
	width: 50%;
	height: 100%;
	background: #212121 ;
}
.todo {
	width: 50%;
	height: 100%;
	background: #D4D4D4;
	position: relative;
	top: -100%;
	left: 50%;
}
.vacation {
position: relative;
	top: 0%;
	left: 0%;
	width: 33.3%;
	height: 100%;
	background: #111820 ;  
	
}
.business {
	width: 33.3%;
	height: 100%;
	background: #2C3E50;
	position: relative;
	top: -100%;
	left: 33.3%;

}
.events {
	width: 33.3%;
	height: 100%;
	background: #e9ebed;
	position: relative;
	top: -200%;
	left: 66%;

}
.circlegraph {
	width: 40%;
	height: 100%;
	background: #212121;
}
.squaregraph {
	padding:3%;
	width: 60%;
	height: 100%;
	position: relative;
	top: -100%;
	left: 40%;
}
.squarecontent{
color:white;
margin:5px;
 width: 100px;
 height:100px;
 background: #111820;
 float: left;
}
.squarecontent:hover{
 background: #233140;
}
.squarecontent .teamname{
position:relative;
top:5%;
left:5%;
font-size: 15px;
}
 .plusbutton{
position:absolute;
top:2%;
right:10%;
font-size: 30px;
font-weight: bold;
z-index:100;
text-decoration: none;
}

 .notice .plusbutton,.vacation .plusbutton,.business .plusbutton {
color: white;
}
.todo .plusbutton,.events .plusbutton{
color: #212121;
}
 .plusbutton:hover{
color: #4A4949;
}
.squarecontent .number{
position:relative;
top:30%;
left:20%;
font-size: 25px;
font-weight:bold; 
}
.divboard{
width: 90%;
margin: 10% 5% 5% 5%;
height:80%;
display: block;
overflow-y: auto;
}
.boardtable{
width: 100%;
font-size: 13px;
}
.boardtitle{
position:relative;
top:5%;
left:10%;
width:80%;
font-size: 20px;
font-weight: bold;
border-bottom: 2px solid;
}
.boardtable td:nth-child(2){
	text-align: right;
}
body ::-webkit-scrollbar {width: 12px; height: 12px;  }
body ::-webkit-scrollbar-button:start:decrement, 
body ::-webkit-scrollbar-button:end:increment {display: block; width: 12px;height: 12px; background: url() rgba(0,0,0,.05);}
body ::-webkit-scrollbar-track {     background: rgba(0,0,0,.05); }
body ::-webkit-scrollbar-thumb {  background: rgba(0,0,0,.1);  }

</style>
</head>
<body>

	<div id='calendar' class="calendar"></div>

	<div id='topright' class="topright">
		<div id='vacation' class="vacation" style="color: white;">
			<a class="plusbutton" href="javascript:createTab(36,0,'휴가관리');">+</a>
			<div class="boardtitle" style="border-bottom-color: white;">휴가</div>
			<div class="divboard">
				<table class="boardtable" id="noticetable">

					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>

				</table>

			</div>


		</div>
		<div id='business' class="business" style="color: white;">
			<a class="plusbutton" href="javascript:createTab(38,0,'출장관리');">+</a>
			<div class="boardtitle" style="border-bottom-color: white;">출장</div>
			<div class="divboard">
				<table class="boardtable" id="noticetable">

					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>

				</table>

			</div>
			
			
		</div>
		<div id='events' class="events" style="color: #111820;">
			<a class="plusbutton" href="doSearch()">+</a>
			<div class="boardtitle" style="border-bottom-color: #111820;">경조사</div>
			<div class="divboard">
				<table class="boardtable" id="noticetable">

					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>

				</table>

			</div>
			
		</div>
	</div>
	<div id='bottomleft' class="bottomleft">
		<div id='notice' class="notice" style="color: white;">
			<a class="plusbutton" href="doSearch()">+</a>
			<div class="boardtitle" style="border-bottom-color: white;">Notice</div>
			<div class="divboard">
				<table class="boardtable" id="noticetable">

					<tr>

						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
				</table>

			</div>



		</div>
		<div id='todo' class="todo" style="color: #212121;">
			<a class="plusbutton" href="doSearch()">+</a>
			<div class="boardtitle" style="border-bottom-color: #212121;">To
				Do</div>

			<div class="divboard">
				<table class="boardtable" id="noticetable">

					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>
					<tr>
						<td class="context">글제목</td>
						<td class="uploaddate">입력날짜</td>
					</tr>

				</table>

			</div>

		</div>
	</div>

	<div id='bottomright' class="bottomright">
		<div id='circlegraph' class="circlegraph">

		</div>
		<div id='squaregraph' class="squaregraph">

			<div id='squarecontent' class="squarecontent">
				<span class="teamname">인사<br>
				 </span>
				<span class="number">4/5
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">재무<br>
				 </span>
				<span class="number">12/13
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">영업<br>
				 </span>
				<span class="number">20/23
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">마케팅<br>
				 </span>
				<span class="number">5/6
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">총무<br>
				 </span>
				<span class="number">3/3
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">제조<br>
				 </span>
				<span class="number">46/51
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">기타<br>
				 </span>
				<span class="number">3/3
				 </span>
			</div>

		</div>
		 
		 
		
		 
	</div>

</body>
</html>
