<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

<script type="text/javascript">
var pageheightoffset = 200; //시트높이 계산용
function setDepartment(){
	
	 department_code=document.getElementById("Pdepartment_code").value;
	 department_name=document.getElementById("Pdepartment_name").value;
	mySheet.SetCellText(row,col,department_code);
	mySheet.SetCellText(row,col+1,department_name);


	
};

//sheet 기본설정
function LoadPage(){
   
   mySheet.RemoveAll();
   //아이비시트 초기화
   var initSheet = {};
   initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1,MouseHoverMode:2};
   initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:12,HeaderCheck:1};
   initSheet.Cols=[
	   {Header:"상태",SaveName:"sStatus",Type:"Status",align:"Center",width:50},
	   {Header:"삭제",SaveName:"DEL_CHK",Type:"DelCheck"},
	   {Header:"사원코드",SaveName:"employee_code",Type:"Text",width:100, KeyField:1, UpdateEdit:"0"},
	   {Header:"사원명",SaveName:"employee_name",Type:"Text",width:100, KeyField:1 },
	   {Header:"부서코드", Type:"Text", SaveName:"department_code",Width:100, Align: "Center", InsertEdit:"0", UpdateEdit:"0", KeyField:1},
	   {Header:"부서명",SaveName:"department_name",type:"Text",width:100, InsertEdit:"0", UpdateEdit:"0", KeyField:1},
	   {Header:"입사일",Type:"Date", Align:"Center", SaveName:"employee_start_date", Format:"yyyy-MM-dd", MinWidth:110},
	   {Header:"퇴사일",Type:"Date", Align:"Center", SaveName:"employee_resignation_date", Format:"yyyy-MM-dd", MinWidth:110},
	   {Header:"사용자여부",Type:"Combo", MinWidth:70, SaveName:"employee_available_yn", ComboText:"Y|N", ComboCode:"01|02",PopupText:"Y|N"},
	   {Header:"아이디",SaveName:"employee_id",type:"Text",width:100, KeyField:1, UpdateEdit:"0"},
	   {Header:"암호",SaveName:"employee_password",type:"Text", KeyField:1, width:100},
	   {Header:"전화번호",Type:"Text", Align:"Center", SaveName:"contact", Format:"PhoneNo", MinWidth:120},
	      ];
   
  
   IBS_InitSheet(mySheet,initSheet);
   mySheet.SetEditableColorDiff(1);
   mySheet.SetActionMenu("엑셀 파일 저장");
   mySheet.SetSelectionMode(1);

}

function mySheet_OnDblClick(Row,Col,Value){
	row=Row;
	col=Col;
	
	if(Col=="4"){
		
	window.open("${contextPath}/sm/p0004/department_Search.do", "a", "width=500, height=700, left=100, top=50"); 
	}
	if(Col=="5"){
		
		window.open("${contextPath}/sm/p0004/department_Search.do", "a", "width=500, height=700, left=100, top=50"); 
		}
}
function doAction(sAction){
   switch(sAction){
   case "search":
      mySheet.DoSearch("${contextPath}/sm/p0004search.do");
      break;
   case "reload":
      mySheet.RemoveAll();
      break;
   case "save":
     mySheet.DoSave("${contextPath}/sm/p0004/saveData.do");
      var tempStr = mySheet.GetSaveString();
      break;
           
   case "insert":
      var row = mySheet.DataInsert();
      break;
   
   }
}
   
   
  
   


function selectDepart(){
	

	$.ajax({
		
	    url:"${contextPath}/sm/p0004/DepartList.do",//목록을 조회 할 url


	    type:"POST",

	    dataType:"JSON",

	    success:function(data){    

	      for(var i = 0; i < data['Data'].length ; i++){
		
	    
	        var option = "<option value='" + data['Data'][i].department_code + "'>" +data['Data'][i].department_code+ "</option>";        

	        //대상 콤보박스에 추가

	        $('#DepartList').append(option);

	      }

	    },

	    error:function(jqxhr, status, error){

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
</style> 
</head>
<body onload="LoadPage()">


<!--    <form name="frm"> -->
  <div class="leftbuttons">
      <a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
   </div> 


   <div class="rightbuttons">
      <a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a
         href="javascript:doAction('insert')" class="IBbutton">추가</a> <a
         href="javascript:doAction('search')" class="IBbutton">조회</a> <a
         href="javascript:doAction('save')" class="IBbutton">저장</a>
   </div>

<div class="title"> 
<header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 : 사원등록</header>
</div>

<!--  &nbsp;&nbsp; 사업장 : <select name="sa_Name">
        <option>나의 사업장</option>
        <option>너의 사업장</option>
        <option>우리의 사업장</option>
      </select>
      
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 부서 : <select name="sa_Dept">
        <option>인사</option>
        <option>아싸</option>
        <option>안사</option>
      </select>
      
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <select name="sa_Select">
          <option>사원명</option>
          <option>사원코드</option>
       </select>
       
       <input type="text" placeholder="내용을 입력해주세요.">  -->

<div style="position:absolute; top:150px; left:20px;">
<script>
       createIBSheet("mySheet", "1500px", "600px");
</script>
</div>

<!-- <div style="position:absolute; top:100px; left:400px;">
<script>
createIBSheet("mySheet2", "1500px", "600px");
</script>
</div> -->

	<input type="hidden" id="Pdepartment_code">
	<input type="hidden" id="Pdepartment_name">

<!--    </form>
 --></body>
</html>