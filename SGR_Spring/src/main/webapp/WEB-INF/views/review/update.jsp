<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center; color: silver;">리뷰 수정</h1>
	<form action="/review/update.do" method="post" class="form-horizontal" >
	<fieldset>
		<legend></legend>
		<input type="hidden" value="${goods.goods_name }" name="goods_name" />
		<input type="hidden" value="${goods.goods_price }" name="goods_price" />
		<input type="hidden" value="${goods.goods_maker }" name="goods_maker" />
		<input type="hidden" value="${goods.goods_origin }" name="goods_orgin" />
		<input type="hidden" value="${goods.catesub_cd }" name="catesub_cd" />
		<input type="hidden" value="${review.review_no}" name="review_no" />
		
				<div class="form-group">
						<label class="col-md-4 control-label" for="review_title">글 제목</label> 
							<div class="col-md-4">
								<input type="text" 	name="review_title"  class="form-control input-md"  value="${review.review_title}" >
							</div>
				</div>
					
				<div class="form-group">
						<label class="col-md-4 control-label" for="review_content">글 내용</label>
							<div class="col-md-4"> 
								<textarea class="form-control" name="review_content" rows="9"  	style="resize: none;">${review.review_content}</textarea>
							</div>
				</div>
					
				<div class="form-group">
						<label class="col-md-4 control-label" for="mb_id">작성자</label> 
							<div class="col-md-4">
								<input type="text" 	name="mb_id"   class="form-control input-md"  value="${review.mb_id}" readonly="readonly">
							</div>
				</div>
					
				<div class="form-group">
						<label class="col-md-4 control-label" for="reg_date">작성일</label> 
								<div class="col-md-4">
									<input type="text" 	name="reg_date" class="form-control input-md"  	value="<fmt:formatDate pattern="yyyy-MM-dd" value="${review.reg_date}" />" readonly="readonly">
								</div>
			</div>

					<br> <br>
				<div class="form-group" >
				<label class="col-md-4 control-label" for=""></label>
			<div class="btnJoinArea" >
			
			<div class="box-footer">
			<center>	
			<c:if test="${login.mb_id == review.mb_id}">
  					<button type="submit" class="btn btn-warning">수정</button>
					<button type="submit" class="btn btn-danger">삭제</button>
			 </c:if>
				<button type="submit" class="btn btn-info" id="go_list">목록</button>  </center>
				</div>
				</div>
			</div>		
		</fieldset>
		</form>
</body>
</html>