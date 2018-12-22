<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>카테고리 등록</h2>
	<br>

	<form action="./create.ad" id="createForm" method="post">
		<fieldset>
			<legend></legend>
			<table width="940" style="padding: 5px 0 5px 0;">		
				<tr>
					<th>카테고리명</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="category_name"
						name="category_name" size="7" required placeholder="카테고리명">
						<label id="checkPwd"></label></td>
				</tr>
				<tr>
					<th>대분류</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="category_no"
						name="category_no" size="7" required placeholder="대분류명"> <label
						for="category_no"></label>1: TOP, 2:OUTER, 3:BOTTOM,4:ACC,5:SHOES</td>
				</tr>
				<tr>
					<th>카테고리명</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="categorySub_no"
						name="categorySub_no" size="7" required placeholder="소분류명">
						<label id="categorySub_no"></label>00은 대분류명입니다.01부터 입력해주세요 </td>
				</tr>
			</table>
		</fieldset>

		<br>
		<br>
		<button type="submit">등록</button>
		<button type="reset" onclick="history.back()">취소</button>
		<button onclick="location='../category/read.ad'">목록</button>
	</form>
</body>
</html>