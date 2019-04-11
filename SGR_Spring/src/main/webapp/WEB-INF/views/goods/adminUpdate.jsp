<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
select {
	width: 200px; /* 원하는 너비설정 */
	padding: .2em .4em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	border-radius: 5px;
	border-color: silver;
}
img{
width: 100px;
height: 100px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='updateForm']");

		console.log(formObj);

		$(".btn-info").on("click", function() {
			formObj.attr("action", "../goods/adminUpdate.ad");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$(".btn-white").on("click", function() {
			formObj.attr("action", "../goods/adminList.ad");
			formObj.submit();
		});
	});
</script>
<script type="text/javascript">
$(function(){
   var cate2val = $('#catesub_cd');
	$('#catesub_nm').change(function(){
		var element = $(this).find('option:selected');
		var myTag = element.attr('value');
		cate2val.val(myTag);
	});
});
</script>

</head>
<body>
<form action="/adminUpdate.ad" method="post" role="updateForm" class="form-horizontal" enctype="multipart/form-data" >
<h2  style="text-align: center; color: silver;">관리자 상품 수정</h2>
<fieldset> 
<legend></legend>


<!-- 분류 -->
<div class="form-group">
  <label class="col-md-4 control-label" >분류명</label>  
  <div style='display:inline; min-width:350px;'>
		<div style='display:inline;float:left;width:180px' >
				
				<!-- 이 부분에 1차 선택시마다 2차 카테고리,  append()안에 내용이 들어감.-->
		<input id="cate_nm" name="cate_nm" type="text"  class="form-control input-md"   readonly="readonly" value="${admin.catesub_cd}" > 
		
<!-- 		<input id="catesub_cd" name="catesub_cd"  value="A013"> -->
		</div>
		</div>
		</div>
<br>

<!-- 상품 번호 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="goods_no">상품 번호</label>  
  <div class="col-md-4">
  <input id="goods_no" name="goods_no" type="text"  class="form-control input-md" 
  readonly="readonly" value="${admin.goods_no }" > 
  </div>
</div>

<!-- 상품명 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="goods_name">상품명</label>  
  <div class="col-md-4">
  <input id="goods_name" name="goods_name" type="text" value="${admin.goods_name }"  readonly="readonly" class="form-control input-md" >
  <p style="font-size: 11px; font-family: sans-serif; font-weight: bold; color: blue; margin-top: 5px;">
    	(상품명은 20자 이내)
   </p> 
  </div>
</div>


<!-- 제조사 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="goods_maker">제조사</label>  
  <div class="col-md-4">
	  <input id="goods_maker" name="goods_maker" type="text"  value="${admin.goods_maker }" class="form-control input-md" >
	  
  </div>
</div>
<!-- 원산지 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="goods_origin">원산지</label>  
  <div class="col-md-4">
  <input id="goods_origin" name="goods_origin" type="text" value="${admin.goods_origin }"   class="form-control input-md" >
  
  </div>
</div>

<!-- 상품가격 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="goods_price ">상품 가격</label>  
  <div class="col-md-4">
  <input id="goods_price" name="goods_price" type="text"   value="${admin.goods_price }"   class="form-control input-md" >
    
  </div>
</div>

<!-- <div class="form-group"> -->
<!--   <label class="col-md-4 control-label" for="goods_dc ">상품 가격<br>/할인 가격</label>   -->
<!--   <div class="col-md-3"> -->
<%--   	${goods.goods_price } / ${goods.goods_dc } --%>
<!--   <input id="goods_dc" name="goods_dc" type="text" placeholder="상품 가격을 입력하세요." class="form-control input-md" > -->
<!--   </div> -->
<!-- </div> -->

<!-- 상품 재고 컬럼 추가해야함 -->
<!-- 상품 재고 입력  -->
<div class="form-group">
  <label class="col-md-4 control-label" for="">상품 재고(수량)</label>
  <div class="col-md-3">
    <input id="goods_pcs" name="goods_pcs" type="text"  value="${admin.goods_pcs }" class="form-control input-md" >
      </div>
</div>

<!-- 상품 할인율 컬럼 추가해야함 -->
<!-- 상품 할인율 5%, 10% -->
<div class="form-group">
  <label class="col-md-4 control-label" for="go_dc">상품 할인율</label>
  <div class="col-md-3">
    <input id="goods_dc" name="goods_dc" type="text"  value="${admin.goods_dc }" class="form-control" >
	<p style="font-size: 11px; font-family: sans-serif; font-weight: bold; color: blue; margin-top: 5px;">
    	(할인이 없을시 1%로 기재)
    </p>
  </div>
</div>
<!-- 칼라 -->
<!-- <div class="form-group"> -->
<!--   <label class="col-md-4 control-label" for="go_color">색상 추가</label> -->
<!--   <div class="col-md-2"> -->
<!--     <input id="go_color" name="go_color" type="text" placeholder="색상 여기는 셀렉트 박스로 해야함" class="form-control" > -->
<!--   </div> -->
<!-- </div> -->

<!-- 배송비 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="">배송비</label>
  <div class="col-md-3">
    <input id="goods_charge" name="goods_charge"   value="${admin.goods_charge }" type="text" placeholder="2,000원(무료배송 : 5만원 이상)"  class="form-control input-md" >
    
  </div>
</div>


<!-- 상품 상세정보 넘길 컬럼 추가해야함 -->
<!-- <div class="form-group"> -->
<!--   <label class="col-md-4 control-label" for="">상품 상세정보</label> -->
<!--   <div class="col-md-5">                      -->
<!--     <textarea class="form-control" id="go_explain" name="go_explain" style=" resize: none;" rows="5"></textarea> -->
<!--   </div> -->
<!-- </div> -->

<!-- 상품 이미지 파일 첨부 1-->
<!-- \uploadfile name값 -단일: uploadFile, 다중 : uploadFiles  -->
<!-- <div> -->
<div class="form-group">
  <label class="col-md-4 control-label" for="file1">상품 이미지 첨부</label>
  <div class="col-md-4">
  <img src="<spring:url value='/image${admin.goods_img }'/>" 	class="img-responsive" style="width: 100%" >
  <br>
  <img src="<spring:url value='/image${admin.goods_img2 }'/>" 	class="img-responsive" style="width: 100%" >
     <input id="uploadFile" name="uploadFile" type="file"  class="form-control"  value="{admin.goods_img}" ><br /> 
     <input id="uploadFile2" name="uploadFile2" type="file"  class="form-control"  value="{admin.goods_img2}" ><br /> 
<!--     &nbsp; -->
<!--     <br> -->
  </div>
</div>
<!-- </div>  -->



<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for=""></label>
  <div class="col-md-4">
  	
    <button type="button" id="btn" class="btn btn-info" 
    onclick="location.href='./adminUpdate.ad?goods_no=<c:out value='${admin.goods_no }'/>&goods_img=<c:out value='${admin.goods_img }'/>';" >
    상품 수정</button>
    <button type="reset" class="btn btn-danger" onclick="history.back();">수정 취소</button>
	<button id="adminListBtn"type="submit" name="adminListBtn" class="btn btn-white" >목록</button>

  </div>
</div>
<br>
</fieldset>
</form>
</body>
</html>