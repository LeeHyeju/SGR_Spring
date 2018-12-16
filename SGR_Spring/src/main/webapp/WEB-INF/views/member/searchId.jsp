<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
	var result = "${message}";
	if (result == "failId") {
		alert("회원정보가 맞지 않습니다. 다시 확인하세요.");
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#searchId").on("submit", function() {
			// 		alert("전송시작");
			var id_mb_name = $("#id_mb_name").val();
			var id_mb_email = $("#id_mb_email").val();

			if (id_mb_name.length == 0) {
				alert("이름을 입력하세요.")
				return false;
			}
			if (id_mb_email.length == 0) {
				alert("이메일을 입력하세요.")
				return false;
			}
		});
	});
</script>
</head>
<body>
<h1>아이디 찾기</h1>
<form action="./searchIdResult.do" id="searchId" method="Get">
		<fieldset>
			<legend> </legend>
			<p>
				<label for="id_mb_name">이름</label> 
				<input type="text" id="id_mb_name" name="mb_name" placeholder="UserName">
			</p>
			<p>
				<label for="id_mb_email">이메일</label> 
				<input type="email" id="id_mb_email" name="mb_email" placeholder="UserEmail">
			</p>
			<p>
				<button id="submitBtn">찾기</button>
				<button type="button" onclick="history.back()">취소</button>
			</p>
		</fieldset>
	</form>
<!-- 		<a href="../member/searchPw.do">비밀번호 찾기</a> -->
	
</body>

</html>