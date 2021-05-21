<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<style>
@font-face {
    font-family: 'Jal_Onuel';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}</style>
<meta charset="UTF-8">
<title>Happy House | Find Password</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href ="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function find() {
	if(document.getElementById("uid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("uname").value == "") {
		alert("이름 입력!!!");
		return;
	}else if(document.getElementById("mail").value == "") {
		alert("이메일 입력!!!");
		return;
	} else {
		alert("이메일로 임시 비밀 번호를 보냈습니다.");
		document.getElementById("findform").action = "${root}/main";
		document.getElementById("findform").submit();
	}
}
	 
function moveJoin() {
	document.location.href = "${root}/main?act=mvregister";
}	
</script>
</head>
<body style="font-family:Jal_Onuel;">
<%@ include file="./module/header.jsp" %>
	<!-- 상단 Header End  -->
   <section>
   	 <div class="container pt-5">
	      <div class="container" align="center">
	        <h2>비밀번호 찾기</h2>	       
	      </div>

	       <div class="container">
	       	<form id="findform" method="post" action="" class="needs-validation p-3 my-3" novalidate>

			  <div class="form-group p-2 m-3">
			    <label for="uid">UserID:</label>
			    <input type="text" class="form-control" id="uid" placeholder="Enter UserID" name="uid" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>			  
			  <div class="form-group p-2 m-3">
			    <label for="uname">UserName:</label>
			    <input type="text" class="form-control" id="uname" placeholder="Enter UserName" name="uname" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>			  
			  <div class="form-group p-2 m-3">
			    <label for="mail">E-mail:</label>
			    <input type="text" class="form-control" id="mail" placeholder="Enter E-mail" name="mail" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  <div class="row justify-content-center">
			  <button type="submit" class="find-btn btn btn-primary mx-3" onclick="javascript:find();">찾기</button>
			  </div>
			</form>
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