<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Main content -->
<h1 style="text-align: center; color: silver;">고객 문의</h1>
	<fieldset>
		<legend></legend>

<form action="./update.do" method="post" class="form-horizontal" >
	<!-- 히든으로 보낼 값 -->
	<input type='hidden' name='qna_no' value="${list.qna_no}"> <input
		type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">
			
					<div class="form-group">
						<label class="col-md-4 control-label" for="qna_title">글 제목</label> 
						<div class="col-md-4">
						<input type="text" 	id="qna_title" name="qna_title"  class="form-control input-md"  value="${list.qna_title}">
					</div>
					</div>
				
					<div class="form-group">
						<label class="col-md-4 control-label" for="qna_content">글 내용</label>
						<div class="col-md-4"> 
						<textarea class="form-control" id="qna_content" name="qna_content" rows="9" style=" resize: none;">${list.qna_content}</textarea>
					</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-4 control-label" for="mb_id">작성자</label> 
						<div class="col-md-4">
						<input type="text" 	name="mb_id" id="mb_id"
						class="form-control input-md"  value="${list.mb_id}"	readonly="readonly">
					</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="regdate">작성일</label> 
						<div class="col-md-4">
						<input type="text" 	id="regdate" name="regdate" class="form-control input-md" 
						value="<fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}" /> "readonly="readonly">
							</div>
					</div>
						
				
				<br> <br>
				<div class="form-group" >
				<label class="col-md-4 control-label" for=""></label>
			<div class="btnJoinArea" >
				
				<div class="box-footer">
				<center>	<button type="submit" class="btn btn-info">수정</button>
					<button type="reset" class="btn btn-danger" onclick="history.back()">취소</button>
					<button type="submit" class="btn btn-success">목록</button> </center>
				</div>
			</div>
			</div>
			
</form>
	</fieldset>
</body>
</html>