<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
<script type="text/javascript">
	function button_event() {
		if (confirm("탈퇴하시겠습니까?")) {
			alert("탈퇴되셨습니다.");//확인
			document.form.submit();
			return true;
		} else { //취소
			alert("탈퇴가 취소 되셨습니다.");
			alert("감사합니다 ^^");
			return false;
		}
	}
</script>
</head>
<body>

</body>
</html>