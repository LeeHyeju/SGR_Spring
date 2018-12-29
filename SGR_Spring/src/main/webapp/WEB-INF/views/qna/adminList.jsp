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
	function gogo(index) {
		if ($('#insertDiv_go' + index).css("display") != "none") {
			//			//화면이 논값이 아닐시에
			$('#insertDiv_go' + index).hide();
			//			//가린다
		} else {
			$('#insertDiv_go' + index).show();
			//보인다
		}
	}
</script>
</head>
<body>
	<h2>관리자: 고객 문의 내역</h2>
	<hr>
	<c:choose>
		<c:when test="${fn:length(adminList) > 0}">
			<c:forEach items="${adminList}" var="adminList" varStatus="status">
				<tr>
					<td>
						<p style="font-size: large;">문의 번호 = ${adminList.qna_no}</p>
					</td>
					<td>
						<p style="font-size: large;">고객 ID = ${adminList.mb_id}님</p>
					</td>
					<td>
					<p style="font-size: large;">
							문의날짜 =<fmt:formatDate value="${adminList.reg_date}" pattern="yyyy-MM-dd" />
						</p></td>
					<td>
						<h1>제목 = ${adminList.qna_title}</h1>
					</td>
					<td><h1>내용 = ${adminList.qna_content}</h1></td>
					</br>
<%-- 					<td>${adminList.inq_img}</td> --%>
					<c:if test="${adminList.inq_parent == null}">
						<td><input type="button" name="bt_insertgo" id="bt_insertgo"
							onclick="gogo('${status.index}');" value="문의 답변"></td>
					</c:if>
					<c:if test="${adminList.parent != null}">
                       	       답변내역    =  <td>${adminList.parent}</td>
					</c:if>
					-------------------------------------------------------------------------------------
				</tr>
				<form 	action="<%=request.getContextPath()%>/qna/adminList.ad" method="POST" id="">
					<div style="display: none;" id="insertDiv_go${status.index}">
			
								<label class="sr-only" for="exampleInputEmail3"></label>
								<input type="text" class="form-control" name="mb_id"
									id="mb_id" value="${adminList.qna_no}" readonly="readonly"
									placeholder="등록번호">
								<br>
								<input type="text" class="form-control" name="mb_id"
									id="mb_id" value="${login.mb_id}" readonly="readonly"
									placeholder="회원아이디">
								<br>
								<label class="sr-only" for="exampleInputEmail3"></label>
						
								<textarea class="form-control" rows="3"
									placeholder="사용자의 문의에 답변해주세요" value="" >
									</textarea>
									<input type="text"
									class="form-control" name="inq_parent" id="inq_parent">
											
						<input type="hidden" name="inq_no" id="inq_no"  value="${adminList.qna_no}"> 
							<input type="hidden" 	name="inq_no" id="inq_no" value="${adminList.parent}"> 
							<input 	type="submit" name="bt_insertgo" id="bt_insertgo" value="제 출">
						<!-- 														<input type="hidden" name="st_hit" value="0"> -->
					</div>
				</form>
			</c:forEach>
		</c:when>

		<c:otherwise>
			<tr>
				<td colspan="4">문의 내역이 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>

</body>
</html>