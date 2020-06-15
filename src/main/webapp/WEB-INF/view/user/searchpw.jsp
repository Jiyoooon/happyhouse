<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<title>비밀번호찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
/*
 * 
$(document).ready(function() {
	$("#searchpwBtn").click(function() {
		
		if($("#userid").val() == "") {
			alert("ID 입력!!!");
			return;
		} else if($("#userphone").val() == "") {
			alert("핸드폰번호 입력!!!");
			return;
		} else {
			
			document.location.href = "${root}/searchpw";
		}
	});
	 
}); */

</script>
</head>
<body>
<c:import url="userbar.jsp"/>

<div class="wrapper" align="center">
	<div class="col-lg-6" align="center">
		<c:if test="${msg ne null }">${msg }</c:if>
		<form id="memberform" method="get" action="${root}/searchpw">
		<input type="hidden" name="act" id="act" value="searchpw">
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">전화번호</label>
				<input type="text" class="form-control" id="tel" name="tel" placeholder="">
			</div>
			<div class="form-group" align="center">
				<button type="submit" class="btn btn-warning" id="searchpwBtn" >비밀번호 찾기</button>
			</div>
		</form>
	</div>
</div>
		<c:import url="footer.jsp"/>
			
			
</body>
</html>