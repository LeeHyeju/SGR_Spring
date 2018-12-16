<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>
<script>
	function checkPwd() {
		var f1 = document.forms[0];
		var pw1 = f1.mb_pw.value;
		var pw2 = f1.pwd_check.value;

		if (pw1 != pw2) {
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "동일한 비밀번호를 입력하세요.";
		} else {
			document.getElementById('checkPwd').style.color = "blue";
			document.getElementById('checkPwd').innerHTML = "비밀번호가 일치합니다.";

		}
	}
	
	$(function() {
		// 비밀번호확인 체크 이벤트 처리
		$("#changePw").on("submit", function() {
			var pass = document.getElementById('mb_pw').value;
			var passCheck = document.getElementById('pwd_check').value;
			if (pass == passCheck) {
				alert('비밀번호가 변경되었습니다.다시 로그인해주세요.');
			} else {
				alert('비밀번호 확인 실패');
				return false;
			}
		});
	});
</script>
</head>
<body>
	<h1>비밀번호 수정</h1>
	<form action="./changePw.do" id="changePw" method="post">
		<fieldset>
		<legend></legend>
		<table width="940" style="padding:5px 0 5px 0;">
<!-- 		<tr> -->
<!-- 			<th>현재 비밀번호 : </th> -->
<!-- 			<td> -->
<!-- 			<input type="hidden" > -->
<!-- 			<input type="password"id="mb_pw" name="mb_pw" required placeholder="비밀번호"></td> -->
<!-- 		</tr> -->
		<tr>
		<th>새 비밀번호 :</th>
			<td><input type="password" id="mb_pw" name="mb_pw" required placeholder="새로운 비밀번호"></td>
		</tr>
		<tr>
		<th>새 비밀번호 확인 :</th>
			<td><input type="password" id="pwd_check" name="pwd_check" onkeyup="checkPwd()"
				placeholder="새 비밀번호확인">
		<div id="checkPwd">동일한 비밀번호를 입력하세요</div>
		</td>
		</tr>
			</table>
			<button type="submit" class="btn_blk">확인</button>
		</fieldset>	
	</form>
</body>
</html>