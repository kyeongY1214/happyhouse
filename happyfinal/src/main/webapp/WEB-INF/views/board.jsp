<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang=en>
<head>
<meta charset=utf-8>
<meta http-equiv=X-UA-Compatible content="IE=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=icon href=/favicon.ico>
<title>vue-board</title>
<style>
.router-link-exact-active {
	color: red;
}

.table {
	margin: 20px auto;
}
</style>
<link rel=stylesheet
	href=https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css
	integrity=sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh
	crossorigin=anonymous>
<script
	src=https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js></script>
<link href=/css/app.ed82ff8b.css rel=preload as=style>
<link href=/js/app.ce09a6f1.js rel=preload as=script>
<link href=/js/chunk-vendors.2d0172b9.js rel=preload as=script>
<link href=/css/app.ed82ff8b.css rel=stylesheet>
</head>
<body>
	<%@ include file="./module/header.jsp"%>
	<div id=app></div>
	<%@ include file="./module/footer.jsp"%>
	<%@ include file="./module/loginModal.jsp"%>


	<script src=/js/chunk-vendors.2d0172b9.js></script>
	<script src=/js/app.ce09a6f1.js></script>
</body>
</html>
