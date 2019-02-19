<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(function() {
	
	//카테고리 처음 불러오기	(1차가 TOP인데 2차가 안불러 와져서 한번 불러오는것.)
	cateSelect();
	
});

function cateSelect(){
	
 var	cate_nm =  $("#exampleFormControlSelect1").val();	//현재 카테고리 선택되어 있는 값을 가져옴
	
 //아작스 시작
 $.ajax({
		url:"/goods/category.ad",				//자바(서버) 로 보낼 url명
		type: "POST",					//서버로 보낼때 전송방식
		data : {							//서버로 보낼 데이터들
			cateGory1 : cate_nm
	},
		dataType : "json", //서버에서 보내는 데이터 타입
		
 		//contentType : "application/json; charset=UTF-8" ,//서버로 보내는타입 
		
		//ajax 성공했을떄 success 메소드로 원하는 것 실행시킴(이런걸 콜백함수라고 함).
		//error:function() -- 에러났을때 원하는 것 실행시킴
		success : function(result) {		
			console.log("result"+result);		
	
			// map(키,값) 형식을 JSON으로 변환 해서 확인함 [필요없음]
			console.log("success : "+JSON.stringify(result.cateGory2)); 
				
			//map(키,값) 형식을 cateGory22에 담음                  [필요없음]
			var cateGory22 =JSON.stringify(result.cateGory2);			
			
			//2차 카테고리 초기화  -1차 카테고리 별로 2차카테고리를 재설정 해줘야 하기 때문. 이거 없으면 2차카테고리가 계속 늘어남
			$("#catesub_cd").empty();				
			
			//2차카테고리 초기화 - 맨 위에 선택하세요가 뜨게끔 설정해주는 것.
			$("#catesub_cd").append('<option>선택하세요</option>'); 
			
	
			 //콘솔찍어 데이터들 확인
			console.log("result.cateGory2-name = "+result.cateGory2[0].catesub_nm);
			console.log("result.cateGory2[0].catesub_cd = "+result.cateGory2[0].catesub_cd);
			console.log("result = "+result);
			console.log("MSG = "+result.msg);
					
			
		//	배열 반복문. var = 인덱스(배열 방번호)  in = 변수
			for(var i in result.cateGory2) {
				
			//	ID가 catesub_cd인곳을 찾아서 append 메소드로 해당 html끝부분에 append() 괄호 안 내용을 그대로 추가해줌
				$("#catesub_cd").append(
// 				"<option name='catesub_cd' value='"+result.cateGory2[i].catesub_cd+"'>"+result.cateGory2[i].catesub_nm+"</option>"); 
				"<option  value='"+result.cateGory2[i].catesub_cd+"'>"+result.cateGory2[i].catesub_nm+"</option>"); 
				
				$("#catesub_cd option:checked").val();
				
				//로그찍어봄
				console.log(result.cateGory2[i].catesub_nm);
				console.log(result.cateGory2[i].catesub_cd);
						
			}
	  },
	  //에러 났을시 success를 안타고 이쪽을 탐.
	  	error:function(jqXHR){
	  		alert(jqXHR.status);
	  		alert(jqXHR.statusText);
	  	}

	});
}
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

var submit_btn = function()	{
		
		$("#form").submit();
	
}

</script>
 
</head>
<body>
<form action="/goods/adminWriteProcess.ad" class="form-horizontal" method="POST" id="form" enctype="multipart/form-data" accept-charset ="UTF-8">
<!-- enctype="multipart/form-data" -->
<input id="goods_no" name="goods_no" type="hidden" >
<h2  style="text-align: center; color: silver;">관리자 상품 등록</h2>
<fieldset> 
<legend></legend>
<!-- 분류 -->
<div class="form-group">
  <label class="col-md-4 control-label" >분류명</label>  
  <div style='display:inline; min-width:350px;'>
	<div style='display:inline;float:left;width:150px'>
		<select  id="exampleFormControlSelect1" onchange="cateSelect()" class="form-control" name="cate_nm">
				<!--  반복문으로 1차 카테고리 불러오고 갯수만큼 select 출력-->
				<c:forEach items="${depthOne}" var="cate1">
				<option >${cate1.cate_nm}</option>
				</c:forEach>
				
		</select>
		</div>
		<div style='display:inline;float:left;width:180px' >
				
				<!-- 이 부분에 1차 선택시마다 2차 카테고리,  append()안에 내용이 들어감.-->
		<select id="catesub_cd" class="form-control" name="catesub_cd" >
		</select>
		
