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
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}</style>
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
</head>
<body style="font-family:Jal_Onuel;">
	<%@ include file="./module/header.jsp"%>
	<!-- 상단 Header End  -->

	<!-- houseList가 있을경우 목록출력 -->
	<c:if test="${aptList.size() != 0}">
		<c:forEach var="apt" items="${aptList}">
			<table class="table table-active">
				<tbody>
					<tr class="table-info">
						<td>이름:${apt.aptName}</td>
					</tr>
					<tr>
						<td>가격:${apt.price}</td>
					</tr>
					<tr>
						<td>동:${apt.dong}</td>
					</tr>
					<tr>
						<td>면적:${apt.area}</td>
					</tr>

				</tbody>
			</table>
		</c:forEach>
	</c:if>
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


	<!-- 하단 Footer Start  -->
	<%@ include file="./module/footer.jsp"%>
	<!-- 하단 Footer End  -->

	<!-- The Modal -->
	<%@ include file="./module/loginModal.jsp"%>

				
	<%@ include file="./module/infoModal.jsp"%>
</body>
</html>
