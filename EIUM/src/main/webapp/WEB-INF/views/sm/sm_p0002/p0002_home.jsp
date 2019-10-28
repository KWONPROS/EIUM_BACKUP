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
      mySheet.RemoveAll();
      
      //아이비시트 초기화
      var initSheet = {};
      initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
      initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
      initSheet.Cols = [
         {Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
         {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
         {Header:"코드",Type:"Text",SaveName:"site_CODE",MinWidth:80,KeyField:1, Align:"Center"},
         {Header:"사업장명",Type:"Text",SaveName:"site_NAME",MinWidth:170,KeyField:1, Align:"Center"},         
         {Header:"사업자등록번호",Type:"Text",SaveName:"site_RESISTRATION_NUMBER",KeyField:1 ,Hidden:1},         
         {Header:"법인등록번호",Type:"Text",SaveName:"site_CORPARATION_NUMBER",Hidden:1},         
         {Header:"대표자명",Type:"Text",SaveName:"site_REPRESENTATIVE_NAME",KeyField:1,Hidden:1 },         
         {Header:"사업장우편번호",Type:"Text",SaveName:"site_ZIP_CODE",Hidden:1},         
         {Header:"사업장주소",Type:"Text",SaveName:"site_ADDRESS",KeyField:1,Hidden:1},         
         {Header:"사업장번지",Type:"Text",SaveName:"site_ADDRESS_DETAIL",Hidden:1},         
         {Header:"사업장전화번호",Type:"Text",SaveName:"site_CONTACT",Hidden:1},         
         {Header:"사업장팩스",Type:"Text",SaveName:"site_FAX",Hidden:1},         
         {Header:"업태",Type:"Text",SaveName:"site_CATEGORY",KeyField:1,Hidden:1},         
         {Header:"종목",Type:"Text",SaveName:"site_TYPE",KeyField:1,Hidden:1},         
         {Header:"개업연월일",Type:"Text",SaveName:"site_OPENBUSINESS_DATE",Hidden:1},
         {Header:"폐업연월일",Type:"Text",SaveName:"site_CLOSEBUSINESS_DATE",Hidden:1},
         {Header:"본점여부",Type:"Text",SaveName:"site_BUSINESS_AVAILABLE",KeyField:1,Hidden:1}
      ];   
      IBS_InitSheet( mySheet , initSheet);
  
      mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
      mySheet.SetSheetHeight(700);
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
top: -550px;
left: 500px;
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
<header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 : 사업장등록</header>
</div>

   <div class="left"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
    
    
    <form name="form" id="form" method="post">
    <div class="right" >
      <h3 class="innerheader">기본정보</h3>
      <table>
         <tr>
            <td>사업자등록번호</td>
            <td><input type="hidden" name="myRow"></td>
            <td><input type="text" name="site_RESISTRATION_NUMBER"
               maxlength="12" placeholder="___-__-_____" style="background: #F8FAE6;"></td>
         </tr>
         <tr>
            <td>법인등록번호</td>
            <td></td>
            <td><input type="text" name="site_CORPARATION_NUMBER"
            maxlength="14" placeholder="______-_______" ></td>
         </tr>
         <tr>
            <td>대표자명</td>
            <td></td>
            <td><input type="text" name="site_REPRESENTATIVE_NAME" style="background: #F8FAE6;"></td>
         </tr>
         <tr>
            <td>사업장우편번호</td>
            <td></td>
            <td><input type="text" name="site_ZIP_CODE" id="site_ZIP_CODE" style="width: 50px;"><a href="javascript:goPopup();"><i class="fa fa-map-o" > 주소 검색</i></a></td>
         </tr>
         <tr>
            <td>사업장주소</td>
            <td></td>
            <td><input type="text" name="site_ADDRESS" id="site_ADDRESS" style="width: 400px;background: #F8FAE6;"></td>
         </tr>
         <tr>
            <td>사업장번지</td>
            <td></td>
            <td><input type="text" name="site_ADDRESS_DETAIL"  id="site_ADDRESS_DETAIL" style="width: 400px;"></td>
         </tr>
         <tr>
            <td>사업장전화번호</td>
            <td></td>
            <td><input type="text" name="site_CONTACT" id="site_CONTACT" placeholder="__-___-____" class="siteNUM" maxlength="13"></td>
         </tr>
         <tr>
            <td>사업장팩스</td>
            <td></td>
            <td><input type="text" name="site_FAX" id="site_FAX" placeholder="__-___-____" class="siteNUM" maxlength="13" ></td>
         </tr>
         <tr>
            <td>업태</td>
            <td></td>
            <td><input type="text" name="site_CATEGORY" style="background: #F8FAE6;"></td>
         </tr>
         <tr>
            <td>종목</td>
            <td></td>
            <td><input type="text" name="site_TYPE" style="background: #F8FAE6;"></td>
         </tr>
         <tr>
            <td>개업연월일</td>
            <td></td>
            <td><input type="date" name="site_OPENBUSINESS_DATE" style="width: 140px;"></td>
         </tr>
         <tr>
            <td>폐업연월일</td>
            <td></td>
            <td><input type="date" name="site_CLOSEBUSINESS_DATE" style="width: 140px;"></td>
         </tr>
         <tr>
            <td>본점여부</td>
            <td></td>
            <td><select name=site_BUSINESS_AVAILABLE style="background: #F8FAE6;"><option value='Y' selected>여</option><option value='N' >부</option></select></td>
         </tr>

      </table>
   </div>

</form>



</body>
</html>