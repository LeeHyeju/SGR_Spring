<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세보기</title>
</head>
<body>
<form action="../pay" method="get">
<!-- 결제 ㄱㄱ. -->
<input type="hidden" value="${goods.goods_name }" name="goods_name" />
<input type="hidden" value="${goods.goods_price }" name="goods_price" />
<input type="hidden" value="${goods.goods_dc }" name="goods_dc" />
<input type="hidden" value="${goods.goods_maker }" name="goods_maker" />
<input type="hidden" value="${goods.goods_origin }" name="goods_orgin" />
	<div class="container">
		<div class="card" style="background-color: #fff;">
			<div class="container-fliud" >
				<div class="wrapper row" >
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <!-- class="img-rounded" -->
<%-- 						  <div class="tab-pane active" id="pic-1"><img id="big" src="../download/displayFile?fileName=${goods.file1 }" class="demo" /></div> --%>

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
						<h3 class="product-title">${goods.goods_name }</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no"><strong><input type="hidden" value="${goods.goods_no }" name="goods_no" /> 상품 번호 : ${goods.goods_no }</strong></span>
						</div>
							<p class="product-description"><input type="hidden" value="${goods.goods_maker }" name="goods_maker" /> 제조사 : ${goods.goods_maker }</p>
							<p class="product-description"><input type="hidden" value="${goods.goods_origin }" name="goods_origin" /> 원산지 : ${goods.goods_origin }</p>

							<!-- 추가설명 -->
<!-- 						<p class="product-description"> -->
<!-- 						제품 설명란으로 쓸거임 , 가구 퍼니쳐 디테일 뷰 입니다. -->
<!-- 						</p> -->

							<h5 class="price"> 판매가 : <span class="old-Price"><fmt:formatNumber value="${goods.goods_price }" pattern=""/> 원</span><br /></h5>
							<p class="product-description">할인가 : <span class="dis-price" style="color: #ff4242"><fmt:formatNumber value="${goods.goods_price-(goods.goods_price/goods.goods_dc) }" pattern=""/> 원</span></p>
							<input type="hidden" name="goods_disPer" value="${goods.goods_dc } " />
							<c:choose>
						  		<c:when test="${goods.catesub_cd == A011}">
						  			<p class="product-description">상품분류 : 티</p>
						  		</c:when>
						  		<c:when test="${goods.catesub_cd == A012 }">
									<p class="product-description">상품분류 : 긴팔ㄹ</p>
						  		</c:when>
						  		<c:when test="${goods.catesub_cd == A013 }">
									<p class="product-description">상품분류 : 머시기</p>
						  		</c:when>
						  	</c:choose>
						  	
							<p class="product-description">수량 : ${goods.goods_pcs } 개</p>
							<p class="product-description">사이즈 : 
							<select name="op_price" id="op_price" style="position: relative;">
								<option value="1"> S</option>
								<option value="2"> M</option>
								<option value="3"> L</option>
								<option value="4"> XL</option>
							</select>
							</p>
							<p class="product-description">배송비 : ${goods.goods_charge } 원</p>
							
						<br />
						<br />
						<p class="vote">
							<strong>*최소 주문수량 1개 이상<br/>
							5만원 이상 구입 시 배송비는 무료입니다.</strong>
						</p>

						<h5 class="colors">
						colors: 
							<select name="op_color" id="op_color" style="position: relative;">
								<option value="Black">Black</option>
								<option value="White">White</option>
								<option value="Brown">Brown</option>
								<option value="Gray">Gray</option>
							</select>

						</h5>
						<div class="action">
							<!-- 버튼 동그라미로 처리 -->
							<button id="#circle1" class="btn_blk" type="submit">즉시 구매하기</button>
							<button id="#circle2" class="btn_blk" type="button">장바구니 담기</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div id="explain" class="details col-md-10" style="width:100%; border-top:1px solid silver">
			<span id="goods_explain" style="padding: 15px; text-align: center; font-size: 14px; color: #363636;">
<%-- 				${goods.goods_explain } --%>
			</span>
		<!-- 상세 정보 이미지 들어가는곳 -->
		</div>
	</div>
<!-- 	<div class="container"> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-3 col-sm-4 col-xs-6"> -->
<%-- 	        	<img id="" class="img-responsive" src="../download/displayFile?fileName=${goods.file7 }" /> --%>
<!-- 	        </div> -->
<!-- 	        </div> -->
<!-- 	    </div> -->
<!-- 	</div> -->
<!-- 		<p class="info_img"> -->
<%-- 			<img style="max-width: 100%; height: auto; margin: auto;" id="" class="img-responsive" src="../download/displayFile?fileName=${goods.file7 }" /> --%>
<!-- 		</p> -->
<!-- 		<p class="info_img"> -->
<%-- 			<img style="max-width: 100%; height: auto; margin: auto;" id="" class="img-responsive" src="../download/displayFile?fileName=${goods.file8 }" /> --%>
<!-- 		</p> -->
</form>
</body>
</html>