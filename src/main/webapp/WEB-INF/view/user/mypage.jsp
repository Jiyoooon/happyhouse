<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<c:if test="${empty userinfo}">
	<% request.setAttribute("msg", "로그인 후 이용해주세요."); %>
	<c:redirect url="${root}/mvlogin"/>
</c:if>

<!-- 회원정보 조회 || 수정 및 삭제 page -->

<c:if test="${disable}"> <!-- 회원 정보 조회 -->
	<c:set var="dis" value=" disabled"/>
</c:if>

<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>happyhouse 회원정보조회</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {//비밀번호, 이메일 형식 체크
	$("#memberform").submit(function() {
		var pwReg = /^[a-zA-Z0-9]{6,15}$/;
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!pwReg.test($("#userpwd").val())){
			alert('비밀번호는 영문 숫자 포함 6자리 이상이어야 합니다.');
			$("#userpwd").focus();
			return false;
		}else if(!emailReg.test($("#email").val())) {
			alert("이메일 형식이 안맞습니다. 다시 확인해주세요.");
			$("#email").focus();
			return false;
		} else return true;
	});
	 
	$("#mvModifyBtn").click(function(){
		console.log("수정버튼 뉘림");
		window.location.href = '${root}/mvmodify';
	});
	
	$("#deleteBtn").click(function(){
		if(confirm("정말로 탈퇴하시겠습니까?")){
			window.location.href = '${root}/delete';
		}
	});
});
</script>
</head>
<body>
<c:import url="userbar.jsp"/>

<div class="wrapper" align="center">
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="${root}/modify">
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" value = "${userinfo.userid}" disabled>
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="userpwd" value="${userinfo.userpwd}" ${dis} required >
			</div>
			<div class="form-group" align="left">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="username" name="username" value="${userinfo.username}" ${dis} required>
			</div>
			<div class="form-group" align="left">
				<label for="">이메일</label><br>
				<input type="email" class="form-control" id="email" name="email" value="${userinfo.email}" ${dis} required>
			</div>
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<input type="tel" class="form-control" id="tel" name="tel" value="${userinfo.tel}" ${dis} required>
			</div>
			<div class="form-group" align="center">
				<c:choose>
					<c:when test="${disable}"><!-- 회원 정보 조회 -->
						<button type="button" class="btn btn-primary" onclick="window.location.href = '${root}';">확인</button>
						<button type="button" class="btn btn-primary" id="mvModifyBtn">수정</button>
					</c:when>
					<c:otherwise><!-- 회원 정보 수정 및 삭제 -->
						<input type="submit" class="btn btn-primary" id="modifyBtn" value="수정">
						<button type="button" class="btn btn-warning" id="deleteBtn">회원 탈퇴</button>
					</c:otherwise>
				</c:choose>
				
			</div>
		</form>
	</div>
</div>
<c:import url="footer.jsp"/>

</body>
</html>