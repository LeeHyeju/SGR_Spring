<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script>
	$(document).ready(
			function() {
				$('#searchBtn').on("click",function(event) {
							str = "reviewList"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
							console.log(str);
							self.location = str;
						});
				$('#newBtn').on("click", function(event) {
					self.location = "../review/write.do";
				});
		});
</script>
</head>
<body>
<h2 style="text-align: center;">SGR 리뷰 게시판</h2>
	<hr>
	<form>
			<div class='box-body' style="width: 80%; margin: auto; text-align: right; ">
						<select name="searchType" >
							<option value="x"
								<c:out value="${cri.searchType == null?'selected':''}"/>>
								&nbsp;&nbsp;▼Check ▼</option>
							<option value="i"
								<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>
								작성자</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
								제목</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
								내용</option>
							<option value="itc"
								<c:out value="${cri.searchType eq 'itc'?'selected':''}"/>>
								전체</option>
						</select> 
						<input type="text" name='keyword' id="keywordInput"
							value='${cri.keyword }'>
						<button id='searchBtn'>Search</button>
						
<!-- 						<button type="button"  id='newBtn'>리뷰 작성</button> -->
					</div>
					<br><br>		
					
					
					<div class="box">
<!-- 						<div class="box-header with-border" > -->
<!-- 							<h3 class="box-title" align="center" style="text-align: center; color: gray; ;">Q&A 내역</h3> -->
<!-- 						</div> -->
						<div class="box-body">
							<table class="table table-bordered" style="width: 80%; margin: auto; text-align:center; "  >
								<tr>
									<th style=" text-align:center;">글번호</th>
									<th style=" text-align:center;">상 품</th>
									<th style="text-align: center;">제 목</th>
									<th style="text-align: center;">작성자</th>
									<th style=" text-align:center;">조회수</th>
									<th style="text-align: center;">작성일자</th>
								</tr>

								<c:forEach items="${review}" var="review">
									<tr>
										<td><br><br>${review.review_no}</td>
<%-- 										<td>${goods.goods_img }</td> --%>
										<td width="300px;" align="center"><img src="<spring:url value='/image${review.goods_img }'/>" 	class="img-responsive" style="width: 50%" ></td>
										<td><br><br>++${review.goods_name} ++<br><br><a href='/review/view.do${pageMaker.makeSearch(pageMaker.cri.page) }&review_no=${review.review_no}'>
												 ${review.review_title} </a></td>
										<td><br><br>${review.mb_id}</td>
										<td><br><br><span class="badge badge-danger" style="background-color: orange;">${review.review_hit }</span></td>
										<td><br><br><fmt:formatDate pattern="yyyy-MM-dd" 	value="${review.reg_date}" /></td>
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
											href="reviewList.do${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a href="reviewList.do${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="reviewList.do${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
									</c:if>

								</ul>
							</div>

						</div>
						<!-- /.box-footer-->
					</div>
									
	</form>
</body>
</html>