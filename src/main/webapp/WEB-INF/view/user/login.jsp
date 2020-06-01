<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<c:if test="${cookie.savedId.value}"> <!-- null이 아니면 if문 안으로 들어감! -->
	<c:set var="svid" value="${cookie.savedId.value }"/>
	<c:set var="ckid" value=" checked"/>
</c:if>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
/*function login() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("userpwd").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else {
		document.getElementById("loginform").action = "${root}/user.do";
		document.getElementById("loginform").submit();
	}
}*/
	 
function moveJoin() {
	document.location.href = "mvjoin";
}	
</script>
</head>
<body>

<c:import url="userbar.jsp"/>

<div class="wrapper" align="center">
	<h3>${msg}</h3>
	<div class="col-lg-6" align="center">
		<form id="loginform" method="post" action="${root}/login">
			<input type="hidden" name="act" value="login"><!-- 개발자에게만 임의로 필요한 정보(클라이언트에겐 보이지X) -->
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" value="${svid}" required>
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="userpwd" onkeydown="javascript:if(event.keyCode == 13) {login();}" required>
			</div>
			<div class="form-group form-check" align="right">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok" ${ckid}> 아이디저장
			    </label>
			</div>
			<div class="form-group" align="center">
				<input type="submit" class="btn btn-warning" value="로그인">
				<button type="button" class="btn btn-primary" onclick="javascript:moveJoin();">회원가입</button>
			</div>
		</form>
	</div>
</div>
<c:import url="footer.jsp"/>
