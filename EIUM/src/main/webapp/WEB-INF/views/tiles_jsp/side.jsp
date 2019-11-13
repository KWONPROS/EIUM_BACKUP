<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<title>side</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${contextPath}/resources/sheet/ibleaders.js"></script>
<script src="${contextPath}/resources/sheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/sheet/ibsheet.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"
	rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style type="text/css">

/* 배너단 */
.logobox {
	background-color: #212121;
	padding: 10px;
	padding-bottom: 15px;
}

.logobox .logo {
	width: auto;
	height: 80px;
}
.logobox .sideSearchBar {
	width: 170px;
	vertical-align: middle;
	white-space: nowrap;
	position: relative;
}
.logobox .sideSearchBar input#search {
	width: 170px;
	height: 30px;
	background: #ffffff;
	border: none;
	font-size: 10pt;
	color: #63717f;
	padding-left: 35px;
	border-radius: 5px;
}
.sideSearchBar .icon {
	position: absolute;
	margin-left: -160px;
	margin-top: 3px;
	z-index: 1;
	color: #4f5b66;
}

/* 트리메뉴 */

#sidexx {

	width: 190px;
	height: 100%;
	background-color: #212121;
}

</style>
<meta charset="UTF-8">
<title>사이드 메뉴</title>

<script> //메뉴트리

