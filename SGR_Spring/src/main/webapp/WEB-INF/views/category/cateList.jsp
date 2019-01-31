<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리 리스트 </title>
<script type="text/javascript">
	var result = "${msg}";
	if (result == "createOK") {
		alert("카테고리 등록이 완료되었습니다.");
	}
</script>
</head>
<body>
	<h2 style="text-align: center;">카테고리 리스트</h2>
<fieldset>
<legend></legend>
<form>
<center><button  onclick="location='../category/create.ad'">카테고리 등록</button></center>
<br>
<table class="table table-bordered"  style=" width: 80%;  margin: auto; text-align:center; " >
<tr>
<td><input  style="background-color:transparent;border:0 solid black;text-align:center;" value="대분류코드" readonly="readonly"></td>
<td><input  style="background-color:transparent;border:0 solid black;text-align:center;" value="대분류명" readonly="readonly"></td>
<td><input  style="background-color:transparent;border:0 solid black;text-align:center;" value="소분류코드" readonly="readonly"></td>
<td><input  style="background-color:transparent;border:0 solid black;text-align:center;" value="소분류명" readonly="readonly"></td>
</tr>

<c:forEach items="${list }" var="category">
<tr>
<td><input  id="cate_name" style="height: 30px; text-align: center;" value="${category.cate_cd}" readonly="readonly"></td>
<td><input  id="cate_name" style="height: 30px; text-align: center;" value="${category.cate_nm}" readonly="readonly"></td>
<td><input id="cate_name" style="height: 30px; text-align: center;" value="${category.catesub_cd}"  readonly="readonly"></td>
<td><a href='/category/read.ad?catesub_cd=${category.catesub_cd }'><input id="cate_name" style="height: 30px; text-align: center;"value="${category.catesub_nm}"  readonly="readonly"></a></td>
</tr>
</c:forEach>
</table>
</form>
<br><br>
</fieldset>

</body>
</html>