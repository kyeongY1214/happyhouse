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

</head>
<script type="text/javascript">
	
</script>

<body style="font-family: Jal_Onuel;">
	<%@ include file="./module/header.jsp"%>
	<!-- 상단 Header End  -->

	<div class="container">
		<div style="height: 60px;"></div>
		<!-- 중앙 contents start -->
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
						var options = {
								center : new kakao.maps.LatLng(${houseList[0].lat}, ${houseList[0].lng}),
								level : 6
							};
						
						<c:forEach var="house" items="${houseList}">
							var data = {
									content : '<div><a href="${root}/house/${house.aptName}">${{house.aptName}}</a></div>',
									latlng : new kakao.maps.LatLng(${house.lat}, ${house.lng})
							}
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
						    
						    var searchwindow = new kakao.maps.InfoWindow({
						        content: positions[i].content // 인포윈도우에 표시할 내용
						        //positions[i].content
						    });
						    
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng, // 마커를 표시할 위치
						        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
						    });
						    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
						    kakao.maps.event.addListener(marker, 'mouseover', makeOutListener(infowindow));
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

		<!-- 작성한 글이 없을경우 출력 -->
		<c:if test="${houseList.size() == 0}">
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
