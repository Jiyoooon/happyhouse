<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<style type="text/css">
li{
	display:inline;
}

</style>

</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
        	<span class="icon icon-cog"></span>
			<h1><a href="#">Happy House</a></h1>
		<c:choose>
			<c:when test="${empty userinfo}">
				<button type="button" id="joinBtn" onclick="document.location.href = '${root}/mvjoin';">회원가입</button>
				<button type="button" id="loginBtn" onclick="document.location.href = '${root}/mvlogin';">로그인</button>
			</c:when>
			<c:otherwise>
			<strong>${userinfo.username}(${userinfo.userid})</strong>님 환영합니다.
				<c:choose>
				    <c:when test="${userinfo.userid eq 'admin' }">
					<button type="button" id="mypageBtn" onclick="document.location.href = '${root}/memberlist&key=&word=';">회원정보조회</button>
					<button type="button" id="logoutBtn" onclick="document.location.href = '${root}/logout';">로그아웃</button>
					</c:when>
					<c:otherwise>
					<button type="button" id="mypageBtn" onclick="document.location.href = '${root}/mypage';">회원정보</button>
					<button type="button" id="logoutBtn" onclick="document.location.href = '${root}/logout';">로그아웃</button>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		</div>
		<div id="menu">
			<ul>
				<li class="active"><a href="${root}" accesskey="1" title="">홈페이지</a></li>
				<li class=""><a href="noticelist?key=&word=" accesskey="2" title="">공지사항</a></li>
				<li class=""><a href="qna" accesskey="3" title="">Q&A</a></li>
				<li class=""><a href="#" accesskey="4" title="">오늘의 뉴스</a></li>
			</ul>
		</div>
		<script>
// 		var header = document.getElementById("menu");
// 		var btns = header.getElementsByTagName("li");
// 		for (var i = 0; i < btns.length; i++) {
// 		  btns[i].addEventListener("click", function() {
// 		  var current = document.getElementsByClassName("active");
// 		  current[0].className = current[0].className.replace("active", "");
// 		  this.className += "active";
// 		  });
// 		}
		</script>
	</div>
</div>
</body>
</html>