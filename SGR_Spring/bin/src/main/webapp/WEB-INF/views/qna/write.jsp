<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="write.do" method="post">
		<h1 style="text-align: center; color: silver;">문의 작성하기</h1>
			<fieldset>
			<legend></legend>
				
				<div class="form-group">
				<label class="col-md-4 control-label" >상품번호</label> 
				<div class="col-md-4">
				<input type="text" 	name='title' class="form-control input-md" >
				</div>
				</div>
				
				<div class="form-group">
				<label class="col-md-4 control-label" >소분류코드</label> 
				<div class="col-md-4">
				<input type="text" 	name='title' class="form-control input-md" >
				</div>
				</div>
				
				<div class="form-group">
				<label class="col-md-4 control-label" >Title</label> 
				<div class="col-md-4">
				<input type="text" 	name='title' class="form-control input-md"  placeholder="문의하실 제목을 적어주세요.">
				</div>
				</div>
						<br/>
				<div class="form-group">
				<label class="col-md-4 control-label">Content</label>
				<div class="col-md-4">
				<textarea class="form-control" name="content" rows="5"  style=" resize: none;" placeholder="문의하실 내용을 적어주세요."></textarea>
				</div>
				</div>
					<br/><br/><br/><br/>
				<div class="form-group">
				<br/><label class="col-md-4 control-label">Writer</label> 
				<div class="col-md-4">
				<input type="text" 	name="writer" class="form-control input-md" value="${list.mb_id }">
				</div>
				</div>
								
			<br><br><br><br><br>
				<div class="box-footer" >
				<label class="col-md-4 control-label" for=""></label>
				<div class="btnJoinArea" ><center>
						<button type="submit" class="btn btn-default">작성</button>
						<button type="submit" class="btn btn-white">목록</button>
					</center>
					</div>
					</div>
				</fieldset>
					</form>
</body>
</html>