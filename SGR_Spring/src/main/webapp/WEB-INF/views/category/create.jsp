<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function popupOpen() {

		var popUrl = "../category/cateList.ad"; //팝업창에 출력될 페이지 URL
		var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
	}
</script>
</head>
<body>
	<h2>카테고리 등록</h2>
	<br>
	<form action="./create.ad" id="createForm" method="post">
		<fieldset>
			<legend></legend>

			<a href="javascript:popupOpen();">[ 카테고리 보기 ]</a>
			<table width="940" style="padding: 5px 0 5px 0;">
				<tr>
					<th>대분류코드</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="cate_cd"
						name="cate_cd" size="7" required placeholder="대분류코드"> <label
						for="cate_cd"></label> (ex) A01, B01 ...</td>
				</tr>
				<tr>
					<th>대분류명</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="cate_nm"
						name="cate_nm" size="7" required placeholder="대분류명"> <label
						for="cate_nm"></label></td>
				</tr>
				<tr>
					<th>소분류코드</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="catsub_cd"
						name="catesub_cd" size="7" required placeholder="소분류코드">
						<label id="catesub_cd"></label>(ex) A011, B011 ...중복값 입력x</td>
				</tr>
				<tr>
					<th>소분류명</th>
					<td><input type="text"
						style="height: 30px; text-align: center;" id="catesub_nm"
						name="catesub_nm" size="7" required placeholder="소분류명"> <label
						for="catesub_nm"></label></td>
				</tr>
			</table>
		</fieldset>
		<button type="submit">등록</button>
		<button type="reset" onclick="location='../category/cateList.ad'">취소</button>
		<button onclick="location='../category/cateList.ad'">목록</button>
	</form>
	<br>
	<br>


</body>
</html>