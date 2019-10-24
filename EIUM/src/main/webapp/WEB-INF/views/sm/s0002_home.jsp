<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
			{Header:"코드",Type:"Text",SaveName:"SITE_CODE",MinWidth:80,KeyField:1, Align:"Center"},
			{Header:"사업장명",Type:"Text",SaveName:"SITE_NAME",MinWidth:170,KeyField:1, Align:"Center"},			
			{Header:"사업자등록번호",Type:"Text",SaveName:"SITE_RESISTRATION_NUMBER",Hidden:1},			
			{Header:"법인등록번호",Type:"Text",SaveName:"SITE_CORPARATION_NUMBER",Hidden:1},			
			{Header:"대표자명",Type:"Text",SaveName:"SITE_REPRESENTATIVE_NAME",Hidden:1},			
			{Header:"사업장우편번호",Type:"Text",SaveName:"SITE_ZIP_CODE",Hidden:1},			
			{Header:"사업장주소",Type:"Text",SaveName:"SITE_ADDRESS",Hidden:1},			
			{Header:"사업장번지",Type:"Text",SaveName:"SITE_ADDRESS_DETAIL",Hidden:1},			
			{Header:"사업장전화번호",Type:"Text",SaveName:"SITE_CONTACT",Hidden:1},			
			{Header:"사업장팩스",Type:"Text",SaveName:"SITE_FAX",Hidden:1},			
			{Header:"업태",Type:"Text",SaveName:"SITE_CATEGORY",Hidden:1},			
			{Header:"종목",Type:"Text",SaveName:"SITE_TYPE",Hidden:1},			
			{Header:"개업연월일",Type:"Text",SaveName:"SITE_OPENBUSINESS_DATE",Hidden:1},			
			{Header:"폐업연월일",Type:"Text",SaveName:"SITE_CLOSEBUSINESS_DATE",Hidden:1},			
			{Header:"본점여부",Type:"Text",SaveName:"SITE_BUSINESS_AVAILABLE",Hidden:1}		
		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(730);

	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
			    var param = FormQueryStringEnc(document.frm);
				mySheet.DoSearch("${contextPath}/hm/s0002/searchList.do", param);
				//mySheet.DoSearch("transaction_data2.json");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				var tempStr = mySheet.GetSaveString();
				alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("${contextPath}/hm/s0002/saveData.do");
				break;			
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
				break;
		}
	}
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}	
	
</script>
<style type="text/css">

.title {
	color: #2C3E50;
	font-weight: bold;
	font-size: 20px;
	margin: 10px 0px 20px 0px;
	padding-left : 30px;
	padding-bottom: 10px;
	border-bottom: thin dashed #212121;
}
.buttons{
	margin-bottom: 20px;
	margin-right: 30px;
	position: relative;
	float: right;
}
.buttons .IBbutton {
	font-size: 13px;
	margin-left: 10px;
	background-color: #2B69A0;
	color: white;
	padding: 5px 15px;
	border-radius: 7px;
	text-decoration: none;	
}
.buttons .IBbutton:hover {
	background-color: #2C3E50;
}

</style>
</head>
<body onload="LoadPage()">

<div class = "contents">
<div class="title"> <header>등록정보관리 ▶ 사업장등록</header></div>
    
    
  
    <div class="buttons">
	  <a href="javascript:doAction('reload')" class="IBbutton">초기화</a>
	  <a href="javascript:doAction('insert')" class="IBbutton">추가</a>
	  <a href="javascript:doAction('search')" class="IBbutton">조회</a>
	  <a href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>


   <!-- 
      <form name='frm'>
        ID: <input type='text' id="p_cust_id" name="p_cust_id" /> 
      </form> -->
 

	  <div class=""><script>createIBSheet("mySheet", "100%", "100%");</script></div>


</div>
    
 
</body>
</html>