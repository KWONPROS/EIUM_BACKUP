<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
			
			{Header:"코드",Type:"Text",SaveName:"admin_CODE",MinWidth:80,KeyField:1, Align:"Center"},
			{Header:"관리항목명",Type:"Text",SaveName:"admin_NAME",MinWidth:170,KeyField:1, Align:"Center"},			
			{Header:"관리내역코드",Type:"Text",SaveName:"admin_LIST_CODE",KeyField:1 ,Hidden:1},			
			{Header:"관리내역명",Type:"Text",SaveName:"admin_LIST_NAME",Hidden:1},			
			{Header:"테이블물리명",Type:"Text",SaveName:"admin_TABLE_NAME",KeyField:1,Hidden:1 }			
		
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(700);
		
		
		//아이비시트2 -----------------------------------------------------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet2.Cols = [
			
	     	{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},	
			{Header:"코드",Type:"Text",SaveName:"admin_LIST_CODE",KeyField:1},			
			{Header:"관리내역명",Type:"Text",SaveName:"admin_LIST_NAME"}					
		
		];   
		IBS_InitSheet( mySheet2 , initSheet2);
  
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(700);
		
		
		
		
		mySheet.DoSearch("${contextPath}/sm/p0002/searchList.do");
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
				mySheet.DoSearch("${contextPath}/sm/p0002/searchList.do");
				break;
				
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
			 	mySheet.SetCellValue($('input[name=myRow]').val(),4,$('input[name=site_RESISTRATION_NUMBER]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),5,$('input[name=site_CORPARATION_NUMBER]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),6,$('input[name=site_REPRESENTATIVE_NAME]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),7,$('input[name=site_ZIP_CODE]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),8,$('input[name=site_ADDRESS]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),9,$('input[name=site_ADDRESS_DETAIL]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),10,$('input[name=site_CONTACT]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),11,$('input[name=site_FAX]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),12,$('input[name=site_CATEGORY]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),13,$('input[name=site_TYPE]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),14,$('input[name=site_OPENBUSINESS_DATE]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),15,$('input[name=site_CLOSEBUSINESS_DATE]').val());
				mySheet.SetCellValue($('input[name=myRow]').val(),16,$('select[name=site_BUSINESS_AVAILABLE]').val()); 
				
				var tempStr = mySheet.GetSaveString();
				alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("${contextPath}/sm/p0002/saveData.do");
				break;			
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
				break;
		}
	}
	
	//로우 클릭시
	function mySheet_OnClick(Row, Col) {
		if(Row!=0){
		$('input[name=myRow]').val(Row);
	
	
       $('input[name=site_RESISTRATION_NUMBER]').val(mySheet.GetCellValue(Row,4));
      $('input[name=site_CORPARATION_NUMBER]').val(mySheet.GetCellValue(Row,5)); 
      $('input[name=site_REPRESENTATIVE_NAME]').val(mySheet.GetCellValue(Row,6));
      $('input[name=site_ZIP_CODE]').val(mySheet.GetCellValue(Row,7));
      $('input[name=site_ADDRESS]').val(mySheet.GetCellValue(Row,8));
      $('input[name=site_ADDRESS_DETAIL]').val(mySheet.GetCellValue(Row,9));
      $('input[name=site_CONTACT]').val(mySheet.GetCellValue(Row,10));
      $('input[name=site_FAX]').val(mySheet.GetCellValue(Row,11));
      $('input[name=site_CATEGORY]').val(mySheet.GetCellValue(Row,12));
      $('input[name=site_TYPE]').val(mySheet.GetCellValue(Row,13));
      $('input[name=site_OPENBUSINESS_DATE]').val(mySheet.GetCellValue(Row,14));
      $('input[name=site_CLOSEBUSINESS_DATE]').val(mySheet.GetCellValue(Row,15));
      $('select[name=site_BUSINESS_AVAILABLE]').val(mySheet.GetCellValue(Row,16));
		}
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
		            $('input[name=site_RESISTRATION_NUMBER]').keydown(function (event) {
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
		      $('input[name=site_CORPARATION_NUMBER]').keydown(function (event) {
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
         $('.siteNUM').keydown(function (event) {
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
top: -570px;
left: 500px; 

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
<header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 기초환경설정 : 호봉테이블등록</header>
</div>
	<div class="left"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
	<div class="right"><script>createIBSheet("mySheet2", "100%", "100%");</script></div>
</body>
</html>