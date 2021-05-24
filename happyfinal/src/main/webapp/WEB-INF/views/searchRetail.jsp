<%@page import="com.ssafy.happyhouse.model.HouseDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ssafy.happyhouse.model.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<style>
@font-face {
	font-family: 'Jal_Onuel';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>
<head>
<meta charset="UTF-8" />
<title>Happy House</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$(function() {

		$("#retailcity").change(
				function() {
					let city = $('#retailcity').val();
					console.log(city);
					$.ajax({
						url : '${root}/address/getgu', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
						type : 'post',
						contentType : 'application/json;charset=utf-8',
						dataType : "json",
						data : city,
						success : function(gulist) { //DB접근 후 가져온 데이터
							var list = '';
							$("#retailgu").empty();
							$.each(gulist, function(index, item) {
								list = '';
								list += "<option value=" +item+">" + item
										+ "</option>";
								$("#retailgu").append(list);
							});
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					})
				})

		$("#retailgu").change(
				function() {

					let citygu = JSON.stringify({
						"city" : $("#retailcity").val(),
						"gu" : $("#retailgu").val()
					});
					$.ajax({
						url : '${root}/address/getdong', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
						method : 'post',
						contentType : 'application/json;charset=utf-8',
						dataType : 'json',
						data : citygu,
						success : function(donglist) { //DB접근 후 가져온 데이터
							var list = '';
							$("#retaildong").empty();
							$.each(donglist, function(index, item) {
								console.log(item);
								list = '';
								list += "<option value=" +item+">" + item
										+ "</option>";
								$("#retaildong").append(list);
							});
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					})
				})
				
				$("#retaildong").change(
				function() {

					let citygu = JSON.stringify({
						"city" : $("#retailcity").val(),
						"gu" : $("#retailgu").val(),
						"dong" : $("#retaildong").val()
					});
					$.ajax({
						url : '${root}/address/getkind',
						method : 'post',
						contentType : 'application/json;charset=utf-8',
						dataType : 'json',
						data : citygu,
						success : function(kindlist) { //DB접근 후 가져온 데이터
							var list = '';
							$("#retailkind").empty();
							$.each(kindlist, function(index, item) {
								console.log(item);
								list = '';
								list += "<option value=" +item+">" + item
										+ "</option>";
								$("#retailkind").append(list);
							});
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					})
				})
				
	})
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#retail_search').click(function() {
			$("#retail_from").attr("action", "${root}/retail/search");
			document.getElementById("retail_from").submit();
		});
	});
</script>

</head>



<body style="font-family: Jal_Onuel;">
	<%@ include file="./module/header.jsp"%>
	<!-- 상단 Header End  -->

	<div>
		<form class="form-inline" id="retail_from" method="post" action="">
			<!-- <input type="hidden" id="code"  name="code" value="code"/> -->
			<div class="form-group md">
				<select class="form-control btn btn-secondary" name="mycity"
					id="retailcity">
					<option value="" selected>도/광역시</option>
					<option value="서울특별시" class="city-option">서울특별시</option>
				</select>
			</div>
			<div class="form-group md-1">
				<select class="form-control btn btn-secondary" name="mygu"
					id="retailgu">
					<option value="">시/구/군</option>
					<c:forEach var="guguns" items="${list}" varStatus="status">
						<option value="${item}">${item}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group md-1">
				<select class="form-control btn btn-secondary" name="mydong"
					id="retaildong">
					<option value="">동</option>
					<c:forEach var="d" items="${dong}">
						<option value="${d}" class="dong-option">${d}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group md-1">
				<select class="form-control btn btn-secondary" name="mykind"
					id="retailkind">
					<option value="">업종</option>
					<c:forEach var="d" items="${kind}">
						<option value="${d}" class="kind-option">${d}</option>
					</c:forEach>
				</select>
			</div>
			<div style="margin: 5px;">
				<button type="button" class="btn-search btn btn-primary"
					id="retail_search">주변상가찾기</button>
			</div>
		</form>

	</div>

	<div class="container">
		<div style="height: 60px;"></div>


		<div class="row">
			<!-- 중앙 center contents start -->
			<div class="col-md-12">
				<!-- 지도 Section Start  -->
				<div class="container">
					<div id="map" style="max-width: 1200px; height: 500px;"></div>

					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb94e0a165fada25939d9bf736b9992f"></script>
					<script>
						var container = document.getElementById('map');

						var jsonarray = new Array();
						
						var index=0;
						var positions= [];
						<c:forEach var="retail" items="${retailList}">
							if(index==0){
								var options = {
										center : new kakao.maps.LatLng(${retail.lat}, ${retail.lng}),
										level : 6
									};
								index++;
							}
							var data = {
									content : '<div>${{retail.name}}</div>',
									latlng : new kakao.maps.LatLng(${retail.lat}, ${retail.lng})
							}
							document.write(data);
							positions.push(data);
						</c:forEach>
					
						var map = new kakao.maps.Map(container, options);

						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					   
						for (var i = 0; i < positions.length; i ++) {

						    // 마커 이미지의 이미지 크기 입니다
						    var imageSize = new kakao.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
						    
						    var infowindow = new kakao.maps.InfoWindow({
						        content: positions[i].content // 인포윈도우에 표시할 내용
						    });
						    
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng, // 마커를 표시할 위치
						        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
						    });
						    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
						    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
						}
						
						
						// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
						function makeOverListener(map, marker, infowindow) {
						    return function() {
						        infowindow.open(map, marker);
						    };
						}

						// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
						function makeOutListener(infowindow) {
						    return function() {
						        infowindow.close();
						    };
						}
					</script>
				</div>

			</div>
			<div style="height: 40px;"></div>
			<!-- 중앙 contents end -->
		</div>
	</div>

	<div>
		<c:if test="${retailList.size() != 0}">
			<c:forEach var="retail" items="${retailList}">
				<table class="table table-active">
					<tbody>
						<tr>
							<td>이름 : ${retail.name}</td>
						</tr>
						<tr>
							<td>상세 : ${retail.detail}</td>
						</tr>
						<tr>
							<td>주소 : ${retail.address}</td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</c:if>
		<c:if test="${retailList.size() == 0}">
			<table class="table table-active">
				<tbody>
					<tr class="table-info" align="center">
						<td>정보가 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</c:if>
	</div>

	<%@ include file="./module/footer.jsp"%>
	<!-- 하단 Footer End  -->

	<!-- The Modal -->
	<%@ include file="./module/infoModal.jsp"%>
	<%@ include file="./module/loginModal.jsp"%>


</body>
</html>
