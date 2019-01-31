<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center; color: silver;">리뷰 작성하기</h1>
			<fieldset>
			<legend></legend>
			<form action="./write.do" method="post" class="form-horizontal">
			
			<div class="form-group">
			<label class="col-md-4 control-label" for="goods_no">상품 번호</label> 
			<input id="goods_no" name="goods_no" value="${goods.goods_no }" readonly="readonly">
			</div>
			
			<div class="form-group">
			<label class="col-md-4 control-label" for="catesub_cd">소분류코드</label> 
			<input id="catesub_cd" name="catesub_cd" value="${goods.catesub_cd }" readonly="readonly">
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="qna_title">글 제목</label> 
				<div class="col-md-4">
				<input type="text" 	id="review_title" name="review_title" class="form-control input-md"  placeholder=" 제목을 적어주세요.">
				</div>
				</div>
				
				<div class="form-group">
				<label class="col-md-4 control-label" for="qna_content">글 내용</label>
				<div class="col-md-4">
				<textarea  class="form-control" id="review_content" name="review_content" rows="9"  
				style="resize: none;" placeholder="내용을 적어주세요."></textarea>
				</div>
				</div>
				
				<div class="form-group">
				<label class="col-md-4 control-label" for="mb_id">작성자</label> 
				<div class="col-md-4">
				<input type="text" 	id="mb_id" name="mb_id" class="form-control input-md" value="${login.mb_id }" readonly="readonly">
				</div>
				</div>
								
				<br><br><br>
				<div class="box-footer" >
				<label class="col-md-4 control-label" for=""></label>
				<div class="btnJoinArea" ><center>
						<button type="submit" class="btn btn-info">작성</button>
						<button type="submit" class="btn btn-success">목록</button>
					</center>
					</div>
					</div>
			</form>
			</fieldset>
			
			
</body>
</html>