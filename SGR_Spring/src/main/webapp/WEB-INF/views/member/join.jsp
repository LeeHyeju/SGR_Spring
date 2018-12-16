<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
#checkMsg {
	font-size: 15px;
}

#checkPwd {
	color: red;
	font-size: 15px;
}

body {
	margin-top: 20px;
	margin-left: 30px;
	font-family: 맑은 고딕, 돋움, 굴림;
	color: #888888;
}

table {
	border-collapse: collapse;
	font-size: 15pt;
	margin-left: 0;
}

td {
	font-size: 20px;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=mb_zipcode]").val(data.zonecode);
				$("[name=mb_address]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
</script>
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
	// --> 
	$(function() {
		// 비밀번호확인 체크 이벤트 처리
		$("#joinForm").on("submit", function() {
			var pass = document.getElementById('mb_pw').value;
			var passCheck = document.getElementById('pwd_check').value;
			if (pass == passCheck) {
				alert('성공하였습니다.');
			} else {
				alert('비밀번호 확인 실패');
				return false;
			}
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$("#idcheck").on("click", function() {
			//		alert("click");
			idcheck();
		});
	});
	//ajax 아이디 중복체크
	function idcheck() {
		//		alert("idcheck()");
		$.ajax({
			url : "../member/idcheck.do",
			type : "post",
			data : {
				id : $("#mb_id").val()
			},
			dataType : "text",
			success : function(data) {
				//     alert(data);
				var str = "";
				if (data == "OK")
					$("#idCheckRes").html(
							"<span style='color:blue'>사용 가능한 아이디입니다.</span>");
				else
					$("#idCheckRes").html(
							"<span style='color:red'>사용중인 아이디입니다.</span>");
			}
		});
	} // 아이디 중복 체크 끝
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="./join.do" id="joinForm" method="post">
		<fieldset>
			<legend></legend>
			<table width="940" style="padding: 5px 0 5px 0;">
				<tr>
					<th>이름</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="mb_name"
						name="mb_name" size="7" required placeholder="이름"
						pattern="^[가-힣]{2,6}$"></td>
				</tr>

				<tr>
					<th>아이디</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="mb_id" name="mb_id"
						required size="10" placeholder="아이디" pattern="^[A-Za-z0-9]{2,10}$">
						<input type="button" value="ID중복확인" id="idcheck" class="btn_blk"><label
						id="idCheckRes">(영문/숫자 2~10자)</label></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password"
						style="height: 30px; text-align: center;" name="mb_pw" size="10"
						required>3~10자</td>
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
					<!-- 					<td>남<input type="radio" name="mb_sex" value="남자" required> -->
					<!-- 						여<input type="radio" name="mb_sex" value="여자" required> -->
					<!-- 					</td> -->
					<td><select name="mb_sex">
							<option value="1">남자</option>
							<option value="2">여자</option>
					</select></td>

				</tr>

				<tr>
					</td>
					<th>생년 월일</th>
					<td><input type="text" id="mb_bday" name="mb_bday" required
						placeholder="ex)010101" style="height: 30px; text-align: center;"
						size="7" maxlength="6" pattern="^[0-9]{6}$"></td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" name="mb_zipcode"
						class="box" id="mb_zipcode" placeholder="우편번호" required size="5"
						readonly> <input type="button" class="btn_blk"
						onclick="execPostCode()" value="우편번호 찾기"> </br> <input
						type="text" style="height: 30px; text-align: center;"
						name="mb_address" class="box" id="mb_address" placeholder="주소"
						size="30" required readonly> <input type="text"
						style="height: 30px; text-align: center;" name="mb_addressDetail"
						class="box" id="mb_addressDetail" placeholder="상세주소" size="30"
						required></td>
				</tr>

				<tr>
					<th>핸드폰 번호</th>
					<td><input type="tel" id="mb_phone"
						style="height: 30px; text-align: center;" name="mb_phone" required
						placeholder=" '-' 없이 쓰세요" size="15" maxlength="11"></td>
				</tr>

				<tr>
					<th>이메일</th>
					<td><input type="text" id="mb_email"
						style="height: 30px; text-align: center;" name="mb_email"
						size="30" required placeholder="abc213@naver.com"></td>
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