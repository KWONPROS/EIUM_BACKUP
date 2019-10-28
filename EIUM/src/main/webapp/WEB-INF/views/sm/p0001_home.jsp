<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사등록</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
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
		initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0}
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
				{Header:"상태",Type:"Status",SaveName:"sStatus",MinWidth:50, Align:"Center"},
				{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
				{Header:"회사코드",Type:"Text",SaveName:"company_CODE",MinWidth:80,KeyField:1, Align:"Center"},
				{Header:"회사명",Type:"Text",SaveName:"company_NAME",MinWidth:170,KeyField:1, Align:"Center"},			
				{Header:"구분",Type:"Text",SaveName:"company_YN"},			
				{Header:"사업자 등록번호",Type:"Text",SaveName:"company_RESISTRATION_NUMBER"},			
				{Header:"법인등록번호",Type:"Text",SaveName:"company_CORPARATION_NUMBER"},
				{Header:"대표자성명",Type:"Text",SaveName:"company_REPRESENTATIVE_NAME"},
				{Header:"외국인여부",Type:"Text",SaveName:"company_REPRESENTATIVE_FOREIGN"},			
				{Header:"주민등록번호",Type:"Text",SaveName:"company_REPRESENTATIVE_NUMBER"},			
				{Header:"본점우편번호",Type:"Text",SaveName:"company_ZIP_CODE"},			
				{Header:"본점주소",Type:"Text",SaveName:"company_ADDRESS"},			
				{Header:"본점번지",Type:"Text",SaveName:"company_ADDRESS_DETAIL"},			
				{Header:"번점전화번호",Type:"Text",SaveName:"company_CONTACT"},			
				{Header:"본점 FAX",Type:"Text",SaveName:"company_FAX"},			
				{Header:"업체",Type:"Text",SaveName:"company_CATEGORY"},			
				{Header:"종목",Type:"Text",SaveName:"company_TYPE"},
				{Header:"설립연월일",Type:"Date",SaveName:"company_ESTABLISHED_DATE"},
				{Header:"개업연월일",Type:"Date",SaveName:"company_OPENBUSINESS_DATE"},
				{Header:"폐업연월일",Type:"Date",SaveName:"company_CLOSEBUSINESS_DATE"},
				{Header:"사용여부",Type:"Text",SaveName:"company_BUSINESS_YN"}
				
				];
			IBS_InitSheet(mySheet, initSheet);
			mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
			mySheet.SetSheetHeight(730);
			mySheet.SetSheetWidth(2000);
		}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction){
		case "search": // 조회
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/p0001/searchList.do", param);
			//mySheet.DoSearch("transaction_data2.json");
			break;
		case "reload": //초기화
			//조회 데이터 삭제
			mySheet.RemoveAll();
			break;
		case "save": //저장
			var tempStr = mySheet.GetSaveString();
			alert("서버로 전달되는 문자열 확인 : " + tempStr);
			mySheet.DoSave("${contextPath}/p0001/saveData.do");		
			break;
		case "save2": //저장 JSON
		//저장 문자열 추출
			alert("저장될 문자열:" + JSON.stringify(mySheet.GetSaveJson()));
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

</head>
<body onload="LoadPage()">
	<div class="page_title">
   <span><a class="closeDepth" href="#">closeDepth</a></span>
    <span class="title">등록정보관리 ▶<b> 회사등록</b></span>
  </div>
  <div class="main_content">
    
    <div class="exp_product">
      <form name='frm'>
        	회사 CODE: <input type='text' id="p_company_CODE" name="p_company_CODE" /> 
      </form>
    </div>
    <div class="ib_function float_right">
	  <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
	  <a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
	  <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
	  <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
	  <a href="javascript:doAction('save2')" class="f1_btn_white gray">저장 JSON</a> 
	</div>

	<div class="clear hidden"></div>
	<div class="ib_product"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
  </div>
</body>
</html>