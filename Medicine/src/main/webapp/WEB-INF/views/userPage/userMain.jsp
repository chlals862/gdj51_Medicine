<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/hee/userMainheath.css" />
<link rel="stylesheet" type="text/css" href="resources/css/hee/userMain.css" />
<link rel="stylesheet" type="text/css" href="resources/css/hee/menu2.css" />
<link rel="stylesheet" type="text/css" href="resources/script/fullcalendar/fullcalendar.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.js"></script>
<!-- Moment Script -->
<script type="text/javascript" src="resources/script/jquery/moment.js"></script>
<script type="text/javascript" src="resources/script/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="resources/script/fullcalendar/locale-all.js"></script>
<script src="resources/js/highcharts/highcharts.js"></script>
<script src="resources/js/highcharts/exporting.js"></script>
<script src="resources/js/highcharts/export-data.js"></script>
<script src="resources/js/highcharts/accessibility.js"></script>
<script src="resources/js/userPage/userMain.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();

	$(".menu_4").on("click",function(){
		location.href = "MediCompare";
	});
	$(".menu_3").on("click",function(){
	  var target = $(".new_rap").offset().top;
	  previousScroll = target;
	  $("html").animate({scrollTop : target}, 600);
	});
	$(".menu_1").on("click",function(){
		var target = $(".good_rap").offset().top;
		previousScroll = target;
		$("html").animate({scrollTop : target}, 600);
	});
	$(".menu_2").on("click",function(){
		var target = $(".new2_rap").offset().top;
		previousScroll = target;
		$("html").animate({scrollTop : target}, 600);
	});
	
});
function reloadList(){
	var params = $("#searchForm").serialize();
	$.ajax({
	      url : "userMainList", 
	      type : "POST", 
	      dataType : "json", 
	      data : params, 
	      success : function(res) {
	    	 	List(res.list);
	      },
	      error : function(request, status, error){ 
	         console.log(request.responseText); 
	      } 
	   });	
}
function List(list){
	var html = "";
	html += "<div class=\"icon-left\">"+"</div>";
	html += "<div class=\"icon-right\">"+"</div>";
	html += "<div class=\"pic-first\">"+"</div>";
	html += "<div class=\"pic\" id=\"pic0\">"+"</div>";
	for(var data of list){
		html += "<div id=\"pic6\" no=\""+ data.MEM_NUM + "\" impic=\""+ data.DIET_NUM + "\" class=\"pic\" )\">";
		html += "<img class=\"picpic\" src=\"resources/upload/"+data.HEADER_PIC+"\">";
		html += "<div class=\"text\">"+ data.TITLE +"</div>";
		html += "</div>";
	}
	$(".brunch").html(html);
}
</script>
</head>
<body>
<form action="#" id="searchForm" method="post">
		<img src="">
		<input type="hidden" name="impic" id="impic" />
		<input type="hidden" name="no" id="no" />
	</form>
	<!-- ????????? ??? ???????????? -->
	<div class="bar">
		<div class="wrap">
			<div class="logo2"></div>
			<div class="menu_login_border">
				<div class="menu_userId_border">
					<c:if test="${!empty sMemNum}">
						<span class="menu_userId">${sMemNm}??? ???????????????.</span>
					</c:if>
					<span class="menu_userId2"></span>
				</div>
				<div class="menu_btn_border">
					<c:choose>
						<c:when test="${empty sMemNum}">
							<input type="button" class="menuLoginBtn" id="menuLoginBtn"
								value="?????????" />
							<input type="button" class="menuNewAccount" id="menuNewAccount"
								value="????????????" />
						</c:when>
						<c:otherwise>
							<input type="button" class="menuLogoutBtn" id="menuLogoutBtn" value="????????????" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	<div class="element">
 <div class="elements medicine_Info">????????? ??????
         <span class="bar_left bar_left1" ></span>
         <span class="bar_right bar_right1" ></span>
      </div>
      <div class="elements health_Mgt">?????? ??????
         <span class="bar_left bar_left2" ></span>
         <span class="bar_right bar_right2" ></span>
      </div>
      <div class="elements medicine_Compare">????????? ??????
         <span class="bar_left bar_left3" ></span>
         <span class="bar_right bar_right3" ></span>
      </div>
      <div class="elements freeBoard">???????????????
         <span class="bar_left bar_left4" ></span>
         <span class="bar_right bar_right4" ></span>
      </div>
      <div class="elements service_center">????????????
         <span class="bar_left bar_left5"></span>
         <span class="bar_right bar_right5"></span>
      </div>
      <div class="elements mypage" >???????????????
         <span class="bar_left bar_left6"></span>
         <span class="bar_right bar_right6"></span>
      </div>
		</div>
	</div>
	<div class="txtrap">
		<div class="top_header">
			<div class="menu"></div>
			<div class="logo"></div>
			<div class="login_border">
			<c:choose>
				<c:when test="${!empty sMemNum}">
				<div class="userId_border2">
					<div class="userId">
						${sMemNm}??? ???????????????. 
						<input type="button" id="logoutBtn" value="????????????" class="logoutBtn" />
					</div>
				</div>
					</c:when>
				<c:otherwise>	
				<div class="userId_border">
						<div class="userId2">
							<input type="button" id="loginBtn1" value="?????????" class="loginBtn1" />
							<div class="userlogin">?????? ??????</div>
						</div>
				</div>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
	<div class="rap_100">
		<div class="main_rap">
			<div class="main_title">
				<div class="title1">??????????????? ???????????? ?????? ????????? ????????? ????????????, ???????????? ???????????????.</div>
				<div class="title2">????????? ?????? ?????? ????????? ?????? ???????????????.</div>
			</div>
			<div class="menu_rap">
				<div class="menu_1">?????? ????????? ?????? ?????? ??????</div>
				<div class="menu_2">????????? ?????? ??????</div>
				<div class="menu_3">????????? ???????????? ??????</div>
				<div class="menu_4">?????? ?????? ?????? ?????? ??????</div>
			</div>
			<div class="bottom_rap">
				<div class="bottom_txt">?????? ???????????? ???????????????</div>
				<div class="bottom_img"></div>
			</div>
		</div>
	</div>
	
