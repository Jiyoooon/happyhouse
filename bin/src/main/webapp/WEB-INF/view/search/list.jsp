<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래목록</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
/*
function search() {
    var isChk = false;
    var arr_condition=document.getElementsByName("type");
    for(var i=0;i<arr_condition.length;i++){
        if(arr_condition[i].checked == true) {
            isChk = true;
            break;
        }
    }
    if(!isChk){
        alert("주택타입은 반드시 한개 이상을 선택해야 합니다.");
        return ;
    }
    else{
		document.getElementById("search").action = "${root}/main.do";
		document.getElementById("search").submit();	
    }
}
*/



</script>
</head>
<body>
<div class="container" align="center">
	<div class="form-group form-check" align="center">
	<!-- 
	<form id="search" method="post" action="">
		<input type="hidden" name="act" id="act" value="search">
		
		<label class="form-check-label">
			  <input class="form-check-input" type="checkbox" id="apartsale" name="type" value="0">아파트 매매
		</label>
		<label class="form-check-label">
			 	<input class="form-check-input" type="checkbox" id="apartrent" name="type" value="1">아파트 전월세
		</label>
		
		<label class="form-check-label">
			  <input class="form-check-input" type="checkbox" id="housesale" name="type" value="2">다세대,주택 매매
		</label>
		
		<label class="form-check-label">
			  <input class="form-check-input" type="checkbox" id="houserent" name="type" value="3">다세대,주택 전월세
		</label>
		
		<div class="form-search">
			<select name="condition" id="condition">
				<option value="dong">동</option>
    			<option value="apartment">아파트명</option>
    			<option value="all" selected="selected">all</option>
			</select>	
			<input type="text" class="form-control" id="searchvalue" name="searchvalue" placeholder="">
			<button type="button" class="btn btn-primary" onclick="javascript:search();">검색</button>
		</div>
	</form>	
	 -->
	<c:if test="${houses.size() != 0}">
	  	<p align="center">거래내역</p>
	  	<table border="1">
	  	<thead>
	  		<tr align="center">
	  			<td id="no" width=100px>번호</td>
	  			<td  width=100px>동</td>
	  			<td  width=100px>아파트이름</td>
	  			<td  width=100px>거래금액</td>
	  			<td  width=100px>거래종류</td>
	  		</tr>
	  	</thead>
	  	<c:forEach var="house" items="${houses}">
				<tr align="center">
				<!-- main.do?act=detailSearch&no=${house.no} -->
					<td width=100px><a href="javascript:moveDetail(${house.no}, '${house.dong}',${house.code},'${house.aptName}');">${house.no}</a></td>
					<td width=100px>${house.dong}</td>
					<td width=100px>${house.aptName}</td>
					<td width=100px>${house.dealAmount}</td>
					<td width=100px>${house.type}</td>
				</tr>
	  	</c:forEach>
	  	</table>
	  </c:if>
	  <c:if test="${houses.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>해당하는 거래정보가 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	</div>
</div>
</body>
</html>