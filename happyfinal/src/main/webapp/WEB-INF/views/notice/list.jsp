<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>Happy_House_공지사항</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			
			$('#mvWriteBtn').focusin(function() {
				$(location).attr("href", "${root}/notice/write");
			});
			
			$("#searchBtn").click(function() {
				
				if($("#sword").val() == "") {
					alert("모든 목록 조회!!");
				} 
				$("#searchform").attr("action", "${root}/notice/list").submit();
			});
			
			$(".page-item").click(function() {
				$("#pg").val(($(this).attr("data-pg")));
				$("#pageform").attr("action", "${root}/notice/list").submit();
			});
			
		});

		</script>
	</head>
	<body>	
	<%@ include file="../module/header.jsp"%>
	
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class="container" align="center">
	
	  <h2>공지사항 </h2>
	  <table class="table table-borderless">
	  	<tr>
	  	<%
					if (memberDto != null && memberDto.getUserId().equals("admin")) {
		%>
	  		<td align="right"><button type="button" id="mvWriteBtn" class="btn btn-link">글쓰기</button></td>
	  	<%
					}
		%>
	  	</tr>
	  </table>
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="pg" id="pg" value="1">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="skey">
			    <option value="userid" selected="selected">아이디</option>
			    <option value="noticeno">글번호</option>
			    <option value="subject">제목</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="sword">
			  <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <!-- <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="spp" id="spp" onchange="javascript:countList();">
			    <option value="10" selected="selected">10개씩보기</option>
			    <option value="20">20개씩보기</option>
			    <option value="50">50개씩보기</option>
			  </select>
			</td>
	  	</tr>
	  </table> -->
	  <c:if test="${notices.size() != 0}">
	  	<c:forEach var="notice" items="${notices}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info">
	        <td>작성자 : ${notice.userid}</td>
	        <td align="right">작성일 : ${notice.regtime}</td>
	      </tr>
	      <tr>
	        <td colspan="2" class="table-danger"><strong>${notice.noticeno}. ${notice.subject}</strong></td>
	      </tr>
	      <tr>
	        <td colspan="2">${notice.content}</td>
	      </tr>
	      <c:if test="${userinfo.userId == notice.userid}">
	      <tr>
	        <td colspan="2">
			<a href="${root}/notice/modify?noticeno=${notice.noticeno}">수정</a>
			<a href="${root}/notice/delete?noticeno=${notice.noticeno}">삭제</a>
			</td>
	      </tr>
	      </c:if>
	    </tbody>
	  </table>
	  	</c:forEach>
	  	<table>
	  	<tr>
	  	<td>
	  	${navigation.navigator}
	  	</td>
	  	</tr>
	  	</table>
	  </c:if>
	  <c:if test="${notices.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>작성된 글이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
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