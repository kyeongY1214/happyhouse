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
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}</style>
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
	});
</script>

</head>
<body>
	<%@ include file="./module/header.jsp"%>
	<!-- 상단 Header End  -->
	<section style="font-family:Jal_Onuel;">
		<div class="container pt-5" align="center">
			<div class="container" align="center">
				<h2>관심지역등록</h2>
			</div>
			<div class="container">
				<div>
					<form class="form-inline" id="facity-form" method="post" action="">
						<!-- <input type="hidden" id="code"  name="code" value="code"/> -->
						<div class="form-group md">
							<select class="form-control btn btn-secondary" name="facity"
								id="facity">
								<option value="" selected>도/광역시</option>
								<option value="서울특별시" class="city-option">서울특별시</option>
							</select>
						</div>
						<div class="form-group md-1">
							<select class="form-control btn btn-secondary" name="fagu"
								id="fagu">
								<option value="">시/구/군</option>
								<c:forEach var="guguns" items="${list}" varStatus="status">
									<option value="${item}">${item}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group md-1">
							<select class="form-control btn btn-secondary" name="fadong"
								id="fadong">
								<option value="">동</option>
								<c:forEach var="d" items="${dong}">
									<option value="${d}" class="dong-option">${d}</option>
								</c:forEach>
							</select>
						</div>
						<div style="margin: 5px;">
							<button type="button" class="btn-search btn btn-primary"
								id="house-summit">등록</button>
						</div>
					</form>

				</div>
			</div>
			<div>
				<c:if test="${houseList.size() == 0}">
					<div>관심지역을 등록해주세요.</div>
				</c:if>
				<c:if test="${houseList.size() != 0}">
					<div>
						<c:forEach var="houseVo" items="${houseList}" varStatus="status">
							<table class="table table-active">
								<tbody>
									<tr class="table-info">
										<td>${houseVo.aptName}</td>
									</tr>
									<tr>
										<td>${houseVo.gugun}</td>
									</tr>
									<tr>
										<td>${houseVo.dong}</td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
					</div>
				</c:if>
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