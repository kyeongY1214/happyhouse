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
</head>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,
	p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,
	dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,
	i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	do: inherit;
	vertical-align: baseline;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

blockquote, q {
	quotes: none;
}

blockquote : before, blockquote : after, q : before, q : after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

/*css 초기화*/
.card {
	height: 150px;
	width: 200px;
	border-radius: 15px;
	display: inline-block;
	margin-top: 30px;
	margin-left: 30px;
	margin-bottom: 30px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow: hidden;
}

.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	width: 100%;
	height: 270px;
	border-radius: 15px 15px 0 0;
	background-image: url("images/korea.jpeg");
	background-size: 100% 280px;
	background-repeat: no-repeat;
}

.card:hover .card-header {
	opacity: 0.8;
	height: 100px;
}

.card-header-is_closed {
	background-color: #EF5A31;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	margin: 15px 15px 0 0;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px;
	line-height: 20px;
}

h1 {
	font-size: 22px;
	font-weight: bold;
}

.card-body {
	
}

.card-body-header {
	line-height: 25px;
	margin: 10px 20px 0px 20px;
}

.card-body-description {
	opacity: 0;
	color: #757B82;
	line-height: 25px;
	-webkit-transition: .2s ease-in-out; /*사파리&크롬*/
	-moz-transition: .2s ease-in-out; /*파이어폭스*/
	-ms-transition: .2s ease-in-out; /*익스플로러*/
	-o-transition: .2s ease-in-out; /*오페라*/
	transition: .2s ease-in-out;
	overflow: hidden;
	height: 180px;
	margin: 5px 20px;
}

.card:hover .card-body-description {
	opacity: 1;
	-webkit-transition: .5s ease-in-out;
	-moz-transition: .5s ease-in-out;
	-ms-transition: .5s ease-in-out;
	-o-transition: .5s ease-in-out;
	transition: .5s ease-in-out;
	overflow: scroll;
}

.card-body-hashtag {
	color: #2478FF;
	font-style: italic;
}

.card-body-footer {
	position: absolute;
	margin-top: 15px;
	margin-bottom: 6px;
	bottom: 0;
	width: 314px;
	font-size: 14px;
	color: #9FA5A8;
	padding: 0 15px;
}

.icon {
	display: inline-block;
	vertical-align: middle;
	margin-right: 2px;
}

.icon-view_count {
	width: 25px;
	height: 17px;
	background: url("images/eye.jpg") no-repeat;
}

.icon-comments_count {
	margin-left: 5px;
	width: 25px;
	height: 17px;
	background: url("images/comment.jpg") no-repeat;
}

.reg_date {
	float: right;
}
</style>





<body style="font-family: Jal_Onuel;">
	<%@ include file="./module/header.jsp"%>
	<!-- 상단 Header End  -->
	<!-- houseList가 있을경우 목록출력 -->
	<c:if test="${aptList.size() != 0}">
		<c:forEach var="apt" items="${aptList}">
			<div class="card">
				<div class="card-header-is_closed"></div>
				<div class="card-body">
					<div class="card-body-header">
						<h1>${apt.aptName}</h1>
						<p class="card-body-hashtag">${apt.dong}
						<p>
						<p class="card-body-nickname">
							<tr>
								<td>가격:${apt.price}<br></td>
							</tr>
							<tr>
								<td>면적:${apt.area}<br></td>
							</tr>
						</p>
					</div>
				</div>
			</div>
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
