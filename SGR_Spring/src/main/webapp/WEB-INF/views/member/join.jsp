<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="./join.do" id="joinForm" method="post">
		<fieldset>
			<legend>회원가입 정보 입력 폼</legend>
			<table width="940" style="padding: 5px 0 5px 0;">
				<tr>
					<th>이름</th>
					<td><input type="text" style="height: 30px; text-align: center;" id="mem_name"
						name="mem_name" size="7" required placeholder="이름" 	pattern="^[가-힣]{2,6}$"></td>
				</tr>

				<tr>
					<th>아이디</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="mem_id"
						name="mem_id" required size="10" placeholder="아이디"
						pattern="^[A-Za-z0-9]{2,10}$"> <input type="button"
						value="ID중복확인" id="idcheck" class="btn_blk"><label
						id="idCheckRes">(영문/숫자 2~10자)</label></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password"
						style="height: 30px; text-align: center;" name="mem_password"
						size="10"> 3~10자</td>
				</tr>

				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password"
						style="height: 30px; text-align: center;" name="pwd_check"
						size="10" onkeyup="checkPwd()"> <label id="checkPwd">동일한
							비밀번호를 입력하세요.</label></td>
				</tr>

				<tr>
					<th>성별</th>
					<td>남<input type="radio" name="mem_gender" value="남자" required>
						여<input type="radio" name="mem_gender" value="여자" required>
					</td>

				</tr>

				<tr>
					</td>
					<th>생년 월일</th>
					<td><input type="text" id="mem_birth" name="mem_birth"
						required placeholder="ex)010101"
						style="height: 30px; text-align: center;" size="7" maxlength="6"
						pattern="^[0-9]{6}$"></td>

				</tr>

				<tr>
					<th>주소</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" name="mem_postal"
						class="box" id="mem_postal" placeholder="우편번호" required size="5"
						readonly> <input type="button" class="btn_blk"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> </br> <input
						type="text" style="height: 30px; text-align: center;"
						name="mem_address" class="box" id="mem_address" placeholder="주소"
						size="30" required readonly> <input type="text"
						style="height: 30px; text-align: center;"
						name="mem_detail_address" class="box" id="mem_detail_address"
						placeholder="상세주소" size="30" required></td>

				</tr>

				<tr>
					<th>핸드폰 번호</th>
					<td><input type="tel" id="mem_hp"
						style="height: 30px; text-align: center;" name="mem_hp" required
						placeholder=" '-' 없이 쓰세요" size="15" maxlength="11"></td>
				</tr>

				<tr>
					<th>이메일</th>
					<td><input type="text" id="mem_email"
						style="height: 30px; text-align: center;" name="mem_email"
						size="30" required placeholder="abc@naver.com"></td>
				</tr>

			</table>

			<div class="btnJoinArea">
				<button type="submit" class="btn_blk">회원가입</button>
				<button type="button" class="btn_blk" onclick="history.back();">취소</button>
			</div>
		</fieldset>
	</form>
</body>
</html>