<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</script>
<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							str = "adminList"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());

							console.log(str);

							self.location = str;

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "/qna/adminWrite.ad";

				});

			});
</script>
</head>
<body>
	<h2>관리자: 고객 문의 내역</h2>
	<hr>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->

			<div class="col-md-12">
				<!-- general form elements -->
				<div class='box'>
					<div class="box-header with-border">
						<h3 class="box-title">Q&A List</h3>
					</div>

					<div class='box-body'>

						<select name="searchType">
							<option value="x"
								<c:out value="${cri.searchType == null?'selected':''}"/>>
								---</option>
							<option value="i"
								<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>
								Writer</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
								Title</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
								Content</option>
							<option value="itc"
								<c:out value="${cri.searchType eq 'itc'?'selected':''}"/>>
								Writer OR Title OR Content</option>
						</select> <input type="text" name='keyword' id="keywordInput"
							value='${cri.keyword }'>
						<button id='searchBtn'>Search</button>
						<button id='newBtn'>New Q&A</button>

					</div>
				</div>
				
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">공지사항</h3>
					</div>
	<div>
		<label>※</label>
		<input>
	</div>

				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Q&A 내역</h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th style="width: 10px">NO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>DATE</th>
								<th style="width: 40px">HIT</th>
							</tr>

							<c:forEach items="${adminList}" var="adminList">

								<tr>
									<td>${adminList.qna_no}</td>
									<td><a
										href='/qna/view${pageMaker.makeSearch(pageMaker.cri.page) }&qna_no=${adminList.qna_no}'>
											${adminList.qna_title} </a></td>
									<td>${adminList.mb_id}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${adminList.reg_date}" /></td>
									<td><span class="badge bg-red">${adminList.qna_hit }</span></td>
								</tr>

							</c:forEach>

						</table>
					</div>
					<!-- /.box-body -->


					<div class="box-footer">

						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="adminList${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="adminList${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="adminList${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div>

					</div>
					<!-- /.box-footer-->
				</div>
			</div>
			<!--/.col (left) -->

		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</body>
</html>