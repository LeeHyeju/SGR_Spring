<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
		var result = "${message}";
		if(result=="failpw"){
			alert("회원정보가 맞지 않습니다. 다시 확인해주세요^^");
		}
	</script>
<script type="text/javascript">
$(function() {
	$("#searchPw").on("submit", function() {
		// 		alert("전송시작");
		var pw_mb_name = $("#pw_mb_name").val();
		var pw_mb_email = $("#pw_mb_email").val();
		var pw_mb_id = $("#pw_mb_id").val();

		if (pw_mb_id.length == 0) {
			alert("아이디를 입력하세요.")
			return false;
		}
		if (pw_mb_name.length == 0) {
			alert("이름을 입력하세요.")
			return false;
		}
		if (pw_mb_email.length == 0) {
			alert("이메일을입력하세요.")
			return false;
		}

	});
});
</script>	
</head>
<body>
<div>
	<form action="./searchPwResult.do" id="searchPw" method="GET">
		<fieldset>
			<legend>비밀번호 찾기 </legend>
			<p>
				<label for="mb_id">아이디</label> <input type="text" id="pw_mb_id"
					name="mb_id" placeholder="UserId">
			</p>

			<p>
				<label for="mb_name">이름</label> <input type="text" id="pw_mb_name"
					name="mb_name" placeholder="UserName">
			</p>

			<p>
				<label for="mb_email">이메일</label> <input type="text" id="pw_mb_email"
					name="mb_email" placeholder="UserEmail">
			</p>

			<p>
				<button id="submitBtn">찾기</button>
				<button type="button" onclick="history.back();">취소</button>
			</p>
		</fieldset>
	</form>
	</div>

</body>
</html>