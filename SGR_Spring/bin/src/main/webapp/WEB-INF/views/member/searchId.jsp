<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ page session="true" %>
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
<h1 style="text-align: center; color: silver;">아이디 찾기</h1>
<form action="./searchIdResult.do" id="searchId" method="Get" class="form-horizontal" >
		<fieldset>
			<legend> </legend>
			
			<div class="form-group">
			<label class="col-md-4 control-label" for="id_mb_name">이름</label>
			<div class="col-md-3">
				<input type="text" id="id_mb_name" name="mb_name" class="form-control input-md"  placeholder="UserName">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-4 control-label" for="id_mb_email">이메일</label>
			<div class="col-md-3">
				<input type="email" id="id_mb_email" name="mb_email" class="form-control input-md"  placeholder="UserEmail">
			</div>
			</div>
			<br>	
			<div class="form-group" >
				<label class="col-md-4 control-label" for=""></label>
			<div class="btnJoinArea" >
		<center>	
			<button id="submitBtn" class="btn btn-default">찾기</button>
				<button type="button" onclick="history.back()" class="btn btn-white">취소</button>
					</center>
		</div>
	
		</div>
		
		</fieldset>
	</form>
<!-- 		<a href="../member/searchPw.do">비밀번호 찾기</a> -->
	
</body>

</html>