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
	$(function() {
		$("#gu").change(function() {
			$.ajax({
				url : '${root}/chart/gugunhi/' + $("#gu").val(),
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : function(datas) {
					console.log(datas);
					makehiChart(datas);
				},
				error : function(xhr, status, msg) {
					console.log("상태값 : " + status + " Http에러메시지 : " + msg);
				}
			});

			$.ajax({
				url : '${root}/chart/gugunlow/' + $("#gu").val(),
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : function(datas) {
					makelowChart(datas);
				},
				error : function(xhr, status, msg) {
					console.log("상태값 : " + status + " Http에러메시지 : " + msg);
				}
			});
		})
	})

	function makehiChart(datas) {

		var ctx = document.getElementById('myhiChart');
		var arr = [ , , , , , ];
		var ti = [ , , , , , ];
		console.log(datas);
		$(datas).each(function(index, data) {
			console.log(data);
			arr[index] = data.price;
			ti[index] = data.dong;
		});

		var myhiChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : ti,
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
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				onClick : function(point, event) {
					mvsearch(event);
				},
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
	function makelowChart(datas) {

		var ctx = document.getElementById('mylowChart');
		var arr = [ , , , , , ];
		var ti = [ , , , , , ];
		console.log(datas);
		$(datas).each(function(index, data) {
			console.log(data);
			arr[index] = data.price;
			ti[index] = data.dong;
		});

		var mylowChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : ti,
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
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1,

				} ]
			},
			options : {
				onClick : function(point, event) {
					mvsearch(event);
				},
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
	function mvsearch(event) {
		location.href = "${root}/house/search/" + event[0]._view.label;
	}
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$.ajax({
					url : '${root}/news/getNewsbudongsan',
					type : 'GET',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',

					success : function(datas) {
						console.log(datas);
						$("#newsbudongsan").empty();
						var html = "<table class='table table-hover'>";
						html += "<thead class='thead-dark'>"
						html += "<tr align = 'center'>";
						html += "<th>부동산 관련 기사</th>";
						html += "</tr>"
						html += "</thead>";
						var news = $("#news");

						$.each(datas, function(index, item) {
							html += "<tr align = 'center'>";
							html += "<td><a href="+item.link+" /a>"+ item.title + "</td>";
							html += "</tr>";
						});

						html += "</table>";
						$("#newsbudongsan").append(html);
					},
					error : function(xhr, status, msg) {
						console.log("상태값 : " + status + " Http에러메시지 : " + msg);
					}
				});

				$.ajax({
					url : '${root}/news/getNewsjutak',
					type : 'GET',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',

					success : function(datas) {
						console.log(datas);
						$("#newsjutak").empty();
						var html = "<table class='table table-hover'>";
						html += "<thead class='thead-dark'>"
						html += "<tr align = 'center'>";
						html += "<th> 주택 관련 기사</th>";
						html += "</tr>"
						html += "</thead>";
						var news = $("#news");

						$.each(datas, function(index, item) {
							html += "<tr align = 'center'>";
							html += "<td><a href="+item.link+" /a>"+ item.title + "</td>";
							html += "</tr>";
						});

						html += "</table>";
						$("#newsjutak").append(html);
					},
					error : function(xhr, status, msg) {
						console.log("상태값 : " + status + " Http에러메시지 : " + msg);
					}
				});

				$.ajax({
					url : '${root}/chart/mkhichart',
					type : 'GET',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(datas) {
						maketohiChart(datas);
					},
					error : function(xhr, status, msg) {
						console.log("상태값 : " + status + " Http에러메시지 : " + msg);
					}
				});

				$.ajax({
					url : '${root}/chart/mklowchart',
					type : 'GET',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(datas) {
						maketolowChart(datas);
					},
					error : function(xhr, status, msg) {
						console.log("상태값 : " + status + " Http에러메시지 : " + msg);
					}
				});

				function maketohiChart(datas) {

					var ctx = document.getElementById('mytohiChart');
					var arr = [ , , , , , ];
					var ti = [ , , , , , ];
					console.log(datas);
					$(datas).each(function(index, data) {
						console.log(data);
						arr[index] = data.price;
						ti[index] = data.dong;
					});

					var myhiChart = new Chart(ctx, {
						type : 'line',
						data : {
							labels : ti,
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
								borderWidth : 3
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
				function maketolowChart(datas) {
					var ctx = document.getElementById('mytolowChart');
					var arr = [ , , , , , ];
					var ti = [ , , , , , ];
					console.log(datas);
					$(datas).each(function(index, data) {
						console.log(data);
						arr[index] = data.price;
						ti[index] = data.dong;
					});

					var mylowChart = new Chart(ctx,
							{
								type : 'line',
								data : {
									labels : ti,
									datasets : [ {
										label : 'Bottom 5 Chart',
										data : arr,
										backgroundColor : [
												'rgba(54, 162, 235, 0.2)', ],
										borderColor : [
												'rgba(255, 99, 132, 1)',
												'rgba(54, 162, 235, 1)',
												'rgba(255, 206, 86, 1)',
												'rgba(75, 192, 192, 1)',
												'rgba(153, 102, 255, 1)',
												'rgba(255, 159, 64, 1)' ],
										borderWidth : 3
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

			});
</script>

<STYLE TYPE="text/css">
table {
	font-size: 15pt;
}
</STYLE>
</head>

<body style="font-family: Jal_Onuel;">
	<%@ include file="./module/header.jsp"%>
	<!-- 상단 Header End  -->
	<div class="container">
		<!-- 중앙 contents start -->
		<div class="row">
			<!-- 차트 Section Start  -->
			<div class="col-md-6">
				<canvas id="mytohiChart"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="mytolowChart"></canvas>
			</div>

			<div class="col-md-6">
				<canvas id="myhiChart"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="mylowChart"></canvas>
			</div>

			<!-- 중앙 center contents start -->
			<div class="col-md-12">
				<div class="row mt-5">
					<!-- 부동산 뉴스  -->
					<div class="col-md-6" id="newsbudongsan"></div>
					<!-- 부동산 뉴스  -->
					<div class="col-md-6" id="newsjutak"></div>
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
