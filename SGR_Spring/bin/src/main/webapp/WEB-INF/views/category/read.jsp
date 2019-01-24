<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='readForm']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "../category/update.ad");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".btn-danger").on("click", function() {
			formObj.attr("action", "../category/delete.ad");
			formObj.submit();
		});
	});
</script>
</head>
<body>
	<h2>카테고리 보기</h2>
	<form role="readForm" method="post">
		<fieldset>
			<legend></legend>
			<table>
				<tr>
					<td><label>대분류코드</label>
					 <input id="cate_cd"  style="height: 30px; text-align: center; background-color: #e2e2e2;"value="${list.cate_cd}" readonly="readonly"></td>
						
					<td><label>대분류명</label> 
					<input id="cate_nm" 	style="height: 30px; text-align: center; background-color: #e2e2e2;"value="${list.cate_nm}" readonly="readonly"></td>
						
					<td><label>소분류코드</label> 
					<input id="catesub_cd" name="catesub_cd" style="height: 30px; text-align: center; background-color: #e2e2e2;"value="${list.catesub_cd}" readonly="readonly"></td>
						
					<td><label>소분류명</label> 
					<input id="catesub_nm"style="height: 30px; text-align: center; background-color: #e2e2e2;"	value="${list.catesub_nm}" readonly="readonly"></td>
				</tr>
			</table>
		</fieldset>
		<br> <br>
		<ul>
			<li>
				<button class="btn btn-primary" onclick="history.back();">목록보기</button>
				<button type="submit" class="btn btn-warning">수정</button>
				<button type="submit" class="btn btn-danger">카테고리 삭제</button>
			</li>
		</ul>
	</form>
</body>
</html>