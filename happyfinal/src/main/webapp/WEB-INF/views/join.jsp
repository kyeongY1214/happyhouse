<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
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
<title>SSAFY-회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#registerBtn").click(function() {

		if($("#username").val() == "") {
			alert("이름 입력!!!");
			return;
		} else if($("#userid").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else if($("#userpwd").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else if($("#email").val() == "") {
			alert("이메일 확인!!!");
			return;
		} else if($("#address").val() == "") {
			alert("주소 확인!!!");
			return;
		}else {
			console.log("확인");
			document.getElementById("joinform").action = "${root}/member/regist";
			document.getElementById("joinform").submit();
		}
	});
	 
	$('#zipcode').focusin(function() {
		$('#zipModal').modal();
	});
});


</script>
</head>
<body>

<body style="font-family:Jal_Onuel;">
   <%@ include file="./module/header.jsp" %>
   <section>
	  <div class="container pt-5">
	      <div class="container" align="center">
	        <h2>회원 가입</h2>	       
	      </div>

	       <div class="container">
	       	  <form class="needs-validation p-3 my-3" id="joinform" method="post" action="" >
			  <div class="form-group p-2 m-3">
			    <label for="userid">UserID:</label>
			    <input type="text" class="form-control" id="userid" placeholder="Enter UserID" name="userId" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  <div class="form-group p-2 m-3">
			    <label for="userpwd">Password:</label>
			    <input type="password" class="form-control" id="userpwd" placeholder="Enter Password" name="userPwd" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  <div class="form-group p-2 m-3">
			    <label for="username">UserName:</label>
			    <input type="text" class="form-control" id="username" placeholder="Enter UserName" name="userName" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>			  
			  <div class="form-group p-2 m-3">
			    <label for="email">E-mail:</label>
			    <input type="text" class="form-control" id="email" placeholder="Enter E-mail" name="email" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  
			  <div class="form-group p-2 m-3">
			    <label for="address">Address:</label>
			    <input type="text" class="form-control" id="address" placeholder="Enter Address" name="address" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  <div class="row justify-content-center">
			  <button type="button" id="registerBtn" class="btn btn-primary mx-3">Submit</button>
			  <button type="reset" class="btn btn-danger mx-3">Reset</button>
			  </div>
			</form>
			</div>
	  </div>
	</section>
	    <!-- 하단 Footer Start  -->
   <%@ include file="./module/footer.jsp" %>
    <!-- 하단 Footer End  -->
    
    <!-- The Modal -->
<%@ include file="./module/loginModal.jsp"%>

				
	<!-- The Modal -->
<%@ include file="./module/infoModal.jsp"%>
</body>
</body>
</html>