<!-- 		<input id="catesub_cd" name="catesub_cd"  value="A013"> -->
		</div>
		</div>
		</div>
<br>

<!-- 상품명 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="goods_name">상품명</label>  
  <div class="col-md-4">
  <input id="goods_name" name="goods_name" type="text" placeholder="상품명을 입력하세요." class="form-control input-md" >
  <p style="font-size: 11px; font-family: sans-serif; font-weight: bold; color: blue; margin-top: 5px;">
    	(상품명은 20자 이내)
   </p> 
  </div>
</div>


<!-- 제조사 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="goods_maker">제조사</label>  
  <div class="col-md-4">
	  <input id="goods_maker" name="goods_maker" type="text" placeholder="제조사를 입력하세요." class="form-control input-md" >
	  
  </div>
</div>
<!-- 원산지 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="goods_origin">원산지</label>  
  <div class="col-md-4">
  <input id="goods_origin" name="goods_origin" type="text" placeholder="제조사를 입력하세요." class="form-control input-md" >
  
  </div>
</div>

<!-- 상품가격 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="goods_price ">상품 가격</label>  
  <div class="col-md-4">
  <input id="goods_price" name="goods_price" type="text" placeholder="상품 가격을 입력하세요." class="form-control input-md" >
    
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
    <input id="goods_pcs" name="goods_pcs" type="text" placeholder="재고를 입력해주세요." class="form-control input-md" >
      </div>
</div>

<!-- 상품 할인율 컬럼 추가해야함 -->
<!-- 상품 할인율 5%, 10% -->
<div class="form-group">
  <label class="col-md-4 control-label" for="go_dc">상품 할인율</label>
  <div class="col-md-3">
    <input id="goods_dc" name="goods_dc" type="text" placeholder="상품할인율 (5% or 10%)" class="form-control" >
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
    <input id="goods_charge" name="goods_charge" type="text" placeholder="2,000원(무료배송 : 5만원 이상)"  class="form-control input-md" >
    
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
<!-- <div class="form-group"> -->
<!--   <label class="col-md-4 control-label" for="file1">상품 이미지 첨부</label> -->
<!--   <div class="col-md-5"> -->
     <input id="uploadFile" name="uploadFile" type="file"  class="form-control" ><br /> 
<!--     &nbsp; -->
<!--     <br> -->
<!--   </div> -->
<!-- </div> -->
<!-- </div>  -->

<!-- <!-- 상품 상세 페이지  --> 
<!--  <div>  -->
<!-- <div class="form-group"> -->
<!--   <label class="col-md-4 control-label" for="uploadFiles">상세 페이지 첨부 </label> -->
<!--   <div class="col-md-5"> -->
<!--     <input id="uploadFile2" name="uploadFile2" type="file" multiple="multiple" placeholder="상세1" class="form-control" ><br /> -->
<!--     &nbsp; -->
<!--     <input id="uploadFile3" name="uploadFile3" type="file" multiple="multiple" placeholder="상세2" class="form-control" ><br /> -->
<!--     &nbsp; -->
<!--     <input id="uploadFile4" name="uploadFile4" type="file" multiple="multiple" placeholder="상세3" class="form-control" ><br /> -->
<!--     &nbsp; -->
<!--   </div> -->
<!-- </div> -->
<!-- </div>  -->


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for=""></label>
  <div class="col-md-4">
  	
    <button type="button" id="btn" class="btn btn-info" onclick="javascript:submit_btn();">상품 등록</button>
    <button type="reset" class="btn btn-danger">등록 취소</button>
	<button id="adminListBtn"type="button" name="adminListBtn" class="btn btn-white"  onclick="history.back();">목록</button>
 	
  </div>
</div>
<br>
</fieldset>
</form>
</body>
</html>