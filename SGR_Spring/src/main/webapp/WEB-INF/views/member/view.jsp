<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보 보기</title>
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-primary").on("click", function() {
			formObj.attr("action", "../member/update.do");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".btn-warning").on("click", function() {
			formObj.attr("action", "../member/changePw.do");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".btn-danger").on("click", function() {
			formObj.attr("action", "../member/leave.do");
			formObj.attr("method", "get");
			formObj.submit();
		});
	});
</script>
</head>
<body>
	<h1>MyPage</h1>
	<fieldset>
		<legend></legend>
		<form role="form" method="post">
			<!-- 히든으로 보낼 값 -->
			<input type="hidden" name="mb_id" value="${member.mb_id }" id="mb_id" />
			<input type="hidden" name="mb_pw" value="${member.mb_pw }" id="mb_pw" />
		</form>

		<table width="940" style="padding: 5px 0 5px 0;">
			<tr>
				<th>내 이름</th>
				<td>${member.mb_name }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${member.mb_sex}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${member.mb_bday }</td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td>${member.mb_phone }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${member.mb_email }</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>${member.mb_zipcode}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${member.mb_address}${member.mb_addressDetail}</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${member.mb_joinDate}" /></td>
			</tr>
		</table>
	</fieldset>
	<br>
	<br>
	<button type="submit" class="btn btn-primary">내정보수정</button>
	<button type="submit" class="btn btn-warning">비밀번호수정</button>
	<button type="submit" class="btn btn-danger">회원탈퇴</button>


</body>
</html>