<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴 - 비밀번호 입력</title>
<script type="text/javascript">
$(function leave() {
	// 비밀번호확인 체크 이벤트 처리
	$("#btnDelete").on("click", function() {
		var pass = document.getElementById('mb_pw').value;
		var pwd = document.getElementById('pwd').value;
		if (pass == pwd) {
			if(confirm("정말로 탈퇴하시겠습니까?")){
				$("#deleteForm").attr("action","leaveProcess.do").submit();
//                 document.deleteForm.action = "./member/leaveProcess.do";
//                 document.deleteForm.submit();
		} else if(pass !== pwd) {
			alert('비밀번호 확인 실패');
			return false;
		}//else
}//if 
});
});
</script>
<script type="text/javascript">
var result = "${message}";
if (result == "deleteNOT") {
	alert("탈퇴 안됨.");
}
</script>
</head>
<body>
	<h1>내 정보 삭제</h1>
	<form name="deleteForm" method="post" >
		<fieldset>
			<legend></legend>
			<table>
		<tr>
		<td>원래 비번</td>
		<td>
		<!-- 히든으로 보낼 값 -->
		<input type="hidden" name="mb_id" value="${member.mb_id }" id="mb_id"/>
		<input type="text" name="mb_pw" value="${member.mb_pw }" id="mb_pw"/>
		<input type="hidden" name="mb_grade" value="${member.mb_grade}" id="mb_grade"/>
		<!-- 비번 맞으면 등급 9로 바꿔야함 -->
		</td>
		</tr>
				<tr>
					<td bgcolor="black" style="color: silver;" >비밀번호</td>
					<td><input type="password" name="pwd" id="pwd" maxlength="50"  required></td>
				</tr>
				
			</table>
			<br><input type="button" value="취소" 	onclick='history.back();'> 
			<input type="button" 	value="탈퇴" id="btnDelete" >
		</fieldset>
	</form>
</body>
</html>