<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.rightbuttons {
	margin-top: 40px;
	margin: -15px;
	position: absolute;
	right: 80px;
	top: 30px;
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
	top: 5px;
}

.rightbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	right: 5px;
	top: 5px;
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

.sheet {
	position: relative;
	top: 200px; . left { position : absolute;
	top: 250px;
	left: 40px;
}

#searchBar {
	background: #EBEBEB;
	padding: 10px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius: 5px;
	position: relative;
	top: 300px;
	width: 100px;
}

.leftbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	left: 0px;
	top: 0px;
}

.right {
	position: relative;
	top: -330px;
	left: 330px;
}

.bottom {
	position: relative;
	top: -310px;
	left: 320px;
}

.site {
	position: relative;
	top: 300px;
}
</style>
<meta charset="UTF-8">
<title>부서등록</title>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<script type="text/javascript">
var pageheightoffset = 200; //시트높이 계산용


//sheet 기본설정
function LoadPage(){
	mySheet.RemoveAll();
	//아이비시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[
		{Header:"상태",Type:"Status",Width:60,SaveName:"Status",Align:"Center"},
		{Header:"삭제	",Type:"DelCheck",Width:60,SaveName:"Delete",Align:"Center"},
		{Header:"부서코드",Type:"Text",Width:100,SaveName:"department_CODE",Align:"Center",UpdateEdit:0},
		{Header:"부서명",Type:"Text",Width:100,SaveName:"department_NAME",Align:"Center"},
		{Header:"사업장코드",Type:"Popup",Width:120,SaveName:"site_CODE",Align:"Center"}, 
		{Header:"사업장이름",Type:"Text",Width:120,SaveName:"site_NAME",Align:"Center",UpdateEdit:0}, 
		{Header:"부문코드",Type:"Popup",Width:60,SaveName:"sector_CODE",Align:"Center"}, 
		{Header:"부문명",Type:"Text",Width:150,SaveName:"sector_NAME",Align:"Center",UpdateEdit:0},
		{Header:"사용기간",Type:"Date",Width:120,SaveName:"department_TERM",Align:"Center"},
		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);
	mySheet.SetActionMenu("엑셀 파일 저장")

}



	function mySheet_OnPopupClick(Row,Col){
		if(Col=="4"){
			
			window.open("${contextPath}/sm/p0003/siteSearch_Init.do", "a", "width=500, height=700, left=100, top=50"); 

			}
		if (Col=="6"){
			window.open("${contextPath}/sm/p0003/sectorSearch_Init.do", "a", "width=500, height=700, left=100, top=50");	

		}
	
	}
	

function mySheet_OnSelectMenu(text,code){
	if(text=="엑셀 파일 저장"){
	
	}
}
function doAction(sAction){
	switch(sAction){
	case "search":      //조회

		var param = FormQueryStringEnc(document.frm);
		mySheet.DoSearch("${contextPath}/sm/p0003/searchList.do", param);

		break;
	case "reload":
		//조회 데이터 삭제
		mySheet.RemoveAll();
		break;
	case "save":
		mySheet.DoSave("${contextPath}/sm/p0003/saveData.do")

		break;
	case "insert":
		
		//신규행 추가
		var row = mySheet.DataInsert(-1);
		break;
	case "down":
		mySheet.Down2Excel();	
		break;
	
	
	}
	
}


function siteValue(rowData){
	mySheet.SetRowData(mySheet.GetSelectRow(),rowData);
}
function sectorValue(rowData){
	mySheet.SetRowData(mySheet.GetSelectRow(),rowData);
}
</script>

<script>



function selectSite(){
	

$.ajax({
	
    url:"${contextPath}/sm/p0003/SiteList.do",//목록을 조회 할 url


    type:"POST",

    dataType:"JSON",

    success:function(data){    

      for(var i = 0; i < data['Data'].length ; i++){
	
    
        var option = "<option value='" + data['Data'][i].site_NAME + "'>" +data['Data'][i].site_NAME+ "</option>";        

        //대상 콤보박스에 추가

        $('#SiteList').append(option);

      }

    },

    error:function(jqxhr, status, error){

      alert("에러");

    }

  });

};
</script>

  <script>
  function showPopup() { window.open("${contextPath}/sm/p0003/registSector_p01.do", "a", "width=600, height=500, left=100, top=50"); }
  </script>
  
</head>
<body onload="LoadPage()">

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 :
			부서등록
		</header>
	</div>

     <form name='frm'>

		<div id="searchBar">
			사업장: <select id="SiteList">
				<option value="" selected>전체</option>
			</select>
		</div>


	</form>
        

             <div class="rightbuttons">
                <a href="javascript:showPopup()" class="IBbutton">부문등록</a>
                <a href="javascript:doAction('reload')" class="IBbutton">초기화</a>
                <a href="javascript:doAction('search')" class="IBbutton">조회</a>
                <a href="javascript:doAction('insert')" class="IBbutton">추가</a>
                <a href="javascript:doAction('save')" class="IBbutton">저장</a>
            </div>
            
            <div class="clear hidden"></div>  

        <div class="leftbuttons">  
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
        </div> 
        
            <div class="sheet">
				<script>
					createIBSheet("mySheet", "100%", "500px");
					selectSite();
				</script>
				
            </div>

	

</body>
</html>