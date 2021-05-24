<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ssafy.happyhouse.model.MemberDto"%>
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
<script src="/wp-content/themes/Newspaper-child/assets/js/all.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<script type="text/javascript">

$(document).ready(function() {
	

	$.ajax({
		url:'${root}/chart/mkhichart',  
		type:'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		success:function(datas) {
			makehiChart(datas);
		},
		error:function(xhr,status,msg){
			console.log("상태값 : " + status + " Http에러메시지 : "+msg);
		}
	});
	
	$.ajax({
		url:'${root}/chart/mklowchart',  
		type:'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		success:function(datas) {
			makelowChart(datas);
		},
		error:function(xhr,status,msg){
			console.log("상태값 : " + status + " Http에러메시지 : "+msg);
		}
	});
});
function makehiChart(datas){
	var ctx = document.getElementById('myhiChart');
	var arr= [, , , , ,  ];
	var ti = [, , , , ,  ];
	console.log(datas);
	$(datas).each(function(index, data) {
		console.log(data);
		arr[index] = data.price;
		ti[index] = data.dong;
	});
	
	var myhiChart = new Chart(ctx,
			{
				type : 'bar',
				data : {
					labels :ti,
					datasets : [ {
						label : 'Top 5 Chart',
						data : arr,
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
}
function makelowChart(datas){
	var ctx = document.getElementById('mylowChart');
	var arr= [, , , , ,  ];
	var ti = [, , , , ,  ];
	console.log(datas);
	$(datas).each(function(index, data) {
		console.log(data);
		arr[index] = data.price;
		ti[index] = data.dong;
	});
	
	var mylowChart = new Chart(ctx,
			{
				type : 'bar',
				data : {
					labels :ti,
					datasets : [ {
						label : 'Bottom 5 Chart',
						data : arr,
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
}
</script>
</head>
<body style="font-family: Jal_Onuel;">

	

	<%@ include file="./module/header.jsp"%>
	<!-- 상단 Header End  -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<canvas id="myhiChart"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="mylowChart"></canvas>
			</div>
		</div>
	</div>

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
						var options = {
							center : new kakao.maps.LatLng(37.5915245479787,
									126.9768010428442),
							level : 6
						};

						var map = new kakao.maps.Map(container, options);
						var markerPosition = new kakao.maps.LatLng(
								37.5915245479787, 126.9768010428442);
						var marker = new kakao.maps.Marker({
							position : markerPosition
						});
						marker.setMap(map);
					</script>
				</div>

				<div class="row mt-5">
					<!-- 인기글 Article Start  -->
					<div class="col-md-6">
						<h4>[ 주택 관련 기사 ]</h4>
						<table class="table table-hover">
							<thead class="thead-dark">
								<tr>
									<th class="title">제목</th>
									<th>작성자</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>‘은행’과 ‘보험사’의 주택담보대출 조건</td>
									<td>이주녕</td>
									<td>12</td>
								</tr>
								<tr>
									<td>12.16 대책 후 ‘매수·매도자 모두 일단 관망세’</td>
									<td>조밍기</td>
									<td>98</td>
								</tr>
								<tr>
									<td>구미시, 낙동강 변 국가3산단에 민간공원 조성</td>
									<td>류해면</td>
									<td>856</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 인기글 Article End  -->
					<!-- 최신글 Article Start  -->
					<div class="col-md-6">
						<h4>[ 오늘의 뉴스 ]</h4>
						<table class="table table-hover">
							<thead class="thead-dark">
								<tr>
									<th class="title">제목</th>
									<th>작성자</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>KB국민은행, ‘디지털헌금바구니’ 출시</td>
									<td>안싸피</td>
									<td>122</td>
								</tr>
								<tr>
									<td>제6회 INAK사회공헌대상 프레스클럽부문 수상</td>
									<td>하싸피</td>
									<td>948</td>
								</tr>
								<tr>
									<td>삼성전자, 한샘과 공동사업 강화 위한 업무협약 체결</td>
									<td>김싸피</td>
									<td>86</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 최신글 Article End  -->
				</div>
			</div>
			<!-- 중앙 center contents end -->

		</div>
		<div style="height: 40px;"></div>
		<!-- 중앙 contents end -->
	</div>
	<!-- 하단 Footer Start  -->
	<%@ include file="./module/footer.jsp"%>
	<!-- 하단 Footer End  -->

	<!-- The Modal -->
	<%@ include file="./module/loginModal.jsp"%>


	<%@ include file="./module/infoModal.jsp"%>

</body>
</html>
