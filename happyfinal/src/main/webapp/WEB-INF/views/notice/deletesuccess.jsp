<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/main.do"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
<head>
 <style>
@font-face {
    font-family: 'Jal_Onuel';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}</style>
  <title>SSAFY-글삭제성공</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../module/header.jsp"%>
	<!-- 상단 Header End  -->	
<div class="container" align="center" style="font-family:Jal_Onuel;">
	<div class="col-lg-6" align="right">
	</div>
	<div class="col-lg-6">
	  <div class="jumbotron">
	    <h1>글삭제 성공!!!</h1>      
	  </div>  
	  <p><a href="${root}/main?act=list&pg=1&key=&word=">글목록</a></p>
	</div>
</div>
</body>
<!-- 하단 Footer Start  -->
	<%@ include file="../module/footer.jsp"%>
	<!-- 하단 Footer End  -->

	<!-- The Modal -->
	<%@ include file="../module/loginModal.jsp"%>


	<%@ include file="../module/infoModal.jsp"%>
</html>
</c:if>