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
		{Header:"부서이름",Type:"Text",Width:100,SaveName:"department_NAME",Align:"Center"},
		{Header:"부문코드",Type:"Text",Width:60,SaveName:"sector_CODE",Align:"Center"}, 
		{Header:"부문명",Type:"Text",Width:150,SaveName:"sector_NAME",Align:"Center"},
		{Header:"사용기간",Type:"Text",Width:120,SaveName:"department_TERM",Align:"Center"},
		{Header:"사업장코드",Type:"Text",Width:120,SaveName:"site_CODE",Align:"Center"}, 
		{Header:"사업장이름",Type:"Text",Width:120,SaveName:"site_NAME",Align:"Center"}, 

		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);
	mySheet.SetActionMenu("엑셀 파일 저장")
	
	


}
function mySheet_OnSelectMenu(text,code){
	if(text=="엑셀 파일 저장"){
	
	}
}
function doAction(sAction){
	switch(sAction){
	case "search":      //조회

		var param = FormQueryStringEnc(document.frm);
		mySheet.DoSearch("${contextPath}/p0003/searchList.do", param);

		break;
	case "reload":
		//조회 데이터 삭제
		mySheet.RemoveAll();
		break;
	case "save":
		mySheet.DoSave("${contextPath}/p0003/saveData.do");
		var tempStr = mySheet.GetSaveString();
		alert("서버로 전달되는 문자열 확인 :"+tempStr);

		break;
	case "save2":
		//저장 문자열 추출
		alert("저장될 문자열:"+ JSON.stringify(mySheet.GetSaveJson()));
		break;				
	case "insert":
		
		//신규행 추가
		var row = mySheet.DataInsert(-1);
		break;
	
	
	}
	
}




</script>

<script>



function selectSite(){
	

$.ajax({
	
    url:"${contextPath}/p0003/SiteList.do",//목록을 조회 할 url


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

  <script language="javascript">
  function showPopup() { window.open("${contextPath}/p0003/popup.do", "a", "width=600, height=500, left=100, top=50"); }
  </script>
  
</head>
<body onload="LoadPage()">
<br>
<br>
        <div class="main_content">
            <div class="exp_product">
           
            </div>
     <form name='frm'>
        사업장: <select id="SiteList">
        <option value="" selected>전체</option>
    
		</select>
      </form>
        
        
		
            <div class="ib_function float_right">
                <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
                <a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
                <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
                <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
                <a href="javascript:doAction('save2')" class="f1_btn_white gray">저장 JSON</a> 
            </div>
            
            <div class="clear hidden"></div>  

			<p class="subtit_sheet">부서등록</p>
			<input type="button" value="부문등록" onclick="showPopup();" />
            <div>
				<script>
					createIBSheet("mySheet", "100%", "500px");
					selectSite();
				</script>
				
            </div>
        </div>


</body>
</html>