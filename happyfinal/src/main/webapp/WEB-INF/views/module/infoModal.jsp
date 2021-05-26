<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
    function modify() {
    	if (document.getElementById("info_id").value == "") {
    		alert("아이디 입력!!!");
    		return;
    	} else if (document.getElementById("info_pw").value == "") {
    		alert("비밀번호 입력!!!");
    		return;
    	} else {
    		console.log("됨?");
    		document.getElementById("modifyform").action = "${root}/member/modify";
    		document.getElementById("modifyform").submit();
    	}
    }

	function deleteinfo() {
		if (document.getElementById("info_id").value == "") {
			alert("아이디 입력!!!");
			return;
		} else if (document.getElementById("info_pw").value == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			console.log("됨?");
			document.getElementById("modifyform").action = "${root}/member/delete";
			document.getElementById("modifyform").submit();
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
<div style="font-family:Jal_Onuel;" class="modal text-black" id="myInfo">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header" >
					<h4 class="modal-title">회원정보</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="modifyform" method="post" action="">
						
						<div class="form-group">
							<p> 이름:  ${userinfo.userName} </p>
						</div>
						
						<div class="form-group">
							<label for="uid">아이디:</label> <input type="text" name="info_id" id="info_id"
								class="form-control"  value="${userinfo.userId}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="pwd">비밀번호:</label> <input type="text" name="info_pw" id="info_pw"
								class="form-control" placeholder="${userinfo.userPwd}" value="${userinfo.userPwd}">
						</div>
						
						<div class="form-group">
							<label for="pwd">주소 :</label> <input type="text" name="info_address" id="info_pw"
								class="form-control"   placeholder="${userinfo.address}" value="${userinfo.address}">
						</div>
						
						<div class="form-group">
						<p><strong>관심지역 </strong>
							<c:if test="${favoriteArea.size() == 0}">
								정보가 없습니다. 지역을 설정해 주세요
							</c:if>
							<br>
							<c:if test="${favoriteArea.size() != 0}">
								<c:forEach var="farea" items="${favoriteArea}">
										${farea}<br>
								</c:forEach>
							</c:if>
							</p>
						</div>
						
						<button onclick="javascript:modify();"
							class="btn btn-primary btn-login" data-dismiss="modal">수정</button>
							<button onclick="javascript:deleteinfo();"
							class="btn btn-danger btn-login" data-dismiss="modal">탈퇴</button>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	
	