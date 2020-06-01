<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>happy house 회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#memberform").submit(function() {//아이디 중복체크여부 & 비번, 이메일 형식 체크
		var pwReg = /^[a-zA-Z0-9]{6,15}$/;
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!$("#idcheck").attr("disabled")){
			alert("아이디 중복확인을 해주세요.");
			return false;
		} else if(!pwReg.test($("#userpwd").val())){
			alert("비밀번호는 영문 숫자 포함 6자리 이상이어야 합니다.");
			$("#userpwd").focus();
			return false;
		} else if(!emailReg.test($("#email").val())) {
			alert("이메일 형식이 안맞습니다. 다시 확인해주세요.");
			return false;
		} else return true;
	});
	 
	/*
	$("#idcheck").click(function(){
		$.ajax({
			url:"${root}/user.do?act=checkid&id="+$("#userid").val()
			, type:'GET'
			, success:function(){
				console.log(data);
			}
		})
	});*/
	//아이디 text 변경 실시간 감지
	
	$("#userid").on("change keyup paste", function(){
		$("#idcheck").text("중복확인");
		$("#idcheck").attr("disabled", false);
	});
	
	
	$("#idcheck").click(function(){
		//아이디중복확인(ajax)
		$.get("${root}/checkid/"+$("#userid").val()
			,function(data, status){
				if(data.idExist){//아이디 중복
					$("#dup_warn").css("display","block");
				}else{//아이디 사용가능
					$("#dup_warn").css("display","none");
					$("#idcheck").attr("disabled", true);
					$("#idcheck").text("사용가능");
				}
			}//function
			, "json"
		);//get
		/*
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == xhr.DONE){
				if(xhr.status === 200 || xhr.status === 201){
					var resp = JSON.parse(this.responseText);

					if(resp.idExist){//아이디 중복
						$("#dup_warn").css("display","block");
					}else{//아이디 사용가능
						$("#dup_warn").css("display","none");
						$("#idcheck").attr("disabled", true);
						$("#idcheck").text("사용가능");
					}
				}else{//실패 -> 서버에러
					alert('서버 문제. 다시 시도해주세요.');
				}
			}
		};
		xhr.open('GET',"${root}/checkid/"+$("#userid").val());
		xhr.send();
		*/
	});
});
</script>
</head>
<body>
<c:import url="userbar.jsp"/>
<div class="wrapper" align="center">
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="${root}/join">
		<input type="hidden" name="act" id="act" value="join">
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" required>
				<button type="button" id="idcheck">중복확인</button> <!-- 확인 완료 후 비활성화 -->
				<p style="display:none; color:red" id="dup_warn">이미 사용중인 아이디입니다.</p><!-- 만약 중복된 아이디이면 display:block으로 변경 -->
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="영문 숫자 포함 6자리 이상" required>
			</div>
			<div class="form-group" align="left">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="User Name" required>
			</div>
			<div class="form-group" align="left">
				<label for="">이메일</label><br>
				<input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
			</div>
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<input type="tel" class="form-control" id="tel" name="tel" placeholder="010-xxx-xxxx" required>
			</div>
			<div class="form-group" align="center">
				<input type="submit" class="btn btn-primary" id="registerBtn" value="등록">
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>

<c:import url="footer.jsp"/>

</body>
</html>