<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    	<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보 수정</title>
<style type="text/css">
div.button
{
   margin: auto;
   width: 50%;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=mb_zipcode]").val(data.zonecode);
				$("[name=mb_address]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
</script>
<script type="text/javascript">

//console.log($("#mb_id").val()+"$(function(){} 선언 밖에다 콘솔)");
// 페이지를 다 불러온뒤 Jquery 실행
$(function() { //$(document).ready(function(){} <<--- 같은 거 임
	//console.log($("#mb_id").val()+"$(function(){} 선언 안에다 콘솔)");	
	//console.log("${member.mb_sex}");
	if($("#mb_sex").val() == "남자"){ //#mb_sex(id명) 의 값이 남자일떄
		$("#M").attr('checked',true);				//class는 # 대신에 . ex)  .M
	}else{//남자가 아닐때 
		$("#W").attr('checked',true);				//class는 # 대신에 . ex)  .M
	}
	
});
</script>
</head>
<body>
<h1 style="text-align: center; color: silver;">내 정보 수정</h1>
	<form action="./update.do" id="updateForm" method="post"  class="form-horizontal">
		<!-- 히든으로 보낼 값 -->
<%-- 		<input type="hidden" name="mb_id" value="${member.mb_id }" id="mb_id"/> --%>
		<input type="hidden" value="${member.mb_sex }" id="mb_sex"/>
		<fieldset>
			<legend></legend>

			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_id">아이디</label>
			<div class="col-md-4">
			<input  type="text"  id="mb_id" name="mb_id"  value="${member.mb_id }"  class="form-control input-md" readonly="readonly">
			</div>
			</div>

			<div class="form-group">
			<label class="col-md-4 control-label" for="id_mb_name">이름</label>
			<div class="col-md-4">
			<input type="text" 	id="mb_name" name="mb_name" size="7" required placeholder="이름" class="form-control input-md" 
						pattern="^[가-힣]{2,6}$" value="${member.mb_name }">
			</div>
			</div>
						
			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_sex">성별</label>
			<div class="col-md-2">
			<label>	남</label>	<input type="radio" name="mb_sex" id="M" value="남자" required>
			<label>	여</label>	<input type="radio" name="mb_sex" id="W" value="여자" required>
			</div>
			</div>
				
				<div class="form-group">
			<label class="col-md-4 control-label" for="mb_bday">생년월일</label>
			<div class="col-md-4">
				<input type="text" id="mb_bday" name="mb_bday" required 	  class="form-control input-md" 
						size="7" maxlength="6" pattern="^[0-9]{6}$"  value="${member.mb_bday }">
				</div>
				</div>
				
			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_phone">핸드폰번호</label>
			<div class="col-md-4">
			<input type="tel" id="mb_phone" name="mb_phone" required	class="form-control input-md" value="${member.mb_phone }" size="15" maxlength="11">
			</div>
			</div>
				
			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_email">이메일</label>
			<div class="col-md-4">
				<input type="text" id="mb_email"	 name="mb_email"	size="30" class="form-control input-md" required value="${member.mb_email}">
			</div>
			</div>
			
			
			<div class="form-group">
			<label class="col-md-4 control-label" for="mb_zipcode">주소</label>
			<input type="button" 	onclick="execPostCode()" value="우편번호 찾기" >		
			<div class="col-md-1">
			<input type="text" 	 name="mb_zipcode" 	class="form-control input-md"  id="mb_zipcode" placeholder="우편번호" required size="5"
						readonly="readonly"  value="${member.mb_zipcode }">
			</div>
			<div class="col-md-3">
			<input 	type="text" name="mb_address"  id="mb_address" placeholder="주소" class="form-control input-md"	size="30" required readonly="readonly" value="${member.mb_address }"> 
			<input type="text"	 name="mb_addressDetail"	class="form-control input-md" id="mb_addressDetail" placeholder="상세주소" size="30"	required value="${member.mb_addressDetail}">
			</div>
			</div>

				<div class="form-group">
			<label class="col-md-4 control-label" for="mb_joinDate">가입일자</label>
			<div class="col-md-4">
				<input type="text" value="<fmt:formatDate pattern="yyyy-MM-dd"	value="${member.mb_joinDate}" />" class="form-control input-md"   readonly="readonly" >
				</div>
				</div>

	
			<br> <br>
				<div class="form-group" >
				<label class="col-md-4 control-label" for=""></label>
			<div class="btnJoinArea" >
			<center>	<button type="submit" class="btn btn-default">수정</button>
				<button type="button" class="btn btn-white" onclick="history.back();">취소</button></center>
			</div>
			</div>
		</fieldset>
	</form>
</body>
</html>