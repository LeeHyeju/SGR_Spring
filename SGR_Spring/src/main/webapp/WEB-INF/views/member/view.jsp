<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보 보기</title>
<script type="text/javascript">
function leave(){
	if (confirm("정말 삭제하시겠습니까??")){ 
		alert ("탈퇴되셨습니다.");//확인
	    document.form.submit();
	    return true;
	}else{   //취소
		alert("탈퇴가 취소되셨습니다.");
		alert("감사합니다.");
		return false;
	}
	}
</script>
</head>
<body>
	<h1>MyPage</h1>
	<fieldset>
		<legend></legend>
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
	<button type="button" onclick="location.href='../member/update.do'">내 정보 수정</button>
	<button type="button" onclick="location.href='../member/changePw.do'">비밀번호	수정</button>
	<button type="button" onclick="leave();">회원탈퇴</button>
</body>


</html>