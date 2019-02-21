<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세보기</title>
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='goodsForm']");

		console.log(formObj);

		$(".btn-white").on("click", function() {
			formObj.attr("action", "../review/write.do");
			formObj.attr("method", "get");
			formObj.submit();
		});
	
		$(".btn-warning").on("click", function() {
			formObj.attr("action", "../goods/adminUpdate.ad");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".btn-danger").on("click", function() {
			formObj.attr("action", "../goods/adminDelete.ad");
			formObj.submit();
		});
	});
</script>
</head>
<body>
<form  method="post" role="goodsForm">
<!-- 결제 ㄱㄱ. -->
<input type="hidden" value="${goods.goods_no }" name="goods_no" />
<input type="hidden" value="${goods.goods_name }" name="goods_name" />
<input type="hidden" value="${goods.goods_price }" name="goods_price" />
<input type="hidden" value="${goods.goods_dc }" name="goods_dc" />
<input type="hidden" value="${goods.goods_maker }" name="goods_maker" />
<input type="hidden" value="${goods.goods_origin }" name="goods_orgin" />
<%-- <input type="hidden" value="${goods.catesub_cd }" name="catesub_cd" /> --%>

	<div class="container">
		<div class="card" style="background-color: #fff;">
			<div class="container-fliud" >
				<div class="wrapper row" >
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <!-- class="img-rounded" -->
						  <div class="tab-pane active" id="pic-1">
					<img src="<spring:url value='/image${goods.goods_img }'/>" width="100%"  align="middle">
						  </div>

						  <div class="tab-pane" id="pic-2"><img src="" /></div>
						  <div class="tab-pane" id="pic-3"><img src="" /></div>
						  <div class="tab-pane" id="pic-4"><img src="" /></div>
						  <div class="tab-pane" id="pic-5"><img src="" /></div>
						</div>
						<!--상품 이미지 작은 썸네일로 보여주는 네비게이션 -->
<!-- 						<ul class="preview-thumbnail nav nav-tabs"> -->
<!-- 						  <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="../resources/image/gagu_Bimg1.jpg" onmouseover="showBig('gagu_Bimg1.jpg');" /></a></li> -->
<!-- 						  <li><a data-target="#pic-2" data-toggle="tab"><img src="../resources/image/gagu_Bimg2.jpg" onmouseover="showBig('gagu_Bimg2.jpg);"/></a></li> -->
<!-- 						  <li><a data-target="#pic-3" data-toggle="tab"><img src="../resources/image/gagu_Bimg3.jpg" onmouseover="showBig('gagu_Bimg3.jpg);"/></a></li> -->
<!-- 						  <li><a data-target="#pic-4" data-toggle="tab"><img src="../resources/image/gagu_Bimg4.jpg" onmouseover="showBig('gagu_Bimg4.jpg);"/></a></li> -->
<!-- 						  <li><a data-target="#pic-5" data-toggle="tab"><img src="../resources/image/gagu_Bimg5.jpg" onmouseover="showBig('gagu_Bimg5.jpg);"/></a></li> -->
<!-- 						</ul> -->

<!-- 						<ul id="subImgList" class="preview-thumbnail nav nav-tabs"> -->
<!-- 						  <li class="active"> -->
<%-- 						  	<a  id="subImgList" data-target="#pic-1" data-toggle="tab"><img id="big" src="../download/displayFile?fileName=${goods.file2 }" /></a> --%>
<!-- 						  </li> -->
<%-- 						  <li><a data-target="#pic-2" data-toggle="tab"><img id="big" src="../download/displayFile?fileName=${goods.file3 }" /></a></li> --%>
<%-- 						  <li><a data-target="#pic-3" data-toggle="tab"><img id="big" src="../download/displayFile?fileName=${goods.file4 }" /></a></li> --%>
<%-- 						  <li><a data-target="#pic-4" data-toggle="tab"><img id="big" src="../download/displayFile?fileName=${goods.file5 }" /></a></li> --%>
<%-- 						  <li><a data-target="#pic-5" data-toggle="tab"><img id="big" src="../download/displayFile?fileName=${goods.file6 }" /></a></li> --%>
						  
<!-- 						</ul> -->
						
					</div>
