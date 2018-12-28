<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원리스트</title>
<script type="text/javascript">
		var result = "${msg}";
		var deleter = "${delete}"
		var id = deleter.mb_id;
		if(result=="SUCCESS"){
			alert(deleter);
		}
	</script>
</head>
<body>
	<h1>:: SGR 회원리스트::</h1>
	<fieldset>
		<legend></legend>
		<table class="table table-bordered"> 
			<tr>
				<th style="width: 10px">No.</th>
				<th>회원 ID</th>
				<th>회원 이름</th>
				<th>등급</th>
				<th>가입일자</th>
				<th>탈퇴일자</th>
			</tr>

			<c:forEach var="member" items="${list }" >
			 <tr>
<%-- 				<td>${member.mb_no }</td> --%>
		<td><a href="listDetail.ad?mb_id=${member.mb_id}">${member.mb_id }</a></td>
		<td>${member.mb_name }</td>
		<c:choose>
			<c:when test="${member.mb_grade == 6 }">
			<td>일반회원</td>
			</c:when>
			<c:when test="${member.mb_grade == 0 }">
			<td>관리자</td>
			</c:when>
			<c:otherwise>
			<td>탈퇴회원</td>
			</c:otherwise>
		</c:choose>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.mb_joinDate }" /></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.mb_leaveDate }" /></td>
		</tr>
		</c:forEach>
		</table>
	</fieldset>
</body>
</html>