<div class="good_rap">
		<div class="total">
			<div id="nameblock" class="a">
				<div id="name">??????</div>
				<div id="namebar">
					<div id="nameVal">?????????</div>
				</div>
				<div class="edit"></div>
			</div>
			<div id="birthblock" class="a">
				<div id="birth">????????????</div>
				<div id="year">1997???</div>
				<div id="month">12???</div>
				<div id="day">24???</div>
				<div class="edit"></div>
			</div>
			<div id="cmblock" class="a">
				<div id="cm">???</div>
				<div id="cmbox">
					<div id="cmVal">187</div>
				</div>
				<div id="cmtxt">cm</div>
				<div class="edit"></div>
			</div>
			<div id="kgblock" class="a">
				<div id="kg">?????????</div>
				<div id="kgbox">
					<div id="kgVal">90</div>
				</div>
				<div id="kgtxt">kg</div>
				<div class="edit"></div>
			</div>
			<div id="searchblock" class="blocks">
				<div class="blockTxt">?????? ?????? ?????? ??????</div>
				<input type="text" id="searchbox" class="inputbox"
					placeholder="????????? ??????">
				<div id="searchimg"></div>
			</div>
			<div class="side_rap">
				?????? ?????????????????? ????????? ?????????.
			</div>
			<div class="side_rap2">
				???????????? BMI?????? ???????????? ?????? ????????? ????????? ???????????? <br/>???????????????.
			</div>
		</div>
	</div>
	<div class="new_rap">
		<div class="chart_rap">
			<figure class="highcharts-figure">
				<div id="container"></div>
			</figure>
			<div class="information_rap">
				<div class="information_srap">
					<div class="information_child1"></div>
					?????? ????????? ???????????? ????????? ??????????????????.
				</div>
				<div class="information">
					<div class="information_child"></div>
					"abc??????" ?????? ????????? / ?????? / <br /> ????????? / ?????? / ???????????? ?????????.
				</div>
				<div class="information2">
					<div class="information_child2"></div>
					????????? / ?????? / ????????? / ?????? / ???????????? ???<br /> ?????? ???????????? ??? ???????????? ??????
				</div>
				<div class="information_btn">????????? ???????????? ?????? (????????? ??????)</div>
			</div>
		</div>	
	</div>
	<div class="new2_rap">
		<div class="txtnamerap">
			<div class="txt_name">
				??????????????? ?????? ????????? ??????????????? ??? ????????? ????????? ?????????, <br />???????????? ????????? ?????? ?????? ???????????? ?????? ??????
				?????? ??????. <br /> <br /> ?????? ????????? ????????????
			</div>
		</div>
		<!-- ???????????? ????????? ??? ???????????? -->
		<div class="brunch-wrap">	
			<div class="brunch">
			</div>
		</div>
	</div>
	<div class="new3_rap">
		<div class="total2">
			<div class="headTxt">???????????? ???????????? ?????????, ?????? ?????? ??????????????????</div>
			<div class="headImg"></div>
			<div class="compare1">
				<div class="compareBtn1"></div>
			</div>
			<div class="compare2">
				<div class="compareBtn2"></div>
			</div>
			<div class="compareTxt">????????????</div>
			<div class="comtxt_rap">
				<div class="comtext">?????? ?????? ?????? ????????? ?????? ????????? ?????? ????????? ???????????????.</div>
			</div>
		</div>
	</div>
</body>
</html>