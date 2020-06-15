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
	map.setCenter(houseMarkers[idx].getPosition());//선택한 집 위치로 맵 이동
}
function moveDetail(aptname, idx){
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == xhr.DONE){
			if(xhr.status === 200 || xhr.status === 201){//동+동코드+아파트이름에 해당하는 거래정보 
				if(idx != undefined) {
					moveMap(idx);
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

//document 로딩 완료 후 곧바로 실행
$(document).ready(function(){
	$.get("${root}/api/sido"
		,function(data, status){
			$.each(data, function(index, vo) {
				$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
			});//each
		}//function
		, "json"
	);//get
	
	$.get("${root}/api/trade/codename"
		,function(data, status){
			
			let str = "<option value='all' selected>전체</option>";
			$.each(data, function(idx, item){
				str += "<option value='"+item+"'>"+item+"</option>";
			});
				
			$("#trade_select_box").html(str);
		}//function
		, "json"
	);//get
		
	//현재 사용자의 관심지역 가져오기!
	if('${userinfo.userid}' != ''){
		$.get("${root}/api/area/${userinfo.userid}"
			,function(data, status){
			console.log("area!!");
				console.log(data);
				intrestArea = data;
			}//function
			, "json"
		);//get
	}
});//ready


var tradeInfos;//시구군 선택 후 가져온 상권정보 저장
var preSelected = 'all';
var intrestArea;//관심지역 리스트 저장

$(document).ready(function(){
	$("#sido").change(function() {
		$("#intrest_area_add").css("display", "none");
		$("#intrest_area_remove").css("display", "none");
		$.get("${root}/api/gugun/"+$("#sido").val()
				,function(data, status){
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
		//관심지역 여부 체크
		setIntrestBtn($("#dong").val());
		//상권
		$("#trade_section").css("display","");//상권 codename 리스트
		$("#trade_select_box").val('all');
		$("#trade_selected").html('');
		preSelected = 'all';
		
		$.get("${root}/api/houseinfo/"+$("#dong").val()
				,function(data, status){
					deleteHouseMarkers();//이전에 등록된 집마커 다 지우기
					//이전에 등록된 상점마커 다 지우기
					for(var i = 0; i < tradeMarkers.length; i++){
						tradeMarkers[i].setMap(null);
					}
					
					$("#search_left2").empty();//이전 상세거래조회 정보 지우기
					$("#search_left").show();
					$("#house_info").empty();
					$.each(data, function(index, vo) {
						
						addHouseMarker(vo.lat, vo.lng, vo.aptName, index);//마크 찍기
						let str = "<tr>"
						+ "<td><a href=\"javascript:moveMap("+index+");\">" + vo.aptName + "</a></td>"
						+ "<td>" + vo.jibun + "</td>"
						+ "<td>" + vo.buildYear +"</td>"
						$("#house_info").append(str);
					});//each
				}//function
				, "json"
		);// houseinfo get
		
		$.get("${root}/api/trade/"+$("#gugun").val()+"/"+$("#dong").val()
				,function(data, status){
					tradeInfos = data;
					
					$.each(data, function(index, vo) {
						addTradeMarker(vo.lat.substring(1, vo.lat.length-1)
										, vo.lng.substring(1, vo.lng.length-1)
										, vo.shopname
										, vo.codename2);//마크 찍기
					});//each
				}//function
				, "json"
		);// houseinfo get
	});//change
	
	
	//상권정보 selectBox change event
	$("#trade_select_box").change(function(){
		let value = $("#trade_select_box").val();
		let isDup = false;
		
		//이미 선택된 카테고리라면 return
		$("#trade_selected button").each(function(idx, item){
		    if(value == item.innerText) {
		    	isDup = true;
		    	return false;//break
		    }
		    
		});
		
		if(isDup == false){
			if(preSelected == 'all'){//이전에 selected였던게 all이라면
				for(var i = 0; i < tradeMarkers.length; i++){
					tradeMarkers[i].setMap(null);
				}
			}
			if(value == 'all'){//지금 누른게 all이라면
				for(var i = 0; i < tradeMarkers.length; i++){
					tradeMarkers[i].setMap(map);
				}
				$("#trade_selected").html('');
			}else{
				$("#trade_selected").append("<button type='button' class='btn btn-light btn-sm' onclick='removeTrade(this);'>"+value+"</button>");
				addTradeMarkers(value);
			}
			
			preSelected = value;//이전에 눌렸던 정보 갱신
		}
	});
	
});//ready



function removeTrade(btn){
	deleteTradeMarkers(btn.innerText);
	btn.remove();
}


function setIntrestBtn(dong){
	let check = false;
	$.each(intrestArea, function(idx, item){
		if(item.area_dong == dong){//관심지역 목록에 있다면
			check = true;
			$("#intrest_area_add").css("display", "none");
			$("#intrest_area_remove").css("display", "");
			return false;
		}
	});
	
	if(!check){//관심지역 목록에 없음
		$("#intrest_area_add").css("display", "");
		$("#intrest_area_remove").css("display", "none");
	}
}


//관심지역에서 제거
function removeIntrestArea(){
	if('${userinfo.userid}' == ''){
		alert('로그인 후 이용 가능한 서비스입니다.');
		return;
	}
	
	$.ajax({
        type: "DELETE"
        , url: "${root}/api/area/${userinfo.userid}/"+$("#dong").val()
        , success: 
        	function(data, status){
				if(data == 'success'){
					$("#intrest_area_add").css("display", "");
					$("#intrest_area_remove").css("display", "none");
					alert("관심지역에서 제거되었습니다!");
				}
			}//function
	});//delete
}

//관심지역에 추가
function addIntrestArea(){
	if('${userinfo.userid}' == ''){
		alert('로그인 후 이용 가능한 서비스입니다.');
		return;
	}
	
	$.ajax({
		type: "POST"
		, url: "${root}/api/area"
		, data: JSON.stringify({
			area_sido: $("#sido option:selected").text()
			, area_gugun: $("#gugun option:selected").text()
			, area_dong: $("#dong").val()
		})
		, contentType: "application/json; charset=utf-8"
		, success:
			function(data, status){
				if(data == 'success'){
					$("#intrest_area_add").css("display", "none");
					$("#intrest_area_remove").css("display", "");
					alert("관심지역으로 등록되었습니다!");
				}
			}//function
	});//post
}
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
				<!-- 관심지역 추가 & 삭제 -->
				<c:if test="${userinfo ne null }"><!-- 로그인 한 상태라면 -->
					<div id="intrest_area" class="form-group md" style="margin-left:10px;">
						<button type="button" id="intrest_area_add" class="btn btn-light btn-sm" 
							onclick="addIntrestArea();" style="display:none">관심추가</button>
						<button type="button" id="intrest_area_remove" class="btn btn-secondary btn-sm"
							onclick="removeIntrestArea();" style="display:none">관심제거</button>
					</div>
				</c:if>
		</form>	
	</div>
	<div class="row">
			<div class="col-lg-4">
			<div id="search_container">
				<div class="form-group form-check" align="center" id="left">
				<div id="search_left2"></div>
				<div id="search_left">
				  	<p align="center"><strong>거래내역</strong></p>
				  	<!-- 상권데이터 드롭다운&체크박스 + => 집 선택시마다 가장 가까운 지하철역 & 버스정류장까지의 거리 보여주기-->
				  	<div id="trade_section" style="display:none" multiple>
				  		<p>상권정보 선택</p>
				  		<select id="trade_select_box" name="trade"></select>
				  		<div id="trade_selected"></div>
				  	</div>
				  	
				  	<table border="1" id="deal-table">
					  	<thead>
			  				<tr align="center">
			  					<td  width=100px>아파트이름</td>
			  					<td  width=100px>지번</td>
			  					<td  width=100px>건축년도</td>
			  				</tr>
			  			</thead>
			  			<tbody id="house_info"></tbody>
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
						var houseMarkers = [];
						var tradeMarkers = [];
						var multi = {lat: 37.5665734, lng: 126.978179};
						var map;
						var tradeIcon;

						function initMap() {
							map = new google.maps.Map(document.getElementById('map'), {
								center: multi, zoom: 12
							});
							tradeIcon = new google.maps.MarkerImage("./img/trade_marker.png", null, null, null, new google.maps.Size(12,20));
							var marker = new google.maps.Marker({position: multi, map: map});
						}
	
						function addTradeMarker(lat, lng, shopname, codename){
							var marker = new google.maps.Marker({
								position: new google.maps.LatLng(parseFloat(lat),parseFloat(lng)),
								//좌표 만들기
								icon: tradeIcon,
								title: codename,
								label: shopname,
								sinppet: shopname,
								alpha: 0.5
							});
							
							marker.setMap(map);//맵에 마커를 붙이겠다
							tradeMarkers.push(marker);//marker저장
						}
						
						function addHouseMarker(tmpLat, tmpLng, aptName, idx) {
							var marker = new google.maps.Marker({
								position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
								//좌표 만들기
								
								label: aptName,//지도에 써짐
								title: aptName,//마우스 올라가면 뜸
								alpha: 0.5
								//여기에 버스&지하철역 까지의 거리? snippet으로?
							});
							
							if(idx == 0){
								map.setZoom(17);
								map.setCenter(marker.getPosition());
							}
							//마커를 클릭하면 줌 레벨 새로 설정(확대), map의 센터를 현재 클릭된 마크의 포지션으로 이동해라
							marker.addListener('click', function() {
								map.setZoom(17);
								map.setCenter(marker.getPosition());
							});
							
							marker.setMap(map);//맵에 마커를 붙이겠다 ==> map대신 null을 주면 marker 지울 수 있음
							houseMarkers.push(marker);//marker저장
						}
						
						function deleteHouseMarkers(){//집 마커 지워주기
							for(var i = 0; i < houseMarkers.length; i++){
								houseMarkers[i].setMap(null);
							}
							houseMarkers = [];
						}
						
						function addTradeMarkers(code){//trade 마커 추가하기
							$.each(tradeInfos, function(idx, vo){
								if(vo.codename1 == code) tradeMarkers[idx].setMap(map);
							});
						}
						function deleteTradeMarkers(code){//trade 마커 지워주기
							$.each(tradeInfos, function(idx, vo){
								if(vo.codename1 == code) tradeMarkers[idx].setMap(null);
							});
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