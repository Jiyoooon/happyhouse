<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	#search_container{
		width:100%;
	}
	#left{
		float:left;
		width:60%;
	}
	
	#search_right{
		float:right;
		width:30%;
	}
</style>
<script>

//상세페이지 ajax\
function moveMap(idx){
	map.setZoom(17);
	map.setCenter(markers[idx].getPosition());//선택한 집 위치로 맵 이동
}
function moveDetail(aptname, idx){
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == xhr.DONE){
			if(xhr.status === 200 || xhr.status === 201){//동+동코드+아파트이름에 해당하는 거래정보 
				if(idx != undefined) {
					console.log(markers[idx]);
					moveMap(idx);
					//map.setZoom(17);
					//map.setCenter(markers[idx].getPosition());//선택한 집 위치로 맵 이동
				}
				
				setDetailInfo(JSON.parse(this.responseText), aptname);
				
			}else{//실패 -> 서버에러
				alert('서버 문제. 다시 시도해주세요.');
			}
		}
	};

	var url = "${root}/api/houseinfo/"+$("#dong").val()+"/"+$("#gugun").val()+"/"+aptname;
	xhr.open('GET',url);
	xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	xhr.send();
}

//상세페이지 화면 출력
function setDetailInfo(deals, aptname){
	var template = document.querySelector("#detailTemplate")
	var detailTemp="<p><strong>거래 내역</strong></p>";
	
	$("#search_left").hide();
	deals.forEach(function(deal){
		detailTemp += template.innerHTML.replace("{aptName}",aptname)
		   								.replace("{dealAmount}",deal.dealAmount)
		   								.replace("{area}",deal.area)
									   .replace("{dealYear}",deal.dealYear)
									   .replace("{dealMonth}",deal.dealMonth)
									   .replace("{dealDay}",deal.dealDay)
										.replace("{type}",deal.type);
	});
								   
	$("#search_left2").html(detailTemp);
}

$(document).ready(function(){
	console.log("document loading완료");
	$.get("${root}/api/sido"
		,function(data, status){
			console.log("sido");
			console.log(data);
			$.each(data, function(index, vo) {
				$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
			});//each
		}//function
		, "json"
	);//get
});//ready

$(document).ready(function(){
	$("#sido").change(function() {
		$.get("${root}/api/gugun/"+$("#sido").val()
				,function(data, status){
					console.log("gugun");
					console.log(data);
					$("#gugun").empty();
					$("#gugun").append('<option value="0" selected disabled>시/구/군</option>');
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
					});//each
				}//function
				, "json"
		);//get
	});//change
	$("#gugun").change(function() {
		$.get("${root}/api/dong/"+$("#gugun").val()
				,function(data, status){
					console.log("dong");
					console.log(data);
					
					$("#dong").empty();
					$("#dong").append('<option value="0" selected disabled>동</option>');
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
					});//each
				}//function
				, "json"
		);//get
	});//change
	
	
	$("#dong").change(function() {
		console.log($("#dong").val());
		$.get("${root}/api/houseinfo/"+$("#dong").val()
				,function(data, status){
					console.log(data);//가져온 아파트데이타
					deleteMarkers();//이전에 등록된 마커 다 지우기
					$("#search_left2").empty();//이전 상세거래조회 정보 지우기
					$("#search_left").show();
					$("#house_info").empty();
					$.each(data, function(index, vo) {
						//let link = "javascript:moveDetail(\'"+(vo.dong)+"\', "+(vo.code)+", \'"+(vo.AptName)+"\');";
						//"<td><a href=\"javascript:moveDetail('"+vo.dong+"', "+vo.code+", '"+vo.AptName+"');\">" + vo.AptName + "</a></td>"
						
						addMarker(vo.lat, vo.lng, vo.aptName, index);//마크 찍기
						let str = "<tr>"
						//+ "<td>" + vo.no + "</td>" //아파트번호
						//+ "<td>" + vo.dong + "</td>"
						+ "<td><a href=\"javascript:moveMap("+index+");\">" + vo.aptName + "</a></td>"
						+ "<td>" + vo.jibun + "</td>"
						//+ "<td>" + vo.code +"</td>" //동코드
						//+ "<td>" + vo.lat +"</td>"
						//+ "<td>" + vo.lng +"</td>"
						+ "<td>" + vo.buildYear +"</td>"
						$("#house_info").append(str);
						
					});//each
				}//function
				, "json"
		);//get
	});//change
});//ready

