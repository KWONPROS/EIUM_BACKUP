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
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<script>



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
          title: 'Meeting',
          start: '2019-08-12T10:30:00',
          end: '2019-08-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2019-08-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2019-08-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2019-08-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2019-08-12T20:00:00'
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
  }); 

   

</script>
<style>
#calendar {
	margin: 20px 0 0 20px;
	max-width: 700px;
	font-size: 12px;
}

.topright {
	width: 800px;
	height: 420px;
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
	top: -750px;
}

.notice {
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
	width: 33.3%;
	height: 100%;
	background: #212121;  
}

.business {
	width: 33.3%;
	height: 100%;
	background: #D4D4D4;
	position: relative;
	top: -100%;
	left: 33.3%;
}

.events {
	width: 33.3%;
	height: 100%;
	background: #EBEBEB;
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
 background: #212121;
 float: left;
}
.squarecontent:hover{
 background: #4A4949;
}
.squarecontent .teamname{
position:relative;
top:5%;
left:5%;
font-size: 15px;

}
.bottomleft .plusbutton{
float:right;
position:relative;
margin :25px;
margin-right:35px;
font-size: 30px;
font-weight: bold;
z-index: 100;
text-decoration: none;
}
.bottomleft .notice .plusbutton{
color: white;
}
.bottomleft .todo .plusbutton{
color: #212121;
}
.bottomleft .plusbutton:hover{
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
margin: 5%;
height:70%;
display: block;
overflow-y: auto;
}
.boardtable{
width: 100%;
font-size: 13px;
}
.boardtitle{
position:relative;
top:10%;
left:10%;
width:80%;
font-size: 20px;
font-weight: bold;
border-bottom: 2px solid;
}
.boardtable .uploaddate{
	text-align: right;
}
.bottomleft ::-webkit-scrollbar {width: 12px; height: 12px;  }
.bottomleft ::-webkit-scrollbar-button:start:decrement, 
.bottomleft ::-webkit-scrollbar-button:end:increment {display: block; width: 12px;height: 12px; background: url() rgba(0,0,0,.05);}
.bottomleft ::-webkit-scrollbar-track {     background: rgba(0,0,0,.05); }
.bottomleft ::-webkit-scrollbar-thumb {  background: rgba(0,0,0,.1);  }

</style>
</head>
<body>

	<div id='calendar' class="calendar"></div>

	<div id='topright' class="topright">
		<div id='vacation' class="vacation"></div>
		<div id='business' class="business"></div>
		<div id='events' class="events"></div>
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
				<span class="teamname">인사
				 </span>
				<span class="number">00/20
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">재무
				 </span>
				<span class="number">00/20
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">영업
				 </span>
				<span class="number">00/20
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">마케팅
				 </span>
				<span class="number">00/20
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">총무
				 </span>
				<span class="number">00/20
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">제조
				 </span>
				<span class="number">00/20
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">기타
				 </span>
				<span class="number">00/20
				 </span>
			</div>

		</div>
		 
	</div>

</body>
</html>
