<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- ajax를 이용해서 카테고리 가져오기 -->
<h2>카테고리 등록</h2>
<br>
		<LABEL>카테고리명</LABEL> 
		<select id="category_name" name="category_name">
			<c:forEach var="category" items="${read}" varStatus="status">
				<OPTION value="${CATEGORY.CATEGORY_NO }">${CATEGORY.CATEGORY_NO }</OPTION>
			</c:forEach>
		</select> 
	
		<LABEL>대분류</LABEL> 
		<select id="category_no" name="category_no">
			<c:forEach var="category" items="${read}" varStatus="status">
				<OPTION value="${CATEGORY.CATEGORY_NO }">${CATEGORY.CATEGORY_NO }</OPTION>
			</c:forEach>
		</select> 
		<LABEL>소분류</LABEL> 
		<select id="categorySub_no" name="categorySub_no">
			<c:forEach var="category" items="${read}" varStatus="status">
				<OPTION>${CATEGORY.CATEGORY_NO }</OPTION>
			</c:forEach>
		</select> 
<table>
<c:forEach items="${read }" var="ca">
<tr>
<td>${ca.category_no}</td>
<td>${ca.categorySub_no}</td>
<td>${ca.category_name}</td>
</tr>
</c:forEach>
</table>
</body>
</html>