//데이터는 서버로 옮겨야 함
var data = {Data:[
	{menuCode:"m00",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:"등록정보관리"},
	{menuCode:"m01",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0001/searchInit.do",TITLE:"회사등록"},
	{menuCode:"m02",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0002/searchInit.do", TITLE:"사업장등록"},
	{menuCode:"m03",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0003/searchInit.do", TITLE:"부서등록"},
	{menuCode:"m04",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0004/searchInit.do", TITLE:"사원등록"},
	{menuCode:"m05",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0005/searchInit.do", TITLE:"권한관리"},
	{menuCode:"m38",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0006/searchInit.do", TITLE:"계정별권한설정"},
	{menuCode:"m06",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:"기초환경설정"},
	{menuCode:"m07",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0001/searchInit.do", TITLE:"호봉테이블등록 "},
	{menuCode:"m08",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0002/searchInit.do", TITLE:"지급일등록"},
	{menuCode:"m09",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0003/searchInit.do", TITLE:"인사기초코드등록 "},
	{menuCode:"m10",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:"인사관리"},
	{menuCode:"m11",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0004/searchInit.do", TITLE:"인사정보등록"},
	{menuCode:"m12",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0007/searchInit.do", TITLE:"인사기록카드"},
	{menuCode:"m13",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0018/searchInit.do", TITLE:"교육관리"},
	{menuCode:"m14",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0021/searchInit.do", TITLE:"교육평가"},
	{menuCode:"m15",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"인사발령등록"},
	{menuCode:"m16",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"인사발령"},
	{menuCode:"m17",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"인사발령공고"},
	{menuCode:"m18",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"인사발령리포트"},
	{menuCode:"m19",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"사원정보현황"},
	{menuCode:"m20",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"인사고과/상벌현황"},
	{menuCode:"m21",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"사원입퇴사현황"},
	{menuCode:"m22",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"책정임금현황"},
	{menuCode:"m23",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"근속년수현황"},
	{menuCode:"m24",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"교육현황"},
	{menuCode:"m25",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:"급여관리"},
	{menuCode:"m26",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"급여입력및계산"},
	{menuCode:"m27",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"급여대장"},
	{menuCode:"m28",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"급여명세"},
	{menuCode:"m29",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"급상여이체현황"},
	{menuCode:"m30",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"월별지급현황"},
	{menuCode:"m31",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"사원임금통계"},
	{menuCode:"m32",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:"근태관리"},
	{menuCode:"m33",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"pm/p0001/searchInit.do", TITLE:"근태입력"},
	{menuCode:"m34",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"wm/p0002/searchInit.do", TITLE:"휴가관리"},
	{menuCode:"m35",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"wm/p0003/searchInit.do", TITLE:"휴가내역"},
	{menuCode:"m36",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"wm/p0004/searchInit.do", TITLE:"출장관리"},
	{menuCode:"m37",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"출장조회"},
	{menuCode:"m38",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"03/pivot.html", TITLE:"출장조회(사원별)"},
	]};


$(document).ready(function(){	
	
	var sheetHeight = $(window).height();	//높이 자동계산
	createIBSheet2(document.getElementById("sideMenu"),"leftMenu","100%",(sheetHeight-173)+"px");
	leftMenu.CustomScroll =3;	//스크롤 모양
	leftMenu.SetTheme("LGY2","LightGray2");

	leftMenu.NoTreeLines = 1; //트리모양
	var ibdata = {};
	ibdata.Cfg = {SizeMode:"sizeAdvancedAuto",DataRowHeight:30, MouseHoverMode:2,DragMode:-1};
	ibdata.HeaderMode = {};
	ibdata.Cols = [
		{Header:"타이틀",Type:"Text",SaveName:"TITLE", Width:100,TreeCol:1,Edit:0 }, //효과적용X
		{Header:"URL",Type:"Text",SaveName:"URL",Hidden:1},	//컬럼숨김
		{Header:"menuCode",Type:"Text",SaveName:"menuCode",Hidden:1}	//컬럼숨김
	];  
	IBS_InitSheet(leftMenu,ibdata); //초기화
	
	leftMenu.SetExtendLastCol(1);	//마지막 컬럼 늘임여부
	leftMenu.SetRowHidden(0,1); //(로우,히든여부)
	leftMenu.SetWaitImageVisible(0); //로딩이미지
	leftMenu.SetFocusAfterProcess(0); //조회 후 포커스를두지않음
	
	leftMenu.LoadSearchData(data); //시작
	
	//tab 객체 생성
		createIBTab(document.getElementById("tabBar"),document.getElementById("tabContents"),"tabMenu",
		{
			widthTabBar: "100%",
			heightTabBar:"45px",
			heightContents:"100%",
			 themes: {
			  tabs: "material_black",
			  contents: "",
			  contextMenu: "material_black"
			}
    });
    
    	tabMenu.setOptions({
    		
    		tabs : [{
					type : "tab", //탭 유형 설정
					title : "Home",  //탭 제목 설정
					hold : true,
					style : {
						btnClose:false,
						icon: {
							type: "none"  // 탭 아이콘 유형 설정
						}
					}
				}],
				contents:[{
					type:"iframe",	
					contents:""
				}],
				customZone:{
					width:"0px"
				}
			});
});

 function leftMenu_OnClick(r,c,v){
	 if(leftMenu.IsHaveChild(r)){	//트리 펼침여부
		leftMenu.SetRowExpanded(r  ,  !(leftMenu.GetRowExpanded(r)));
	} 
	
	//이미 열린 텝인지 확인
	var obj = tabMenu.findTabId(leftMenu.GetCellValue(r,"menuCode"));
	//없으면 undefined가 리턴됨.

	
	if(obj){
		tabMenu.goToTab(obj.getIndex());
		return;
	}
	//전체 열린 텝의 개수가 15개 이상이면 경고 발생
	if(tabMenu.tabs.getCountTab()>15){
		if(confirm("탭이 너무 많습니다. 하나 닫을까요?")){
			tabMenu.removeTab(1);		
		}
	}
	
	
	if(leftMenu.GetCellValue(r,"URL")!=""){
			//텝 추가
			tabMenu.addTab({
			  tabs: {
			    title: v,
			    focus: true,
			    id:leftMenu.GetCellValue(r,"menuCode"),
			    style : {
						btnClose:true
					}

			  },
			  contents: {
			    type:"iframe",	
				contents:leftMenu.GetCellValue(r,"URL")
			  }
			});

	}

}

</script>
</head>
<body>

	<div id="sidexx">
		<div class="logobox">
			<a href="${contextPath}/main.do"> <img class="logo"
				src="${contextPath}/resources/image/EIUM_banner.png" /></a>
				
			<div class="sideSearchBar">
				<input type="search" id="search" placeholder="찾을 메뉴 입력..." /> <span
					class="icon"><i class="fa fa-search"></i></span>
			</div>
			
		</div>
		<div id="sideMenu"></div>
	</div>

</body>
</html>
