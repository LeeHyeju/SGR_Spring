<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var result = "${msg}";
	if (result == "createOK") {
		alert("상품 등록이 완료되었습니다.");
	} else if (result == "deleteOk") {
		alert("탈퇴되셨습니다..");
	}
</script>
</head>
<body>
	<h2>카테고리 보기</h2>
<fieldset>
<legend></legend>
<table>

<tr>
<td><input  style="background-color:transparent;border:0 solid black;text-align:center;" value="카테고리명"></td>
<td><input  style="background-color:transparent;border:0 solid black;text-align:center;" value="대분류"></td>
<td><input  style="background-color:transparent;border:0 solid black;text-align:center;" value="소분류"></td>
</tr>

<c:forEach items="${read }" var="ca">
<tr>
<td>
<input  id="cate_name" style="height: 30px; text-align: center;" value="${ca.category_name}" readonly="readonly"></td>
<td><input id="cate_name" style="height: 30px; text-align: center;" value="${ca.category_no}"  readonly="readonly"></td>
<td><input id="cate_name" style="height: 30px; text-align: center;"value="${ca.categorySub_no}"  readonly="readonly"></td>
</tr>
</c:forEach>
</table>
</fieldset>
	<br>
	<br>
	<ul>
		<li>
		<button onclick="location='../category/create.ad'">카테고리 등록</button>
		<button onclick="location='../../category/update.ad'">카테고리 수정</button>
		<button onclick="location='../category/delete.ad'">카테고리 삭제</button>
		</li>
	</ul>
</body>
</html>