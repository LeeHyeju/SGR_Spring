<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function qnaInsert() {
		if ($('#insertDiv_go').css("display") != "none") {
			//			//화면이 논값이 아닐시에
			$('#insertDiv_go').hide();
			//			//가린다
		} else {

			$('#insertDiv_go').show();
			//보인다
		}
	}

	function goodsCheck() {

		str = $("#goodsgo").val();
		if (str != "상품선택") {

			$("#goods_no").val(str);

		}
	}
</script>
</head>
<body>
	<h2>MY Q&A</h2>
<hr>
	<c:choose>
		<c:when test="${fn:length(list) > 0}">

			<c:forEach items="${list}" var="list">
				<tr>
					<td>
						<h1>
							문의 번호 = ${list.qna_no}, </br> 상품 번호 = ${list.goods_no}, 문의날짜 =
							${list.reg_date},
						</h1>
					</td>
					<td>
						<h1>제목 = ${list.qna_title}</h1>
					</td>
					<td><h1>내용 = ${list.qna_content}</h1></td>
					</br>
					<%-- 	                    <td>${rowgo.inq_img}</td>                  --%>
					<c:if test="${list.parent == null}">
						<td><input type="button" name="bt_insertgo" id="bt_insertgo"
							onclick="gogo('${status.index}');" value="문의 답변"></td>
					</c:if>
					<c:if test="${list.parent != null}">
					답변내역    =  <td>${list.parent}</td>
					</c:if></c:forEach>
		</c:when>

		<c:otherwise>
			<tr>
				<td colspan="4">나의 문의 내역이 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>

	<input type="button" name="bt_insertgo" id="bt_insertgo"
		onclick="qnaInsert();" value="문의 등록">
	<form action="<%=request.getContextPath()%>/qna/write.do" method="POST" id="gogosing">
		<div style="display: none;" id="insertDiv_go">

			<select name="goodsgo" id="goodsgo" onchange="goodsCheck()">
				<option>상품선택</option>
				<c:forEach items="${list}" var="list">
					<option value="${list.goods_no}">${list.goods_name}</option>
				</c:forEach>
			</select>
			-------------------------------------------------------------------------------------
			<br>


			<div>
				<!-- 						<label class="sr-only" for="exampleInputEmail3"></label>  -->
				<!-- 						<input 	type="text" class="form-control" name="go_title" id="go_title" -->
				<%-- 							value="${goods_no}" readonly="readonly" placeholder="상품이름">${list.goods_name}<br> --%>

				<!-- 						<input type="hidden" class="form-control" name="goods_no" -->
				<%-- 							id="goods_no" value="${goods_no }" readonly="readonly" 	placeholder=""> <br>  --%>
				<input type="text" class="form-control" name="mb_id" id="mb_id"
					value="${login.mb_id}" readonly="readonly" placeholder="회원아이디">
				<br> <label class="sr-only" for="exampleInputEmail3">회원아이디</label>
			</div>


			<textarea class="form-control" rows="3" placeholder="제목을 입력해주세요"
				value="" input type="text" class="form-control" name="inq_title"
				id=""></textarea>
			<textarea class="form-control" rows="3" placeholder="문의 내용을 등록해주세요"
				value="" input type="text" class="form-control" name="inq_content"
				id=""></textarea>


			<%-- 												<option value="${result.st_num}"><c:out value="${result.st_name}" /></option> --%>


			<!-- 			<input type="hidden" name="inq_content" id="inq_content" -->
			<%-- 				value="${list.qna_content}"> <input type="hidden" --%>
			<%-- 				name="inq_parent" id="inq_parent" value="${list.parent}"> --%>
			<%-- 			<input type="hidden" name="inq_no" id="inq_no" value="${list.goods_no}"> --%>
			<input type="submit" name="bt_insertgo" id="bt_insertgo" value="제 출">


		</div>
	</form>

</body>
</html>