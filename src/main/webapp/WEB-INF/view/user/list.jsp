<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>

<c:if test="${userinfo == null}">
	<c:redirect url="${root}"/>
</c:if>

<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>회원정보</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">

		function searchMember() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "${root}/memberlist";
			document.getElementById("searchform").submit();
// 			document.location.href = "${root}/memberlist";
		}
		</script>
	</head>
	<body>	
	 <%@ include file="userbar.jsp" %>
	<div class="wrapper" align="center">
	  <div class="col-lg-8" align="center">
	  <h2>관리자 페이지</h2>
	  <p>회원정보 조회</p>  
<%-- 	  <c:if test="${userinfo.userid eq 'admin' }"> --%>
<!-- 	  <table class="table table-borderless"> -->
<!-- 	  	<tr> -->
<!-- 	  		<td align="right"><button type="button" class="btn btn-link" onclick="javascript:movewrite();">글쓰기</button></td> -->
<!-- 	  	</tr> -->
<!-- 	  </table> -->
<%-- 	  </c:if> --%>
	  <form id="searchform" method="get" class="form-inline" action="">
<!-- 	  <input type="hidden" name="act" id="act" value="memberlist"> -->
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
			    <option value="userid" selected="selected">아이디</option>
			    <option value="username">이름</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchMember();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${members.size() != 0}">
			  <table class="table table-active">
			  <thead>
           <tr><th>아이디</th><th>이름</th><th>이메일</th><th>핸드폰 번호</th></tr>
        </thead>
			    <tbody>
    		  	<c:forEach var="member" items="${members}">
			      <tr class="table-info">
			        <td>${member.userid}</td>
			        <td>${member.username}</td>
			        <td>${member.email}</td>
			        <td>${member.tel}</td>
			      </tr>
				  	</c:forEach>
			    </tbody>
			  </table>
	  </c:if>
	  <c:if test="${members.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>작성된 글이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	</div>
	 <%@ include file="footer.jsp" %>
	</body>
</html>
</c:if>