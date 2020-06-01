<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>HAPPYHOSE-공지사항</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">

		function movewrite() {
			location.href="${root}/notice.do?act=movewrite";
		}
		function searchNotice() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "${root}/notice.do";
			document.getElementById("searchform").submit();
		}
		</script>
	</head>
	<body>	
		<%@ include file="/user/userbar.jsp" %>
	<div class=wrapper align="center">
	  <div class="col-lg-8" align="center">
	  <h2>공지사항</h2>
	  <p>공지사항 확인해주세요!!!!!</p>  
	  <c:if test="${userinfo.userid eq 'admin' }">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right"><button type="button" class="btn btn-link" onclick="javascript:movewrite();">글쓰기</button></td>
	  	</tr>
	  </table>
	  </c:if>
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="noticelist">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
			    <option value="userid" selected="selected">아이디</option>
			    <option value="bookno">글번호</option>
			    <option value="subject">제목</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchNotice();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${notices.size() != 0}">
	  	<c:forEach var="notice" items="${notices}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info">
	        <td>작성자 : ${notice.userid}</td>
	        <td align="right">작성일 : ${notice.date}</td>
	      </tr>
	      <tr>
	        <td colspan="2" class="table-danger"><strong>${notice.bookno}. ${notice.subject}</strong></td>
	      </tr>
	      <tr>
	        <td colspan="2">${notice.context}</td>
	      </tr>
	      <c:if test="${userinfo.userid == notice.userid}">
	      <tr>
	        <td colspan="2">
			<a href="${root}/notice.do?act=mvmodify&bookno=${notice.bookno}">수정</a>
			<a href="${root}/notice.do?act=delete&bookno=${notice.bookno}">삭제</a>
			</td>
	      </tr>
	      </c:if>
	    </tbody>
	  </table>
	  	</c:forEach>
	  </c:if>
	  <c:if test="${notices.size() == 0}">
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
		<%@ include file="/user/footer.jsp" %>
	</body>
</html>
