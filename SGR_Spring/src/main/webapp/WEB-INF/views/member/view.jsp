<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보 보기</title>
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-primary").on("click", function() {
			formObj.attr("action", "../member/update.do");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".btn-warning").on("click", function() {
			formObj.attr("action", "../member/changePw.do");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".btn-danger").on("click", function() {
			if(confirm("정말 탈퇴하시겠습니까?")){
					  formObj.attr("action", "../member/leave.do");
				      formObj.attr("method", "post");
				      formObj.submit();
					alert ("탈퇴되셨습니다.");//확인
				    document.form.submit();
			}else{
				alert("탈퇴가 취소되셨습니다.");
				 formObj.attr("action", "../main/main.do") ;
				   formObj.submit();
				}				
		});
	});
	
</script>

</head>
<body>
	<h1 style="text-align: center; color: silver;">MyPage</h1>
	<fieldset>
		<legend></legend>
		<form role="form" method="post" class="form-horizontal" >
			<!-- 히든으로 보낼 값 -->
			<input type="hidden" name="mb_id" value="${member.mb_id }" id="mb_id" />
			<input type="hidden" name="mb_pw" value="${member.mb_pw }" id="mb_pw" />
<!-- 		</form> -->
		
<!-- 		<form class="form-horizontal" > -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="mb_name">이름</label>
			<div class="col-md-4">
			<input type="text" id="mb_name"  class="form-control input-md"  value="${member.mb_name }" readonly="readonly" >
			</div>
			</div>
					
			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_sex">성별</label>
			<div class="col-md-4">
			<input type="text" id="mb_sex"  class="form-control input-md"  value="${member.mb_sex }" readonly="readonly" >
			</div>
			</div>
	
		<div class="form-group">
			<label class="col-md-4 control-label" for="mb_bday">생년월일</label>
			<div class="col-md-4">
			<input type="text" id="mb_bday"  class="form-control input-md"  value="${member.mb_bday }" readonly="readonly" >
			</div>
			</div>
		
		<div class="form-group">
			<label class="col-md-4 control-label" for="mb_phone">핸드폰번호</label>
			<div class="col-md-4">
			<input type="tel" id="mb_phone"  class="form-control input-md"  value="${member.mb_phone }" readonly="readonly" >
			</div>
			</div>
	
		<div class="form-group">
			<label class="col-md-4 control-label" for="mb_email">이메일</label>
			<div class="col-md-4">
			<input type="text" id="mb_email"  class="form-control input-md"  value="${member.mb_email }" readonly="readonly" >
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_email">우편번호</label>
			<div class="col-md-1">
			<input type="text" id="mb_zipcode"  class="form-control input-md"  value="${member.mb_zipcode }" readonly="readonly" >
			</div>
			</div>
		<div class="form-group">
			<label class="col-md-4 control-label" for="mb_email">주소</label>
			<div class="col-md-4">
			<input type="text" id="mb_address"  class="form-control input-md"  value="${member.mb_address }" readonly="readonly" >
			<input type="text" id="mb_addressDetail"  class="form-control input-md"  value="${member.mb_addressDetail }" readonly="readonly" >
			</div>
			</div>
			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_joinDate">가입일자</label>
			<div class="col-md-4">
			<input type="text" value="<fmt:formatDate pattern="yyyy-MM-dd"	value="${member.mb_joinDate}" />" class="form-control input-md"   readonly="readonly" >
			</div>
			</div>
			<br/>
	</form>
		</fieldset>
	<br>
	<br>
		<div class="form-group" >
				<label class="col-md-4 control-label" for=""></label>
			<div class="btnJoinArea" >
				<button type="submit" class="btn btn-primary">내정보수정</button>
				<button type="submit" class="btn btn-warning">비밀번호수정</button>
				<button type="button"  class="btn btn-danger">회원탈퇴</button>
			</div>
			</div>
		
</body>
</html>