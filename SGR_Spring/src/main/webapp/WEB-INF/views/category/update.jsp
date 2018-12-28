<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='update.ad']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.submit();
		});
		$(".btn-primary").on("click", function() {
			self.location ="/category/cateList.ad";
			formObj.submit();
		});
	});
</script>

</head>
<body>
	<h2>카테고리 수정</h2>
	<br>
	<form role ="./update.ad"  id="updateForm" method="post">
<table>
<tr>
<td><label for="cate_cd">대분류코드</label>
<input type="text" id="cate_cd" style="height: 30px; text-align: center;" value="${list.cate_cd}" ></td>
<td><label for="cate_nm">대분류명</label>
<input type="text"  id="cate_nm" style="height: 30px; text-align: center;" value="${list.cate_nm}" ></td>
<td><label for="catesub_cd">소분류코드</label>
<input type="text" id="catesub_cd" style="height: 30px; text-align: center; background-color: #e2e2e2;" value="${list.catesub_cd}"  readonly="readonly" ></td>
<td><label for="catesub_nm">소분류명</label>
<input  type="text" id="catesub_nm" style="height: 30px; text-align: center;" value="${list.catesub_nm}" ></td>
</tr>
</table>
<br><br>
<button class="btn btn-warning"  type="submit">수정</button>
<button class="btn btn-primary" onclick="history.back();">목록보기</button>
</form>
</body>
</html>