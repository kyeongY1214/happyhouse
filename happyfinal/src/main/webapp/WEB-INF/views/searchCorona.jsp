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

<script>
	$(function() {
		$("#hoscity").change(
				function() {
					let city = $('#hoscity').val();
					console.log(city);
					$.ajax({
						url : '${root}/address/getgu', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
						type : 'post',
						contentType : 'application/json;charset=utf-8',
						dataType : "json",
						data : city,
						success : function(gulist) { //DB접근 후 가져온 데이터
							var list = '';
							$("#hosgu").empty();
							$.each(gulist, function(index, item) {
								list = '';
								list += "<option value=" +item+">" + item
										+ "</option>";
								$("#hosgu").append(list);
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
		$('#hospital_search').click(function() {
			$("#hospital_from").attr("action", "${root}/hospital/search");
			document.getElementById("hospital_from").submit();
		});
		
		$(".page-item").click(function() {
			$("#pg").val(($(this).attr("data-pg")));
			
			$("#pageform").attr("action", "${root}/hospital/search").submit();
		});
	});
</script>


</head>

<body style="font-family: Jal_Onuel;">
	<%@ include file="./module/header.jsp"%>
	<!-- 상단 Header End  -->

	<div class="container">
		<form class="form-inline" id="hospital_from" method="get" action="">
			<!-- <input type="hidden" id="code"  name="code" value="code"/> -->
			<div class="form-group md">
				<select class="form-control btn btn-secondary" name="mycity"
					id="hoscity">
					<option value="" selected>도/광역시</option>
					<option value="서울특별시" class="city-option">서울특별시</option>
				</select>
			</div>
			<div class="form-group md-1">
				<select class="form-control btn btn-secondary" name="mygu"
					id="hosgu">
					<option value="">시/구/군</option>
					<c:forEach var="guguns" items="${list}" varStatus="status">
						<option value="${item}">${item}</option>
					</c:forEach>
				</select>
			</div>
			<div style="margin: 5px;">
				<button type="button" class="btn-search btn btn-primary"
					id="hospital_search">코로나 진료소 찾기</button>
			</div>
		</form>
	</div>
	
	<div class="container"> 
	
		<div style="height: 60px;"></div>
		<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="mygu" id="hmygu" value="${hospitalList[0].gu}">
		</form>
			<c:if test="${hospitalList.size() != 0}">
					<div>
						<c:forEach var="hospital" items="${hospitalList}"
							varStatus="status">
							<table class="table table-active">
								<tbody>
									<tr>
										<td>이름:${hospital.name}</td>
									</tr>
									<tr>
										<td>주소:${hospital.address}</td>
									</tr>
									<tr>
										<td>전화번호:${hospital.tel}</td>
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
			<c:if test="${hospitalList.size() == 0}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td>정보가 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>


	
	<div style="height: 40px;"></div>
	<!-- 중앙 contents end -->
		
	
		

		<%@ include file="./module/footer.jsp"%>
		<!-- 하단 Footer End  -->

		<!-- The Modal -->
		<%@ include file="./module/infoModal.jsp"%>
		<%@ include file="./module/loginModal.jsp"%>
</body>
</html>
