<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/main"/>
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
  <title>SSAFY-공지사항 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  function writeArticle() {
	if(document.getElementById("subject").value == "") {
		alert("제목 입력!!!!");
		return;
	} else if(document.getElementById("content").value == "") {
		alert("내용 입력!!!!");
		return;
	} else {
	  	document.getElementById("writeform").action = "${root}/main";
	  	document.getElementById("writeform").submit();
	}
  }
  
  function cancelModify() {
	  history.back();
  }
  </script>
</head>
<body>
<%@ include file="../module/header.jsp"%>
	<!-- 상단 Header End  -->	
<div class="container" align="center" style="font-family:Jal_Onuel;">
	<div class="col-lg-6" align="right">
	</div>
	<div class="col-lg-6" align="center">
		<h2>공지사항 글수정</h2>
		<form id="writeform" method="post" action="">
		<input type="hidden" name="act" id="act" value="armodify">
		<input type="hidden" name="articleno" id="articleno" value="${article.articleno}">
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject" value="${article.subject}">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content">${article.content}</textarea>
			</div>
			<button type="button" class="btn btn-primary" onclick="javascript:writeArticle();">글수정</button>
			<button type="button" class="btn btn-warning" onclick="javascript:cancelModify();">취소</button>
		</form>
	</div>
</div>
<!-- 하단 Footer Start  -->
	<%@ include file="../module/footer.jsp"%>
	<!-- 하단 Footer End  -->

	<!-- The Modal -->
	<%@ include file="../module/loginModal.jsp"%>


	<%@ include file="../module/infoModal.jsp"%>
</body>
</html>
</c:if>