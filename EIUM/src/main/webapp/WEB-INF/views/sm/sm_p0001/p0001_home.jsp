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
				{Header:"구분",Type:"Combo",SaveName:"company_YN", KeyField:1, MinWidth:80, Edit: 1, ComboText:"0. 법인|1. 개인", ComboCode:"0|1", Align:"Center"},			
				{Header:"사업자 등록번호",Type:"Text",SaveName:"company_RESISTRATION_NUMBER", KeyField:1, Hidden:1},			
				{Header:"법인등록번호",Type:"Text",SaveName:"company_CORPARATION_NUMBER", KeyField:1, Hidden:1},
				{Header:"대표자성명",Type:"Text",SaveName:"company_REPRESENTATIVE_NAME", KeyField:1, Hidden:1},
				{Header:"외국인여부",Type:"Text",SaveName:"company_REPRESENTATIVE_FOREIGN",Hidden:1},			
				{Header:"주민등록번호",Type:"Text",SaveName:"company_REPRESENTATIVE_NUMBER", KeyField:1, Hidden:1},			
				{Header:"본점우편번호",Type:"Text",SaveName:"company_ZIP_CODE" ,Hidden:1},			
				{Header:"본점주소",Type:"Text",SaveName:"company_ADDRESS", KeyField:1 ,Hidden:1},			
				{Header:"본점번지",Type:"Text",SaveName:"company_ADDRESS_DETAIL", KeyField:1 ,Hidden:1},			
				{Header:"본점전화번호",Type:"Text",SaveName:"company_CONTACT" ,Hidden:1},			
				{Header:"본점 FAX",Type:"Text",SaveName:"company_FAX" ,Hidden:1},			
				{Header:"업체",Type:"Text",SaveName:"company_CATEGORY", KeyField:1 ,Hidden:1},			
				{Header:"종목",Type:"Text",SaveName:"company_TYPE", KeyField:1 ,Hidden:1},
				{Header:"설립연월일",Type:"Date",SaveName:"company_ESTABLISHED_DATE" ,Hidden:1},
				{Header:"개업연월일",Type:"Date",SaveName:"company_OPENBUSINESS_DATE" ,Hidden:1},
				{Header:"폐업연월일",Type:"Date",SaveName:"company_CLOSEBUSINESS_DATE" ,Hidden:1},
				{Header:"사용여부",Type:"Text",SaveName:"company_BUSINESS_YN", KeyField:1 ,Hidden:1}
				
				];
			IBS_InitSheet(mySheet, initSheet);
			
			mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
			mySheet.SetSheetHeight(500);
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
			mySheet.SetCellValue($('input[name=myRow]').val(),5,$('input[name=company_RESISTRATION_NUMBER]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),6,$('input[name=company_CORPARATION_NUMBER]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),7,$('input[name=company_REPRESENTATIVE_NAME]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),8,$('select[name=company_REPRESENTATIVE_FOREIGN]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),9,$('input[name=company_REPRESENTATIVE_NUMBER]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),10,$('input[name=company_ZIP_CODE]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),11,$('input[name=company_ADDRESS]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),12,$('input[name=company_ADDRESS_DETAIL]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),13,$('input[name=company_CONTACT]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),14,$('input[name=company_FAX]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),15,$('input[name=company_CATEGORY]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),16,$('input[name=company_TYPE]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),17,$('input[name=company_ESTABLISHED_DATE]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),18,$('input[name=company_OPENBUSINESS_DATE]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),19,$('input[name=company_CLOSEBUSINESS_DATE]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(),20,$('select[name=company_BUSINESS_YN]').val()); 
			
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
	
	//로우 클릭시
	function mySheet_OnClick(Row, Col){
		if(Row!=0){
			$('input[name=myRow]').val(Row);
			$('input[name=company_RESISTRATION_NUMBER]').val(mySheet.GetCellValue(Row,5));
		    $('input[name=company_CORPARATION_NUMBER]').val(mySheet.GetCellValue(Row,6));
		    $('input[name=company_REPRESENTATIVE_NAME]').val(mySheet.GetCellValue(Row,7));
		    $('select[name=company_REPRESENTATIVE_FOREIGN]').val(mySheet.GetCellValue(Row,8));
		    $('input[name=company_REPRESENTATIVE_NUMBER]').val(mySheet.GetCellValue(Row,9));
		    $('input[name=company_ZIP_CODE]').val(mySheet.GetCellValue(Row,10));
		    $('input[name=company_ADDRESS]').val(mySheet.GetCellValue(Row,11));
		    $('input[name=company_ADDRESS_DETAIL]').val(mySheet.GetCellValue(Row,12));
		    $('input[name=company_CONTACT]').val(mySheet.GetCellValue(Row,13));
		    $('input[name=company_FAX]').val(mySheet.GetCellValue(Row,14));
		    $('input[name=company_CATEGORY]').val(mySheet.GetCellValue(Row,15));
		    $('input[name=company_TYPE]').val(mySheet.GetCellValue(Row,16));
		    $('input[name=company_ESTABLISHED_DATE]').val(mySheet.GetCellValue(Row,17));
		    $('input[name=company_OPENBUSINESS_DATE]').val(mySheet.GetCellValue(Row,18));
		    $('input[name=company_CLOSEBUSINESS_DATE]').val(mySheet.GetCellValue(Row,19));
		    $('select[name=company_BUSINESS_YN]').val(mySheet.GetCellValue(Row,20));
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
	
	//Formating
	   $(document).ready(function () {
	   
	        //사업자등록번호
	         $(function () {    
	                  $('input[name=company_RESISTRATION_NUMBER]').keydown(function (event) {
	                   var key = event.charCode || event.keyCode || 0;
	                   $text = $(this); 
	                   if (key !== 8 && key !== 9) {
	                       if ($text.val().length === 3) {
	                           $text.val($text.val() + '-');
	                       }
	                       if ($text.val().length === 6) {
	                           $text.val($text.val() + '-');
	                       }
	                   }
	                   return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	               })
	         });
	            //법인등록번호
	         $(function () {            
	            $('input[name=company_CORPARATION_NUMBER]').keydown(function (event) {
	                 var key = event.charCode || event.keyCode || 0;
	                 $text = $(this); 
	                 if (key !== 8 && key !== 9) {
	                     if ($text.val().length === 6) {
	                         $text.val($text.val() + '-');
	                     }       
	                 }
	                   return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	               })
	         });

	   
	   //전화번호,팩스
	   $(function () { 
	         $('.companyNUM').keydown(function (event) {
	        var key = event.charCode || event.keyCode || 0;
	        $text = $(this);
	        if (key !== 8 && key !== 9) {
	           if($text.val().substr(0,2)=='02'){
	              if ($text.val().length === 2) {
	                    $text.val($text.val() + '-');
	                }
	                if ($text.val().length === 6) {
	                    $text.val($text.val() + '-');
	                }
	           }else{
	              if ($text.val().length === 3) {
	                    $text.val($text.val() + '-');
	                }
	                if ($text.val().length === 8) {
	                    $text.val($text.val() + '-');
	                }
	           }
	      
	        }
	        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	    })
	   }); 
	 
	      
	});//document.ready
	
	//도로명주소검색 API //변경!!!!!!!!!!!!!!!!주의
	function goPopup(){
		var pop = window.open("findAddress.do","addressPopup","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){

		document.form.company_ZIP_CODE.value = zipNo;	
		document.form.company_ADDRESS.value = roadAddrPart1;	
		document.form.company_ADDRESS_DETAIL.value = addrDetail;	
	}
</script>

<style type="text/css">

 .title {
    width:100%;
   color: #2C3E50;
   font-weight: bold;
   font-size: 20px;
   padding-left : 30px;
   padding-bottom: 10px;
   padding-top:20px;
   border-top: thin solid #5E5E5E;
   border-bottom: thin dashed #5E5E5E;
   position: absolute;
   top: 50px;

}
.leftbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   left: 0px;
}
.rightbuttons{
   margin-top:40px;
   margin:10px;
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
.left{
position: relative;
top: 130px;
left: 60px;
}
.right{
position: relative;
top: -350px;
left: 600px;
width: 900px;
background: #EDF0F5;
border-radius: 10px;
}

.innerheader{
position:relative;
margin:20px;
top:20px;
left:10px;
}

.right table{
font-size:13px;
font-weight:bold;
position: relative;
left: 40px;
padding:10px;
}
.right table tr td:nth-child(1){
text-align:right;
}
.right table tr td:nth-child(2){
width: 20px;
height: 25px;
}
.right table tr td:nth-child(3) input{
width: 130px;
height: 20px;
padding-left: 10px;
margin-right:10px;
box-sizing: border-box;
border: 1px solid #CCCCCC;
border-radius: 2px;
} 
</style>

</head>
<body onload="LoadPage()" style="overflow-x: hidden">
 <div class="leftbuttons">
      <a href="javascript:doAction('print')" class="IBbutton">인쇄</a> <a
         href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
   </div> 


   <div class="rightbuttons">
      <a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a
         href="javascript:doAction('insert')" class="IBbutton">추가</a> <a
         href="javascript:doAction('search')" class="IBbutton">조회</a> <a
         href="javascript:doAction('save')" class="IBbutton">저장</a>
   </div>

<div class="title"> 
<header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 : 회사등록</header>
</div>
	<div class="left">
	
		<script>
			//IBSheet 객체 생성 (객체 id, 너비, 높이)
			createIBSheet("mySheet", "100%", "100%");
		</script>
	</div>
	
	<form name="form" id="form" method="post">
		
	<div class="right">
	<h3 class="innerheader">기본정보</h3>
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
				<td><input type="text" name="company_ZIP_CODE" id="company_ZIP_CODE" style="width: 50px;"><a href="javascript:goPopup();"><i class="fa fa-map-o" > 주소 검색</i></a></td>
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
				<td><input type="text" name="company_CONTACT" id="site_CONTACT" placeholder="__-___-____" class="companyNUM" maxlength="13"></td>
			</tr>
			<tr>
				<td>본점FAX</td>
				<td></td>
				<td><input type="text" name="company_FAX" id="site_FAX" placeholder="__-___-____" class="siteNUM" maxlength="13" ></td>
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