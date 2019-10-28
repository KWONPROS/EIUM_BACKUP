<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
				{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
				{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
				{Header:"회사코드",Type:"Text",SaveName:"company_CODE",MinWidth:80, KeyField:1, Align:"Center"},
				{Header:"회사명",Type:"Text",SaveName:"company_NAME",MinWidth:170, KeyField:1, Align:"Center"},			
				{Header:"구분",Type:"Text",SaveName:"company_YN", KeyField:1},			
				{Header:"사업자 등록번호",Type:"Text",SaveName:"company_RESISTRATION_NUMBER", KeyField:1},			
				{Header:"법인등록번호",Type:"Text",SaveName:"company_CORPARATION_NUMBER", KeyField:1},
				{Header:"대표자성명",Type:"Text",SaveName:"company_REPRESENTATIVE_NAME", KeyField:1},
				{Header:"외국인여부",Type:"Text",SaveName:"company_REPRESENTATIVE_FOREIGN"},			
				{Header:"주민등록번호",Type:"Text",SaveName:"company_REPRESENTATIVE_NUMBER", KeyField:1},			
				{Header:"본점우편번호",Type:"Text",SaveName:"company_ZIP_CODE"},			
				{Header:"본점주소",Type:"Text",SaveName:"company_ADDRESS", KeyField:1},			
				{Header:"본점번지",Type:"Text",SaveName:"company_ADDRESS_DETAIL"},			
				{Header:"본점전화번호",Type:"Text",SaveName:"company_CONTACT"},			
				{Header:"본점 FAX",Type:"Text",SaveName:"company_FAX"},			
				{Header:"업체",Type:"Text",SaveName:"company_CATEGORY", KeyField:1},			
				{Header:"종목",Type:"Text",SaveName:"company_TYPE", KeyField:1},
				{Header:"설립연월일",Type:"Date",SaveName:"company_ESTABLISHED_DATE"},
				{Header:"개업연월일",Type:"Date",SaveName:"company_OPENBUSINESS_DATE"},
				{Header:"폐업연월일",Type:"Date",SaveName:"company_CLOSEBUSINESS_DATE"},
				{Header:"사용여부",Type:"Text",SaveName:"company_BUSINESS_YN", KeyField:1}
				
				];
			IBS_InitSheet(mySheet, initSheet);
			
			mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
			mySheet.SetSheetHeight(730);
			mySheet.DoSearch("${contextPath}/sm/p0001/searchList.do");
		}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction){
		case "search": // 조회
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/sm/p0001/searchList.do", param);
			//mySheet.DoSearch("transaction_data2.json");
			break;
		case "reload": //초기화
			//조회 데이터 삭제
			mySheet.RemoveAll();
			break;
		case "save": //저장
			var tempStr = mySheet.GetSaveString();
			alert("서버로 전달되는 문자열 확인 : " + tempStr);
			mySheet.DoSave("${contextPath}/sm/p0001/saveData.do");		
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
	
	//도로명주소검색 API
	function goPopup(){
		var pop = window.open("findAddress.do","addressPopup","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){

		document.form.site_ZIP_CODE.value = zipNo;	
		document.form.site_ADDRESS.value = roadAddrPart1;	
		document.form.site_ADDRESS_DETAIL.value = addrDetail;	
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
	<div class="ib_product">
		<script>
			//IBSheet 객체 생성 (객체 id, 너비, 높이)
			createIBSheet("mySheet", "100%", "100%");
		</script>
	</div>
	
	<form name="form" id="form" method="post">
		<div class="right">
			<table>
				<tr>
					<td>
				
			
			</table>
		</div>
	<div class="right">
		<table>
			<tr>
				<td>사업자등록번호</td>
				<td><input type="hidden" name="myRow"></td>
				<td><input type="text" name="company_RESISTRATION_NUMBER"
					maxlength="12" placeholder="___-__-_____" style="background: #F8FAE6;"></td>
			</tr>
			<tr>
				<td>법인등록번호</td>
				<td></td>
				<td><input type="text" name="company_CORPARATION_NUMBER"
					maxlength="14" placeholder="______-_______" ></td>
			</tr>
			<tr>
				<td>대표자성명</td>
				<td></td>
				<td><input type="text" name="company_REPRESENTATIVE_NAME" style="background: #F8FAE6;"></td>
			</tr>
			<tr>
				<td>외국인여부</td>
				<td></td>
				<td><select name=company_REPRESENTATIVE_FOREIGN style="background: #F8FAE6;"><option value='N' selected>0. 내국인</option><option value='Y' >1. 외국인</option></select></td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td></td>
				<td><input type="text" name="company_REPRESENTATIVE_NUMBER" style="background: #F8FAE6;"></td>
			</tr>
			<tr>
				<td>본점우편번호</td>
				<td></td>
				<td><input type="text" name="company_ZIP_CODE" id="company_ZIP_CODE" style="width: 50px;"><i class="fa fa-map-marked" onClick="goPopup();"></i></td>
			</tr>
			<tr>
				<td>본점주소</td>
				<td></td>
				<td><input type="text" name="company_ADDRESS" id="company_ADDRESS" style="width: 400px;background: #F8FAE6;"></td>
			</tr>
			<tr>
				<td>본점번지</td>
				<td></td>
				<td><input type="text" name="company_ADDRESS_DETAIL"  id="company_ADDRESS_DETAIL" style="width: 400px;"></td>
			</tr>
			<tr>
				<td>본점전화번호</td>
				<td></td>
				<td><input type="text" name="company_CONTACT"></td>
			</tr>
			<tr>
				<td>본점FAX</td>
				<td></td>
				<td><input type="text" name="company_FAX"></td>
			</tr>
			<tr>
				<td>업태</td>
				<td></td>
				<td><input type="text" name="company_CATEGORY" style="background: #F8FAE6;"></td>
			</tr>
			<tr>
				<td>종목</td>
				<td></td>
				<td><input type="text" name="company_TYPE" style="background: #F8FAE6;"></td>
			</tr>
			<tr>
				<td>설립연월일</td>
				<td></td>
				<td><input type="date" name="company_ESTABLISHED_DATE" style="width: 140px;"></td>
			</tr>
			<tr>
				<td>개업연월일</td>
				<td></td>
				<td><input type="date" name="company_OPENBUSINESS_DATE" style="width: 140px;"></td>
			</tr>
			<tr>
				<td>폐업연월일</td>
				<td></td>
				<td><input type="date" name="company_CLOSEBUSINESS_DATE" style="width: 140px;"></td>
			</tr>
			<tr>
				<td>사용여부</td>
				<td></td>
				<td><select name=company_BUSINESS_YN style="background: #F8FAE6;"><option value='N' selected>0. 미사용</option><option value='Y' >1. 사용</option></select></td>
			</tr>
		</table>		
	</div>
	</form>
  </div>
</body>
</html>