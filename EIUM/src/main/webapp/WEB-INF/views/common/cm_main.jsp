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
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction',  'dayGrid', 'timeGrid', 'list', 'bootstrap' ],
      themeSystem: 'bootstrap',
      locale:'ko',
      height:450,
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
  	margin:20px 0 0 20px;
     max-width: 800px;
     font-size:12px;
  }



</style>
</head>
<body>

  <div id='calendar' class="calendar"></div>

</body>
</html>
