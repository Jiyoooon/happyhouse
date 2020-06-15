<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<title>새로운 비밀번호 생성</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
$("#updatepwBtn").click(function() {
	
	if($("#userpwd").val() == "") {
		alert("비밀번호 입력!!!");
		return;
	} else if($("#userpwd").val() != $("#pwdcheck").val()) {
		alert("비밀번호 확인!!!");
		return;
	}else{
		$("#memberform").attr("action", "${root}/updatepw").submit();
// 		document.getElementById("memberform").action = "${root}/updatepw";
// 		document.getElementById("memberform").submit();
	}
});
});

</script>
</head>
<body>
<c:import url="userbar.jsp"/>

<div class="wrapper" align="center">
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="">
		<input type="hidden" name="act" id="act" value="">
		
			<h3>아이디 : <%= session.getAttribute("userid") %></h3>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호 확인</label>
				<input type="password" class="form-control" id="pwdcheck" name="pwdcheck" placeholder="">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-warning" id="updatepwBtn" >새로운 비밀번호 생성</button>
			</div>
		</form>
	</div>
</div>
		<c:import url="footer.jsp"/>
			
			
</body>
</html>