<!-- 					제목 및 제품 설명 -->

					<div class="details col-md-6">
						<br>
					<span class="review-no"><strong><input type="hidden" value="${goods.goods_no }" name="goods_no" /> NO. : ${goods.goods_no }</strong></span>
						<h3 class="product-title">${goods.goods_name }</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							
						</div>
							<p class="product-description"><input type="hidden" value="${goods.catesub_cd }" name="catesub_cd" /> 상품분류 : ${goods.catesub_cd }</p>
							<p class="product-description"><input type="hidden" value="${goods.goods_maker }" name="goods_maker" /> 제조사 : ${goods.goods_maker }</p>
							<p class="product-description"><input type="hidden" value="${goods.goods_origin }" name="goods_origin" /> 원산지 : ${goods.goods_origin }</p>


							<h5 class="price"> 판매가 : <span class="old-Price"><fmt:formatNumber value="${goods.goods_price }" pattern=""/> 원</span><br /></h5>
							<p class="product-description">할인가 : <span class="dis-price" style="color: #ff4242"><fmt:formatNumber value="${goods.goods_price-(goods.goods_price/goods.goods_dc) }" pattern=""/> 원</span></p>
							<input type="hidden" name="goods_dc" value="${goods.goods_dc } " />
						  	
							<p class="product-description">재고 : ${goods.goods_pcs } 개</p>
							<p class="product-description">수량 : 
								<select>
								 <option value="1">1</option>
								 <option value="2">2</option>
								 <option value="3">3</option>
								 <option value="4">4</option>
								 <option value="5">5</option>
								 <option value="6">6</option>
								 <option value="7">7</option>
								 <option value="8">8</option>
								 <option value="9">9</option>
								 <option value="10">10</option>
								</select>
							 개</p>
							<p class="product-description">사이즈 : 
							<select name="goods_size" id="goods_size" style="position: relative;">
							<option value="select"> - [ 필수] 옵션 - </option>
								<option value="s"> S</option>
								<option value="m"> M</option>
								<option value="l"> L</option>
								<option value="xl"> XL</option>
							</select>
							</p>
								<h5 class="colors">
						<p>
						colors: 
							<select name="op_color" id="op_color" style="position: relative;">
								<option value="select"> - [ 필수] 옵션 - </option>
								<option value="Black">Black</option>
								<option value="White">White</option>
								<option value="Brown">Brown</option>
								<option value="Red">Red</option>
								<option value="Gray">Gray</option>
							</select>
							</p>
							<p class="product-description">배송비 : <span class="delv-Price"><fmt:formatNumber value="${goods.goods_charge }" pattern=""/>원</span></p>
						<br />
						<p class="vote">
							<strong>*최소 주문수량 1개 이상<br/>
							5만원 이상 구입 시 배송비는 무료입니다.</strong>
						</p>


						</h5>
						<div class="action">
						
							<button id="#circle1" class="btn btn-info" type="submit">즉시 구매하기</button>
							<button id="#circle2" class="btn btn-success" type="button">장바구니 담기</button>
							<button type="submit"   class="btn btn-white" type="button" >Review 작성</button>
												
							<c:if test="${login.mb_id == 'admin'}">
							<button type="submit" class="btn btn-warning">상품 수정</button>
							<button type="submit" class="btn btn-danger">상품 삭제</button>
							</c:if>
						
						</div>
						<br>
						

					</div>
				</div>
			</div>
		</div>
	</div>
	<div align="center">
		<div id="explain" class="details col-md-10" style="width:100%; border-top:1px solid silver">
			<span id="goods_explain" style="padding: 15px; text-align: center; font-size: 14px; color: #363636;">
			<textarea class="form-control" id="goods_explain"  wrap="VIRTUAL"  name="goods_explain" style="font-size:30px; width:100%; border: 0; resize: none;">
			 ${goods.goods_explain }</textarea>
			</span>
		<!-- 상세 정보 이미지 들어가는곳 -->
		</div>

	<div >
		<div class="row">
			<div >
			<img src="<spring:url value='/image${goods.goods_img2 }'/>" />
	        </div>
			<br/><br/>
	        </div>
	    </div>
	</div>
<!-- 		<p class="info_img"> -->
<%-- 			<img style="max-width: 100%; height: auto; margin: auto;" id="" class="img-responsive" src="../download/displayFile?fileName=${goods.file7 }" /> --%>
<!-- 		</p> -->
<!-- 		<p class="info_img"> -->
<%-- 			<img style="max-width: 100%; height: auto; margin: auto;" id="" class="img-responsive" src="../download/displayFile?fileName=${goods.file8 }" /> --%>
<!-- 		</p> -->
</form>
</body>
</html>