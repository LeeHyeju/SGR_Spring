<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세보기</title>
	<script type="text/javascript">
		$(function(){
			// 회원 강제 탈퇴, 회원 목록 버튼 처리
			$("#updateBtn").on("click",function(){
				$("#viewForm").attr("action","/admin/update.ad");
				$("#viewForm").submit();
			});
			
			$("#deleteBtn").on("click",function(){
// 				location="delete.do?no="+no; // get 방식으로 이동
				// form tag의 submit을 이용해서 넘긴다. 넘어갈 uri를 action 속성으로 셋팅한다.
				$("#viewForm").attr("action","/admin/memberDrop.ad");
				$("#viewForm").submit();
			});
			$("#listBtn").on("click",function(){
				$("#viewForm").attr("method", "get");
				$("#viewForm").attr("action","/admin/listPage.ad");
				$("#viewForm").submit();
			});
		});
	</script>
</head>
<body>
	<h1>회원 정보 보기</h1>
	<fieldset>
		<legend></legend>
		<form id = "viewForm" >
			<!-- 히든으로 넘긴다 -->
			<input name="mb_id" type="hidden" value="${member.mb_id }" />
			<input name ="mb_grade" type="hidden" value="${member.mb_grade }">
			<input type="hidden" name="page" value=${cri.page }>
			<input type="hidden" name="perPageNum" value=${cri.perPageNum }>
			<input type="hidden" name="searchType" value=${cri.searchType }>
			<input type="hidden" name="keyword" value=${cri.keyword }>
			
		</form>
		<table class="table table-bordered"> 
			<tr>
				<th class="col-md-3">아이디</th>
				<td class="col-md-9">${member.mb_id}</td>
			</tr>
			<tr>
				<th class="col-md-3">이름</th>
				<td class="col-md-9">${member.mb_name }</td>
			</tr>
			<tr>
				<th class="col-md-3">성별</th>
				<td class="col-md-9">${member.mb_sex}</td>
			</tr>
			<tr>
				<th class="col-md-3">생년월일</th>
				<td class="col-md-9">${member.mb_bday}</td>
			</tr>
			<tr>
				<th class="col-md-3">핸드폰 번호</th>
				<td class="col-md-9">0${member.mb_phone }</td>
			</tr>
			<tr>
				<th class="col-md-3">이메일</th>
				<td class="col-md-9">${member.mb_email}</td>
			</tr>
			<tr>
				<th class="col-md-3">우편번호</th>
				<td class="col-md-9">${member.mb_zipcode}</td>
			</tr>
			<tr>
				<th class="col-md-3">주소</th>
				<td class="col-md-9">${member.mb_address}
					${member.mb_addressDetail}</td>
			</tr>
			<tr>
				<th class="col-md-3">회원등급</th>
				<c:choose>
					<c:when test="${member.mb_grade == 6}">
						<td class="col-md-9">일반회원</td>
					</c:when>
					<c:when test="${member.mb_grade == 0 }">
						<td class="col-md-9">관리자</td>
					</c:when>
					<c:otherwise>
						<td class="col-md-9">탈퇴회원</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th class="col-md-3">가입일자</th>
				<td class="col-md-9"><fmt:formatDate
						value="${member.mb_joinDate}" pattern="yyyy-MM-dd" /></td>
			</tr>

			<c:choose>
				<c:when test="${member.mb_grade == 9 }">
					<tr>
						<th class="col-md-3">탈퇴일자</th>
						<td class="col-md-9"><fmt:formatDate
								value="${member.mb_leaveDate}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<tr>
			<td><button id="updateBtn" class="btn_blk">수정</button></td>
			<td><button id="deleteBtn" class="btn_blk">삭제</button></td>
			<td>	<button id="listBtn" class="btn_blk">목록</button></td>
			</tr>
		</table>
	</fieldset>
</body>
</html>