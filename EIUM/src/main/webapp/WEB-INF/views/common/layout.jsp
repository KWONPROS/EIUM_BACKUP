<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
#container {
	width: 100%;
	text-align: left;
	border: 0px solid #bcbcbc;
}
#header {
	width: calc(100% - 190px);
	height: 30px;                   
	position : absolute;
	top: 5px;
	left: 190px;
	border: 0px solid #bcbcbc;               
}
#sidebar-left {
	width: 190px;
	height: 100%;
	background-color: #E0E0E0;
	border: 0px solid #bcbcbc;
	font-size: 10px;
}
#content {
	width: calc(100% - 190px);
	height: 100%;
	position: absolute;
	top: 30px;
	left: 190px;    
	border: 0px solid #bcbcbc;
}
#footer {
	width: 100%;      
	position: relative;        
	padding:1px;      
	border: 0px solid #bcbcbc;
	background-color: #212121;
	color: white;
}
</style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body topmargin="0"  leftmargin="0" marginwidth="0" marginheight="0">
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
      </div>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>