</script>
</head>
<body>
<c:import url="user/userbar.jsp"/>
<div class="wrapper">
	<div id="welcome" class="container" >
		<div class="title">
		  <h2>Welcome to our website</h2>
		</div>
		<form class="form-inline" id="search" method="post" action="" style="margin-left: 300px;" >
				<div class="form-group md">
					<select id="sido">
						<option value="0" selected disabled>도/광역시</option>
					</select>
				</div>
				<div class="form-group md">
					<select id="gugun">
						<option value="0" selected disabled>시/구/군</option>
					</select>
				</div>
				<div class="form-group md">
					<select id="dong">
						<option value="0" selected disabled>동</option>
					</select>
				</div>
	</form>	
	</div>
	<div class="row">
			<div class="col-lg-4">
			<div id="search_container">
				<div class="form-group form-check" align="center" id="left">
				<div id="search_left2"></div>
				<div id="search_left">
				  	<p align="center"><strong>거래내역</strong></p>
				  	<table border="1" id="deal-table">
					  	<thead>
			  				<tr align="center">
			  					<td  width=100px>아파트이름</td>
			  					<td  width=100px>지번</td>
			  					<td  width=100px>건축년도</td>
			  				</tr>
			  			</thead>
			  			<tbody id="house_info">
					 	 	
					  	</tbody>
				  	</table>
				 
				  <br>
				 </div>
			</div>
			</div>
			</div>
			<div class="col-lg-8">
			
				<p><strong>거래 상세 내역</strong></p>
					<!-- map start -->
					<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
					<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
					<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1paHT4dztAMDp8SibuWWhBiOjQV5-jAQ&callback=initMap"></script>
					<script>
						var markers = [];
						var multi = {lat: 37.5665734, lng: 126.978179};
						var map;
						function initMap() {
							map = new google.maps.Map(document.getElementById('map'), {
								center: multi, zoom: 12
							});
							var marker = new google.maps.Marker({position: multi, map: map});
						}
						function addMarker(tmpLat, tmpLng, aptName, idx) {
							console.log("addMarker : "+tmpLat+", "+tmpLng+", "+aptName);
							var marker = new google.maps.Marker({
								position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
								//좌표 만들기
								
								label: aptName,
								title: aptName
								//라벨과 타이틀을 주겠다. => 마우스 올라가면 아파트 이름 뜸
							});
							
							if(idx == 0){
								map.setZoom(17);
								map.setCenter(marker.getPosition());
							}
							//마커를 클릭하면 줌 레벨 새로 설정(확대), map의 센터를 현재 클릭된 마크의 포지션으로 이동해라
							marker.addListener('click', function() {
								map.setZoom(17);
								map.setCenter(marker.getPosition());
								console.log(marker.title);
								mark = marker;
								moveDetail(marker.title);
							});
							marker.setMap(map);//맵에 마커를 붙이겠다 ==> map대신 null을 주면 marker 지울 수 있음
							markers.push(marker);//marker저장
						}
						
						function deleteMarkers(){//마커 지워주기
							for(var i = 0; i < markers.length; i++){
								markers[i].setMap(null);
							}
							markers = [];
						}
					</script>
					<!-- map end -->
					<!-- search_detail -->
			</div>
	</div>
</div>
<hr>

<c:import url="user/footer.jsp"/>


<script type="search_template" id="detailTemplate">
	<table align="center">
		<tr><td>주택명 : {aptName}</td></tr>
		<tr><td>거래금액 : {dealAmount}</td></tr>
		<tr><td>전용면적 : {area}</td></tr>
		<tr><td>거래일 : {dealYear}년 {dealMonth}월  {dealDay}일</td></tr>
		<tr><td>거래타입 : {type}</td></tr>
	</table>
	<br>
</script>
</body>
</html>