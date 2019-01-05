<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	itemChange();
})

var cate_nm =  = $("#exampleFormControlSelect1").val();

$.ajax({
	 type: "GET",
}
	url:"/goods/adminWrite.ad",
	data : cate_nm,
	success : function(data) {

  },

})


function itemChange(){
	 
	
	
	var outer = ["선택하세요","JACKET","CARDIGAN","COAT","JUMPER"];
	var bottom = ["선택하세요","PANTS","OPS","SKIRT"];
	var acc = ["선택하세요","EARRING","HAT","LEGGINGS","BAG"];
	var shoes = ["선택하세요","WARKER","BOOTS","SNEAKERS","FLAT"];
	 
	var selectItem = $("#exampleFormControlSelect1").val();
	 
	var changeItem;
	  
	if(selectItem == "TOP"){
	  changeItem = top;
	}
	else if(selectItem == "OUTER"){
	  changeItem = outer;
	}
	else if(selectItem == "BOTTOM"){
	  changeItem =  bottom;
	}
	else if(selectItem == "ACC"){
		  changeItem =  acc;
		}
	else if(selectItem == "SHOES"){
		  changeItem =  shoes;
		}	
	
	$('#select2').empty();
	 
	for(var count = 0; count < changeItem.length; count++){                
	                var option = $("<option>"+changeItem[count]+"</option>");
	                $('#select2').append(option);
	            }
	}

</script>
</head>
<body>

<form action="adminWrite.ad" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
<h2  style="text-align: center; color: silver;">관리자 상품 등록</h2>
<fieldset>
<legend></legend>
<!-- 히든 -->
 <input id="goods_no" name="goods_no" type="hidden"  class="form-control input-md" > 

<!-- 분류 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="catesub_cd">분류명</label>  
  <div style='display:inline; min-width:350px;'>
	<div style='display:inline;float:left;width:150px'>
		<select  id="exampleFormControlSelect1" onchange="itemChange()" class="form-control">
		
		<option>TOP</option>
		<option >OUTER</option>
		<option>BOTTOM</option>
		<option>ACC</option>
		<option>SHOES</option>
		</select>
		</div>
		<div style='display:inline;float:left;width:180px' >
		<select id="select2" class="form-control" >
		<option>선택하세요</option>
		</select>
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
  <div class="col-md-3">
  <input id="goods_price" name="goods_price" type="text" placeholder="상품 가격을 입력하세요." class="form-control input-md" >
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="goods_dc ">할인된 가격<br>/할인된 상품 가격</label>  
  <div class="col-md-3">
  	${goods.goids_price } / ${goods.goids_dc }
  <input id="goods_dc" name="goods_dc" type="text" placeholder="상품 가격을 입력하세요." class="form-control input-md" >
  </div>
</div>

<!-- 상품 재고 컬럼 추가해야함 -->
<!-- 상품 재고 입력  -->
<div class="form-group">
  <label class="col-md-4 control-label" for="">상품 재고(수량)</label>
  <div class="col-md-2">
    <input id="goods_pcs" name="goods_pcs" type="text" placeholder="재고를 입력해주세요." class="form-control input-md" >
      </div>
</div>

<!-- 상품 할인율 컬럼 추가해야함 -->
<!-- 상품 할인율 5%, 10% -->
<div class="form-group">
  <label class="col-md-4 control-label" for="go_disPer">상품 할인율</label>
  <div class="col-md-2">
    <input id="go_disPer" name="go_disPer" type="text" placeholder="상품할인율 (5% or 10%)" class="form-control" >
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
  <div class="col-md-2">
    <input id="go_deli_price" name="go_deli_price" type="text" placeholder="2,000원(무료배송 : 5만원 이상)"  class="form-control input-md" >
    
  </div>
</div>


<!-- 상품 상세정보 넘길 컬럼 추가해야함 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="">상품 상세정보</label>
  <div class="col-md-5">                     
    <textarea class="form-control" id="go_explain" name="go_explain" style=" resize: none;" rows="5"></textarea>
  </div>
</div>

<!-- 상품 이미지 파일 첨부 1,2,3 -->
<!-- uploadfile name값 -단일: uploadFile, 다중 : uploadFiles -->
<div>
<div class="form-group">
  <label class="col-md-4 control-label" for="file1">상품 이미지 첨부</label>
  <div class="col-md-5">
    <input id="uploadFile" name="uploadFile" type="file" placeholder="파일 첨부1" class="form-control" ><br />
    &nbsp;
    <br>
  </div>
</div>
</div>

<!-- 상품 상세 페이지 -->
<div>
<div class="form-group">
  <label class="col-md-4 control-label" for="uploadFiles">상세 페이지 첨부 </label>
  <div class="col-md-5">
    <input id="uploadFile2" name="uploadFile2" type="file" placeholder="상세1" class="form-control" ><br />
    &nbsp;
    <input id="uploadFile3" name="uploadFile3" type="file" placeholder="상세2" class="form-control" ><br />
    &nbsp;
    <input id="uploadFile4" name="uploadFile4" type="file" placeholder="상세3" class="form-control" ><br />
    &nbsp;
  </div>
</div>
</div>


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for=""></label>
  <div class="col-md-4">
  	<center>
    <button id="btn" name="" class="btn btn-info">상품 등록</button>
    <button type="reset" name="" class="btn btn-danger">등록 취소</button>
	<button id="adminListBtn"type="button" name="adminListBtn" class="btn btn-white"  onclick="history.back();">목록</button>
 	</center>
  </div>
</div>
<br>
</fieldset>
</form>
</body>
</html>