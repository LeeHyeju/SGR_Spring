<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<script type="text/javascript">
	var result = "${message}";
	if(result == "fail"){
		alert("비밀번호를 확인해주세요.");
	}
	else if(result=="success"){
		alert("회원정보 수정으로 넘어갑니다.");
	}
</script>
</head>
<body>
	<h1>비밀번호 확인</h1>
	<form action="./pwCheck.do" id="PasswordCheck" method="post">
		<fieldset>
			<legend> </legend>
			<table width="940" style="padding: 5px 0 5px 0;">
				<tr>
					<th>현재 비밀번호 :</th>
					<td><input type="password" id="mb_pw"
						name="mb_pw" required placeholder="현재 비밀번호"
						style="height: 20px; text-align: center; font-size: 15px;"></td>
				</tr>
			</table>
			<div class="btnJoinArea">
				<button type="submit" class="btn_blk">확인</button>
				<button type="button" class="btn_blk" onclick="history.back();">취소</button>
			</div>

		</fieldset>
	</form>
</body>
</html>