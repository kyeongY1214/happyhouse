<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ssafy.happyhouse.model.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%
	String root = request.getContextPath();
MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {

		$("#city").change(
				function() {
					let city = $('#city').val();
					console.log(city);
					$.ajax({
						url : '${root}/address/getgu', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
						type : 'post',
						contentType : 'application/json;charset=utf-8',
						dataType : "json",
						data : city,
						success : function(gulist) { //DB접근 후 가져온 데이터
							var list = '';
							$("#gu").empty();
							$.each(gulist, function(index, item) {
								list = '';
								list += "<option value=" +item+">" + item
										+ "</option>";
								$("#gu").append(list);
							});
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					})
				})

		$("#gu").change(
				function() {

					let citygu = JSON.stringify({
						"city" : $("#city").val(),
						"gu" : $("#gu").val()
					});
					$.ajax({
						url : '${root}/address/getdong', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
						method : 'post',
						contentType : 'application/json;charset=utf-8',
						dataType : 'json',
						data : citygu,
						success : function(donglist) { //DB접근 후 가져온 데이터
							var list = '';
							$("#dong").empty();
							$.each(donglist, function(index, item) {
								console.log(item);
								list = '';
								list += "<option value=" +item+">" + item
										+ "</option>";
								$("#dong").append(list);
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
		$('#house-search').click(function() {
			$("#cify-form").attr("action", "${root}/house/search");
			document.getElementById("cify-form").submit();
		});
		
		$('#fav-regist').click(function() {
			$("#cify-form").attr("action", "${root}/house/regist");
			document.getElementById("cify-form").submit();
		});
	});
</script>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<header style="font-family: Jal_Onuel;" class="mb-2">
	<div class="container nav justify-content-end">
		<%
			if (memberDto == null) {
		%>
		<ul class="nav in_nav before">
			<li class="nav-item"><a class="nav-link text-danger"
				href="${root}/member/mvregister"> <i class="fa fa-user-plus"
					aria-hidden="true" style="color: black;"></i>SignUp
			</a></li>
			<li class="nav-item"><a class="nav-link text-danger"
				data-toggle="modal" data-target="#myModal"> <i
					class="fa fa-sign-in" aria-hidden="true" style="color: black;"></i>Login
			</a></li>
		</ul>
		<%
			} else {
		%>
		<ul class="nav out_nav after">
			<li class="nav-link text-primary nav-uid"><strong>${userinfo.userName}</strong>님
				환영합니다.</li>
			<li class="nav-item"><a class="nav-link text-primary nav-uid"
				href="#" data-toggle="modal" data-target="#myInfo"><i
					class="fa fa-user" aria-hidden="true" style="color: black;"></i></a></li>
			<li class="nav-item"><a class="nav-link text-danger"
				href="<%=root%>/member/logout"><i class="fa fa-sign-out"
					aria-hidden="true" style="color: black;"></i>Logout</a></li>
		</ul>
		<%
			}
		%>
	</div>
	<div class="jumbotron jumbotron-fluid"
		style="background-image: url(<%=root%>/img/apart.jpg); background-repeat: no-repeat; background-size: cover; background-position: center;">
		<div class="container">
			<h1 style="">
				<a href="${root}"
					style="color: black; text-decoration: none; text-decoration: none;">Happy
					House</a>
			</h1>
			<div style="border-color: white; border-style: solid;"></div>
			<p style="color: #616161;">Give me, Happy House...</p>
		</div>
	</div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Links -->
		<div class="container">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="${root}/member/mvboard">게시판</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${root}/notice/list?pg=1&key=&word=">공지사항</a></li>
				<li class="nav-item"><a class="nav-link"
					href="https://news.google.com/topstories?hl=ko&gl=KR&ceid=KR:ko">오늘의뉴스</a></li>
				
				<%
					if (memberDto != null && memberDto.getUserId().equals("admin")) {
				%>
					<li class="nav-item"><a class="nav-link"
					href="${root}/member/list">회원목록</a></li>
				<% } %>
				<%-- <li class="nav-item"><a class="nav-link" href="<%=root%>/main?act=mvfavorite">관심지역등록</a></li> --%>
			</ul>
			<div>
				<form class="form-inline" id="cify-form" method="post" action="">
					<!-- <input type="hidden" id="code"  name="code" value="code"/> -->
					<div class="form-group md">
						<select class="form-control btn btn-secondary" name="mycity"
							id="city">
							<option value="" selected>도/광역시</option>
							<option value="서울특별시" class="city-option">서울특별시</option>
						</select>
					</div>
					<div class="form-group md-1">
						<select class="form-control btn btn-secondary" name="mygu" id="gu">
							<option value="">시/구/군</option>
							<c:forEach var="guguns" items="${list}" varStatus="status">
								<option value="${item}">${item}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group md-1">
						<select class="form-control btn btn-secondary" name="mydong"
							id="dong">
							<option value="">동</option>
							<c:forEach var="d" items="${dong}">
								<option value="${d}" class="dong-option">${d}</option>
							</c:forEach>
						</select>
					</div>
					<div style="margin: 5px;">
						<button type="button" class="btn-search btn btn-primary"
							id="house-search">Search</button>
						<%
							if (memberDto != null) {
						%>
						<button type="button" class="btn-fav-regist btn btn-primary"
							id="fav-regist">등록</button>
						<%
							}
						%>

					</div>
				</form>

			</div>
		</div>
	</nav>
</header>