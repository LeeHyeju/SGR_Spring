<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	$(".pagination li a").on("click", function(event) {
		event.preventDefault();
		var targetPage = $(this).attr("href");
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/admin/listPage").attr("method", "get");
		jobForm.submit();
	});
</script>
<script>
	$(document).ready(
	function() {
	$('#searchBtn').on("click",	function(event) {
		str = "list"
		+ '${pageMaker.makeQuery(1)}'
		+ "&searchType="
		+ $("select option:selected").val()
		+ "&keyword=" 	+ encodeURIComponent($('#keywordInput').val());
		console.log(str);
    	self.location = str;
	    });
	});
</script>
<style type="text/css">
select {
	width: 100px; /* 원하는 너비설정 */
	padding: .1em .1em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	/*     background: url('이미지 경로') no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
	*/
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
</style>
</head>
<body>
	<br>
	<form id="jobForm">
		<input type="hidden" name="page" value=${pageMaker.cri.page }>
		<input type="hidden" name="perPageNum" 	value=${pageMaker.cri.perPageNum }>
		<div class="box-body" align="right">
			<select name="searchType">
				<option value="x"
					${cri.searchType == null or cri.searchType == "x"?"selected='selected'":"" }>&nbsp;&nbsp;▼
					Check ▼</option>
				<option value="i" ${cri.searchType == "i"?"selected='selected'":"" }>아이디</option>
				<option value="n" ${cri.searchType == "n"?"selected='selected'":"" }>이름</option>
				<option value="s" ${cri.searchType == "s"?"selected='selected'":"" }>성별</option>
				<option value="g" ${cri.searchType == "g"?"selected='selected'":"" }>등급</option>
				<option value="in"
					${cri.searchType == "in"?"selected='selected'":"" }>아이디+이름</option>
				<option value="sing"
					${cri.searchType == "sing"?"selected='selected'":"" }>전체</option>
			</select> <input name="keyword" value="${cri.keyword }" />
			<button id="searchBtn" class="btn btn-info">SEARCH</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</form>
	<h1>:: SGR 회원리스트::</h1>
	<fieldset>
		<legend></legend>
		<div class="box-body">
			<table class="table table-bordered">
				<tr>
<!-- 					<th style="width: 10px">No.</th> -->
					<th>회원 ID</th>
					<th>회원 이름</th>
					<th>등급</th>
					<th>가입일자</th>
					<th>탈퇴일자</th>
				</tr>
				<c:forEach items="${list }" var="member">
					<tr>
						<td><a
							href='/admin/listDetail.ad${pageMaker.makeSearch (pageMaker.cri.page)}&mb_id=${member.mb_id }'>${member.mb_id }</a></td>
						<td>${member.mb_name }</td>
						<c:choose>
							<c:when test="${member.mb_grade == 6 }">
								<td>일반회원</td>
							</c:when>
							<c:when test="${member.mb_grade == 1 }">
								<td>관리자</td>
							</c:when>
							<c:otherwise>
								<td style="color: red;">탈퇴회원</td>
							</c:otherwise>
						</c:choose>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${member.mb_joinDate }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${member.mb_leaveDate }" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</fieldset>
	<div class="box-footer">
		<div class="text-center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="listPage.ad${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="listPage.ad${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="listPage.ad${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
	</div>
</body>
</html>