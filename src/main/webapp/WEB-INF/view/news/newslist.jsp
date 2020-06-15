<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>경제 뉴스</title>
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

		</script>
	</head>
	<body>	
		<%@ include file="../user/userbar.jsp" %>
	<div class=wrapper align="center">
	  <div class="col-lg-8" align="center">
	  <h2>뉴스</h2>
	  <p>핫한 뉴스</p>  
	  <c:if test="${newslist.size() != 0}">
	  	<c:forEach var="news" items="${newslist}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" >
	        <td rowspan="4"><img src="${news.imglink}"></td>
	      </tr>
	      <tr>
	        <td align="center"><strong><a href="${news.link}"> ${news.title}</a></strong></td>
	      </tr>
	      <tr>
	      	<td align="center">${news.summary }</td>
	      </tr>
	      <tr><td>${news.company }</td></tr>
	    </tbody>
	  </table>
	  	</c:forEach>
	  </c:if>
	  <c:if test="${newslist.size() == 0}">
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
		<%@ include file="../user/footer.jsp" %>
	</body>
</html>
