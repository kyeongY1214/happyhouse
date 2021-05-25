<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.ssafy.happyhouse.model.MemberDto,com.ssafy.happyhouse.model.HouseDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<style>
@font-face {
	font-family: 'Jal_Onuel';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

div.left {
	width: 50%;
	float: left;
	box-sizing: border-box;
}

div.right {
	width: 50%;
	float: right;
	box-sizing: border-box;
}
</style>
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
<script type="text/javascript">
	function favorite() {
		document.location.href = "${root}/main?act=favorite";
	}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>
	$(function() {
		$("#facity").change(
				function() {
					var act = "getfagu";
					$.ajax({
						url : '${root}/main', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
						mathod : 'post',
						data : {
							"act" : act,
							"facity" : $('#facity').val()
						},
						dataType : "json",
						success : function(data) { //DB접근 후 가져온 데이터
							console.log("성공?")
							var list = '';
							$("#fagu").empty();
							$.each(data, function(index, item) {
								list = '';
								list += "<option value=" +item+">" + item
										+ "</option>";
								$("#fagu").append(list);
							});
						},
						error : function(data) {
							console.log('error!!!!!!!');
						}
					})
				})

		$("#fagu").change(
				function() {
					var act = "getfadong";
					$.ajax({
						url : '${root}/main', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
						mathod : 'post',
						data : {
							"act" : act,
							"fagu" : $('#fagu').val(),
							"facity" : $('#facity').val()
						},
						dataType : "json",
						success : function(data) { //DB접근 후 가져온 데이터
							var list = '';
							$("#fadong").empty();
							$.each(data, function(index, item) {
								console.log(item);
								list = '';
								list += "<option value=" +item+">" + item
										+ "</option>";
								$("#fadong").append(list);
							});
						},
						error : function(data) {
							console.log('error!!!!!!!');
						}
					})
				})
	})
</script>




<script type="text/javascript">
	$(document).ready(function() {
		$('#house-summit').click(function() {
			$("#facity-form").attr("action", "${root}/main?act=setfavorite");
			document.getElementById("facity-form").submit();
		});
		
		$(".page-item").click(function() {
			$("#pg").val(($(this).attr("data-pg")));
			$("#pageform").attr("action", "${root}/favorite/mvfav").submit();
		});
	});
</script>

</head>
<body>
	<%@ include file="./module/header.jsp"%>
	<!-- 상단 Header End  -->

	<div class="container">
		<div style="height: 30px;"></div>
		<!-- 중앙 contents start -->
		<div class="row">
			<!-- 중앙 center contents start -->
			<div class="col-md-12">
				<div style="text-align:center" >
					<h2> <strong> 나의 관심 지역 :  ${houseList[0].dong} </strong> </h2>
					
				</div>
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
						var options = {
								center : new kakao.maps.LatLng(${houseList[0].lat}, ${houseList[0].lng}),
								level : 6
							};
						<c:forEach var="house" items="${houseList}">
							var data = {
									content : '<div>${{house.aptName}}</div>',
									latlng : new kakao.maps.LatLng(${house.lat}, ${house.lng})
							}
							console.log(data);
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


		<section style="font-family: Jal_Onuel;">
		
		<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">
		</form>
		
			<div class="left container pt-5" align="center">
				관심 매물
				<c:if test="${houseList.size() == 0}">
					<div>관심지역을 등록해주세요.</div>
				</c:if>
				<c:if test="${houseList.size() != 0}">
					<div>
						<c:forEach var="house" items="${houseList}" varStatus="status">
							<table class="table table-active">
								<tbody>
									<tr class="table-info">
										<td>이름:${house.aptName}
											</p>
										</td>
									</tr>
									<tr>
										<td><a href="${root}/house/${house.aptName}">상세보기</a></td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
						<table>
						<tr>
						<td>${navigation.navigator}</td>
						</tr>
						</table>
					</div>
				</c:if>
			</div>
			<div class="right container pt-5" align="center">
				근처 코로나 진료소
				<c:if test="${hospitalList.size() == 0}">
					<div>관심지역을 등록해주세요.</div>
				</c:if>
				<c:if test="${hospitalList.size() != 0}">
					<div>
						<c:forEach var="hospital" items="${hospitalList}"
							varStatus="status">
							<table class="table table-active">
								<tbody>
									<tr>
										<td>이름:${hospital.name}
											</p>
										</td>
									</tr>
									<tr>
										<td>주소:${hospital.address}
											</p>
										</td>
									</tr>
									<tr>
										<td>전화번호:${hospital.tel}
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
					</div>
				</c:if>
			</div>
	</div>
	</div>
	</section>
	<!-- 하단 Footer Start  -->
	<%@ include file="./module/footer.jsp"%>
	<!-- 하단 Footer End  -->

	<!-- The Modal -->
	<%@ include file="./module/loginModal.jsp"%>


	<%@ include file="./module/infoModal.jsp"%>
</body>
</html>