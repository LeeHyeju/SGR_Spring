<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ page session="true" %>
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
<h1 style="text-align: center; color: silver;">비밀번호 찾기</h1>
	<form action="./searchPwResult.do" id="searchPw" method="GET" class="form-horizontal">
		<fieldset>
			<legend></legend>
			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_id">아이디</label>
			<div class="col-md-3">
			<input type="text" id="pw_mb_id" name="mb_id" placeholder="UserId" class="form-control input-md">
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_name">이름</label>
			<div class="col-md-3">
			<input type="text" id="pw_mb_name" 	name="mb_name" placeholder="UserName" class="form-control input-md">
			</div>
			</div>
			
		<div class="form-group">
			<label class="col-md-4 control-label" for="mb_email">이메일</label>
			<div class="col-md-3">
			<input type="text" id="pw_mb_email" name="mb_email" placeholder="UserEmail" class="form-control input-md">
			</div>
			</div>
			<div class="form-group" >
				<label class="col-md-4 control-label" for=""></label>
			<div class="btnJoinArea" >
		<center>	
			<p>
				<button id="submitBtn" class="btn btn-default">찾기</button>
				<button type="button" onclick="history.back();" class="btn btn-white">취소</button>
		</center>
		</div>
		</div>
		</fieldset>
	</form>
	</div>

</body>
</html>