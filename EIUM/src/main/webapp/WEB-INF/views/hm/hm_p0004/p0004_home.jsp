<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"
	rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"
	type="text/javascript"></script>
<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [		
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},	
	        {Header:"사원코드",Type:"Text",SaveName:"emp_CODE",KeyField:1,Hidden:1},	
			{Header:"사원명",Type:"Text",SaveName:"emp_NAME",MinWidth:120, Align:"Center"},			
			{Header:"부서명",Type:"Text",SaveName:"dep_NAME",MinWidth:170},
			{Header:"사원명(영문)",Type:"Text",SaveName:"emp_NAME_EN", Hidden:1},			
			{Header:"사원명(한자)",Type:"Text",SaveName:"emp_NAME_HN", Hidden:1},			
			{Header:"내외국인구분",Type:"Text",SaveName:"foreign_YN", Hidden:1},			
			{Header:"주민등록번호",Type:"Text",SaveName:"rr_NUM", Hidden:1},			
			{Header:"성별",Type:"Text",SaveName:"sex", Hidden:1},			
			{Header:"생년월일",Type:"Text",SaveName:"birth", Hidden:1},			
			{Header:"전화번호",Type:"Text",SaveName:"contact", Hidden:1},			
			{Header:"최종학력코드",Type:"Text",SaveName:"final_EDU_CODE", Hidden:1},			
			{Header:"최종학력이름",Type:"Text",SaveName:"final_EDU_NAME", Hidden:1},			
			{Header:"사진",Type:"Image",SaveName:"picture",  Hidden:1 },			
			{Header:"우편번호",Type:"Text",SaveName:"zip_CODE", Hidden:1},			
			{Header:"주민등록주소",Type:"Text",SaveName:"res_ADDRESS", Hidden:1},			
			{Header:"상세주소",Type:"Text",SaveName:"res_ADDRESS_DETAIL", Hidden:1},			
			{Header:"영문주소",Type:"Text",SaveName:"res_ADDRESS_EN", Hidden:1},			
			{Header:"이메일",Type:"Text",SaveName:"email",  Hidden:1 },			
			{Header:"출입카드번호",Type:"Text",SaveName:"card_NUM", Hidden:1},			
			{Header:"세대주여부",Type:"Text",SaveName:"hh_YN", Hidden:1},			
			{Header:"장애인구분",Type:"Text",SaveName:"hc_YN", Hidden:1},			
			{Header:"국적코드",Type:"Text",SaveName:"country_CODE", Hidden:1},			
			{Header:"국적이름",Type:"Text",SaveName:"country_NAME", Hidden:1},			
			{Header:"병역구분",Type:"Text",SaveName:"mil_TYPE", Hidden:1},			
			{Header:"군번",Type:"Text",SaveName:"mil_NUM", Hidden:1},			
			{Header:"채용구분",Type:"Text",SaveName:"hire_TYPE", Hidden:1},					
			{Header:"기수",Type:"Text",SaveName:"hire_NUM", Hidden:1}		
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(600);
	
		
		
		
		

		//탭
		createIBTab($('#ib_sheetTab')[0], $('#ib_sheetContents')[0], 'sheetTab', {
		    themes: {
		        tabs: "flat_blue",
		        contents: "flat_blue",
		        contextMenu: "flat_blue"
		    },
		    allowCloseBTN: false
		});
		
		
	
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			mySheet.DoSearch("${contextPath}/hm/p0004/searchList.do");		
			break;

		 case "reload": //초기화
	            mySheet.RemoveAll();
	            break;
	         case "save": // 저장
	             mySheet.SetCellValue($('input[name=myRow]').val(),5,$('input[name=engName]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),6,$('input[name=hanName]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),7,$('input[name=foreignYN]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),8,$('input[name=rrNumber]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),9,$('input[name=sex]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),10,$('input[name=birthDate]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),11,$('input[name=contactNum]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),12,$('input[name=finalEduCode]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),13,$('input[name=finalEduName]').val());
	          
	            mySheet.SetCellValue($('input[name=myRow]').val(),15,$('input[name=zipcode]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),16,$('input[name=address]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),17,$('input[name=addressDetail]').val());
	            mySheet.SetCellValue($('input[name=myRow]').val(),18,$('input[name=addressEng]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),19,$('input[name=email]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),20,$('input[name=accessCard]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),21,$('select[name=householdYN]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),22,$('select[name=handicappedYN]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),23,$('input[name=countryCODE]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),24,$('input[name=countryNAME]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),25,$('select[name=milType]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),26,$('input[name=milNum]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),27,$('select[name=hireType]').val()); 
	            mySheet.SetCellValue($('input[name=myRow]').val(),28,$('input[name=hireNum]').val()); 
	        
	           
	            var tempStr = mySheet.GetSaveString();
	            alert("서버로 전달되는 문자열 확인 :"+tempStr);
	            mySheet.DoSave("${contextPath}/hm/p0004/saveData.do");
	            break;      
		}
	}

	//로우 클릭시
	function mySheet_OnClick(Row, Col) {
		if (Row != 0) {

			 $('input[name=myRow]').val(Row);
		      $('input[name=engName]').val(mySheet.GetCellValue(Row,5));
		      $('input[name=hanName]').val(mySheet.GetCellValue(Row,6)); 
		      $('input[name=foreignYN]').val(mySheet.GetCellValue(Row,7));
		      $('input[name=rrNumber]').val(mySheet.GetCellValue(Row,8));
		      $('input[name=sex]').val(mySheet.GetCellValue(Row,9));
		      $('input[name=birthDate]').val(mySheet.GetCellValue(Row,10));
		      $('input[name=contactNum]').val(mySheet.GetCellValue(Row,11));
		      $('input[name=finalEduCode]').val(mySheet.GetCellValue(Row,12));
		      $('input[name=finalEduName]').val(mySheet.GetCellValue(Row,13));
		     /*  $('input[id=pictureUpload]').val(mySheet.GetCellValue(Row,14)); */
		      $('input[name=zipcode]').val(mySheet.GetCellValue(Row,15));
		      $('input[name=address]').val(mySheet.GetCellValue(Row,16));
		      $('input[name=addressDetail]').val(mySheet.GetCellValue(Row,17));
		      $('input[name=addressEng]').val(mySheet.GetCellValue(Row,18));
		      $('input[name=email]').val(mySheet.GetCellValue(Row,19));
		      $('input[name=accessCard]').val(mySheet.GetCellValue(Row,20));
		      $('select[name=householdYN]').val(mySheet.GetCellValue(Row,21));
		      $('select[name=handicappedYN]').val(mySheet.GetCellValue(Row,22));
		      $('input[name=countryCODE]').val(mySheet.GetCellValue(Row,23));
		      $('input[name=countryNAME]').val(mySheet.GetCellValue(Row,24));
		      $('select[name=milType]').val(mySheet.GetCellValue(Row,25));
		      $('input[name=milNum]').val(mySheet.GetCellValue(Row,26));
		      $('select[name=hireType]').val(mySheet.GetCellValue(Row,27));
		      $('input[name=hireNum]').val(mySheet.GetCellValue(Row,28));
		
		      
		}

	}

	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code, msg) {
		if (msg != "") {
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

	      document.form.zipcode.value = zipNo;    
	      document.form.address.value = roadAddrPart1;   
	      document.form.addressDetail.value = addrDetail;   
	      document.form.addressEng.value = engAddr;   
	      
	}
	   
	   
	   function findPopup(tablename){
	      var pop = window.open("findPopup.do?command="+tablename,"findPopup","width=342,height=520,resizable = no, scrollbars = no"); 

	   }
	   function searchCondition(){
		  var cond =  document.getElementById("condition").value
		  mySheet.DoSearch('${contextPath}/hm/p0004/searchList.do','condition='+cond);
	   }

	

	
</script>
<style type="text/css">
.modal {
    max-width: 300px;
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

.pictureUpload {
	font-size: 13px;
	margin-left: 5px;
	background-color: #3498DB;
	color: white;
	padding: 5px 50px;
	border-radius: 7px;
	text-decoration: none;
}

.pictureUpload:hover {
	background-color: #2C3E50;
}

.left {
	position: relative;
	top: 130px;
	left: 60px;
	width: 403px;
}
.left input{
	height: 22px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
	vertical-align: middle;
	}
	

.right {
	position: relative;
	top: -560px;
	left: 500px;
	height: 700px;
	width: 1150px;
	background: #EBEBEB;
	border-radius: 5px;
}

#searchBar {
	background: #EBEBEB;
	padding: 10px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius: 5px;
}

.tg input, select {
	height: 22px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
}

.tg img {
	padding: 0px 5px 0px 5px;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	width: 70%;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 7px 2px;
	overflow: hidden;
	word-break: normal;
	border-color: black;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 0px 5px;
	overflow: hidden;
	word-break: normal;
	border-color: black;
}

.tg .tg-dm68 {
	font-size: 12px;
	font-family: Verdana, Geneva, sans-serif !important;;
	background-color: #d4d4d4;
	border-color: #bebebe;
	text-align: center;
	vertical-align: center
}

.tg .tg-lu1x {
	font-size: 12px;
	font-family: Verdana, Geneva, sans-serif !important;;
	background-color: #333333;
	color: #ffffff;
	border-color: inherit;
	text-align: center;
	vertical-align: center;
	width: 40px;
	border-radius: 2px;
}

.tg .tg-au0w {
	font-size: 12px;
	font-family: Verdana, Geneva, sans-serif !important;;
	border-color: inherit;
	text-align: left;
	vertical-align: center
}

.tg .tg-8thm {
	font-size: 12px;
	font-family: Verdana, Geneva, sans-serif !important;;
	background-color: #d4d4d4;
	border-color: inherit;
	text-align: right;
	vertical-align: center
}

.tg .tg-v9i9 {
	font-size: 12px;
	font-family: Verdana, Geneva, sans-serif !important;;
	background-color: #d4d4d4;
	border-color: inherit;
	text-align: left;
	vertical-align: center
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
			href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 :
			인사정보등록
		</header>
	</div>
	<div class="left">
		<form id="searchBar" action="javascript:searchCondition();">
			조회기준 <input type="radio" name="emp_radio"
				onclick="mySheet.DoSearch('${contextPath}/hm/p0004/searchList.do','command=doWork');">재직  
			<input type="radio" name="emp_radio"
				onclick="mySheet.DoSearch('${contextPath}/hm/p0004/searchList.do','command=noWork');">퇴직  
			<input type="radio" name="emp_radio"
				onclick="mySheet.DoSearch('${contextPath}/hm/p0004/searchList.do');"
				checked="checked"> 전체<br> 사원검색   <input type="text"
				name="condition" id="condition" placeholder="사원번호"> <input type="submit" value="조회" style="background-color: #5E5E5E; color:white;">
		</form>

		<script>createIBSheet("mySheet", "100%", "100%");</script>
	</div>

	<div class="right">

		<div id="ib_sheetTab">
			<div class="ib-tab-tabs-item">
				<a class="ib-tab-tabs-item__link is-active"><span
					class="ib-tab-tabs-item__title">인적정보 </span></a> <a
					class="ib-tab-tabs-item__link"><span
					class="ib-tab-tabs-item__title">재직정보 </span></a> <a
					class="ib-tab-tabs-item__link"><span
					class="ib-tab-tabs-item__title">급여정보</span></a>
			</div>
		</div>

		<div id="ib_sheetContents">
			<div class="ib-tab-contents__item" style="background: none;">
				<div id='ib-container1'>



					<form name="form" id="form" method="post">
						<table class="tg">
							<tr>
								<th class="tg-lu1x" rowspan="8"><i
									class="fa fa-address-book" aria-hidden="true"></i><br>개<br>인<br>정<br>보</th>
								<th class="tg-au0w" rowspan="18"></th>
								<td class="tg-dm68" rowspan="7"><img alt="사원사진" src=""
									width="80%" height="80%"></td>
								<th class="tg-au0w" rowspan="8"></th>

								<td class="tg-8thm">성명(영문)<input type="hidden" name="myRow"></td>
								<th class="tg-v9i9" rowspan="8"></th>
								<td class="tg-v9i9" colspan="3"><input type="text"
									id="engName" name="engName" style="width: 350px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">성명(한자)</td>
								<td class="tg-v9i9" colspan="3"><input type="text"
									id="hanName" name="hanName" style="width: 350px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">내외국인구분</td>
								<td class="tg-v9i9" colspan="3"><select name=foreignYN
									style="width: 350px;"><option value='Y' selected>내국인</option>
										<option value='N'>외국인</option></select></td>
							</tr>
							<tr>
								<td class="tg-8thm">주민등록번호</td>
								<td class="tg-v9i9" colspan="3"><input type="text"
									id="rrNumber" name="rrNumber" style="width: 350px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">성별</td>
								<td class="tg-v9i9" colspan="3"><select name=sex
									style="width: 350px;"><option value='남' selected>남자</option>
										<option value='여'>여자</option></select></td>
							</tr>
							<tr>
								<td class="tg-8thm">생년월일</td>
								<td class="tg-v9i9" colspan="3"><input type="date"
									name="birthDate" style="width: 350px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">전화번호</td>
								<td class="tg-v9i9" colspan="3"><input type="text"
									id="contactNum" name="contactNum" style="width: 350px;"></td>
							</tr>
							<tr>
								<td class="tg-dm68"><a href="javascript:"
									id="pictureUpload" class="pictureUpload">사진등록</a></td>

								<td class="tg-8thm">최종학력</td>
								<td class="tg-v9i9" colspan="3"><input type="text"
									id="FINAL_EDU_CODE" name="finalEduCode" style="width: 50px;"><a
									href="javascript:findPopup('FINAL_EDU');" ><img
										src="${contextPath}/resources/image/icons/icon_plus.png"></a>
									<input type="text" id="FINAL_EDU_NAME" name="finalEduName"
									style="width: 272px;"></td>
							</tr>
							<tr>
								<td class="tg-au0w"></td>
								<td class="tg-au0w" colspan="7"></td>
							</tr>
							<tr>
								<td class="tg-lu1x" rowspan="9"><i class="fa fa-id-card"
									aria-hidden="true"></i><br>거<br>주<br>정<br>보</td>

								<td class="tg-8thm">주민등록주소</td>
								<td class="tg-v9i9" rowspan="9"></td>
								<td class="tg-v9i9" colspan="5"><input type="text"
									name="zipcode" id="zipcode" onclick="javascript:goPopup();"
									style="width: 50px;"><a href="javascript:goPopup();"><img
										src="${contextPath}/resources/image/icons/icon_plus.png"></a>
									<input type="text" id="address" name="address"
									onclick="javascript:goPopup();" style="width: 380px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">상세주소</td>
								<td class="tg-v9i9" colspan="5"><input type="text"
									id="addressDetail" name="addressDetail" style="width: 460px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">영문주소</td>
								<td class="tg-v9i9" colspan="5"><input type="text"
									id="addressEng" name="addressEng" style="width: 460px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">E-MAIL</td>
								<td class="tg-v9i9" colspan="5"><input type="text"
									id="email" name="email" style="width: 460px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">출입카드NO.</td>
								<td class="tg-v9i9" colspan="5"><input type="text"
									id="accessCard" name="accessCard" style="width: 460px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">세대주여부</td>
								<td class="tg-v9i9"><select name=householdYN><option
											value='Y' selected>여</option>
										<option value='N'>부</option></select></td>

								<td class="tg-v9i9"></td>
								<td class="tg-8thm">장애인구분</td>
								<td class="tg-v9i9"></td>
								<td class="tg-v9i9"><select name=handicappedYN><option
											value='Y'>여</option>
										<option value='N' selected>부</option></select></td>
							</tr>
							<tr>
								<td class="tg-8thm">국적</td>
								<td class="tg-v9i9" colspan="5"><input type="text"
									id="COUNTRY_CODE" name="countryCODE" style="width: 50px;"><a
									href="javascript:findPopup('COUNTRY');"><img
										src="${contextPath}/resources/image/icons/icon_plus.png"></a>
									<input type="text" id="COUNTRY_NAME" name="countryNAME"
									style="width: 380px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">병역구분</td>
								<td class="tg-v9i9"><select name="milType">
										<option value='현역'>현역</option>
										<option value='단기사병'>단기사병</option>
										<option value='해당없음' selected>해당없음</option>
								</select></td>
								<td class="tg-v9i9"></td>
								<td class="tg-8thm">군번</td>
								<td class="tg-v9i9"></td>
								<td class="tg-v9i9"><input type="text" id="milNum"
									name="milNum" style="width: 270px;"></td>
							</tr>
							<tr>
								<td class="tg-8thm">채용구분</td>
								<td class="tg-v9i9"><select name=hireType><option
											value='공채'>공개채용</option>
										<option value='수시'>수시채용</option></select></td>
								<td class="tg-v9i9"></td>
								<td class="tg-8thm">기수</td>
								<td class="tg-v9i9"></td>
								<td class="tg-v9i9"><input type="text" id="hireNum"
									name="hireNum" style="width: 270px;"></td>
							</tr>
						</table>
					</form>

				</div>
			</div>
			<div class="ib-tab-contents__item">
				<div id='ib-container2'>

					<form action="${contextPath}/hm/p0004/saveFile.do" method="post"
						enctype="multipart/form-data">
						<input type="file" name="file" /> <input type="submit"
							value="서버전달" />
					</form>


				</div>
			</div>
			<div class="ib-tab-contents__item">
				<div id='ib-container3'>
					


				</div>
			</div>
		</div>
	</div>




</body>

</html>