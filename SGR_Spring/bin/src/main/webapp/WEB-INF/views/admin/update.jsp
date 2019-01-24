<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center; color: silver;">회원 등급 변경</h1>
<form action="./update.do" id="searchId" method="post" class="form-horizontal" >
		<fieldset>
			<legend> </legend>
			<div class="form-group">
			<label class="col-md-4 control-label" for="id_mb_name">회원등급</label>
			<div class="col-md-3">
			
			<select>
			<option value="${member.mb_grade == 6 }">일반회원</option>
			<option value="${member.mb_grade == 9 }">탈퇴회원</option>
			</select>
			
				<input type="text" id="id_mb_name" name="mb_name" class="form-control input-md"  value="${member.mb_grade }">
			</div>
		</div>

</fieldset>		
	</form>
</body>
</html>