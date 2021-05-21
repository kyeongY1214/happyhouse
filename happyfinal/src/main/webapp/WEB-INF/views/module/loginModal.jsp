<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
    function login() {
    	if (document.getElementById("login_id").value == "") {
    		alert("아이디 입력!!!");
    		return;
    	} else if (document.getElementById("login_pw").value == "") {
    		alert("비밀번호 입력!!!");
    		return;
    	} else {
    		console.log("됨?");
    		document.getElementById("loginform").action = "${root}/member/login";
    		document.getElementById("loginform").submit();
    	}
    }
    </script>
    <style>
@font-face {
    font-family: 'Jal_Onuel';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}</style>
<div style="font-family:Jal_Onuel;" class="modal text-black" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Login</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form id="loginform" method="post" action="">
						<div class="form-group">
							<label for="uid">아이디:</label> <input type="text"
								class="form-control" placeholder="Enter id" id="login_id"
								name="login_id">
						</div>
						<div class="form-group">
							<label for="pwd">비밀번호:</label> <input type="password"
								class="form-control" placeholder="Enter password" id="login_pw"
								name="login_pw">
						</div>
						<button class="btn btn-primary btn-login" data-dismiss="modal"
							onclick="javascript:login();">로그인</button>
						<a style="color: black;" href="pwd.jsp"><i class="fa fa-key"
							aria-hidden="true"></i>비밀번호를 잊으셨나요?</a>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>