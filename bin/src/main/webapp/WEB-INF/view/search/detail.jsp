<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Page</title>
</head>
<body>
	<c:if test="${house != null}">
		<table align="center">
			<tr><td>주택명 : ${house.aptName}</td></tr>
			<tr><td>거래금액 : ${house.dealAmount}</td></tr>
			<tr><td>월세금액 : ${house.rentMoney}</td></tr>
			<tr><td>건축년도 : ${house.buildYear}</td></tr>
			<tr><td>전용면적 : ${house.area}</td></tr>
			<tr><td>거래일 : ${house.dealYear}년 ${house.dealMonth}월  ${house.dealDay}일</td></tr>
			<tr><td>법정동 : ${house.dong}</td></tr>
			<tr><td>지번 : ${house.jibun}</td></tr>
			<tr><td>지번 : ${house.lat}</td></tr>
			<tr><td>지번 : ${house.lng}</td></tr>
		</table>
	</c:if>
	<!-- 
	<c:if test="${house == null }">
		<p>해당 거래정보가 존재하지 않습니다.</p>
	</c:if>
	<a href="/search/list.jsp">목록으로 돌아가기</a>
	 -->
</body>
</html>