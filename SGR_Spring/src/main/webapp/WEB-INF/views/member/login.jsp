<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script type="text/javascript">
	var result = "${message}";
	var findId = "${findId}"
	if (result == "checkpw")
		alert("비밀번호가 메일로 발송되었습니다.");
	else if (result == "checkId")
		alert(findId);
</script>
<script type="text/javascript">
	var result = "${message}";
	if (result == "fail")
		alert("회원 정보가 없습니다.");
</script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.login-form {
	width: 340px;
	margin: 50px auto;
}

.login-form form {
	margin-bottom: 15px;
	background: #f7f7f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}

.form-control, .btn {
	min-height: 38px;
	border-radius: 2px;
}

.btn {
	font-size: 15px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="login-form">
		<form action="./login.do" id="loginForm" method="post">
			<h2 class="text-center">Log in</h2>
			<div class="form-group">
				<input type="text" id="mb_id" name="mb_id" class="form-control"
					placeholder="Username" required="required">
			</div>
			<div class="form-group">
				<input type="password" id="mb_pw" name="mb_pw" class="form-control"
					placeholder="Password" required="required">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block">Log
					in</button>
			</div>
			<div class="clearfix">
				<p>
					<a href="../member/searchId.do" class="pull-right">Forgot Id?</a>
				</p>
			</div>
			<div>
				<p>
					<a href="../member/searchPw.do" class="pull-right">Forgot
						PassWord?</a>
				</p>
			</div>
		</form>
		<p class="text-center">
			<a href="../member/join.do">Create an Account</a>
		</p>
	</div>
</body>
</html>