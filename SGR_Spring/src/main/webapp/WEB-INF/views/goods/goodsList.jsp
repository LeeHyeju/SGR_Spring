<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품리스트</title>
<style type="text/css">
select {
	width: 100px; /* 원하는 너비설정 */
	padding: .1em .1em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	/*     background: url('이미지 경로') no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
</style>
<!-- 검색 스크립트 -->
<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							str = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
							console.log(str);
							self.location = str;
						});
			});
</script>
<script type="text/javascript">

function itemChange(){
	 
	var top = ["TEE","BLOUSE","SHIRT","KNIT"];
	var outer = ["JACKET","CARDIGAN","COAT","JUMPER"];
	var bottom = ["PANTS","OPS","SKIRT"];
	var acc = ["EARRING","HAT","LEGGINGS","BAG"];
	var shoes = ["WARKER","BOOTS","SNEAKERS","FLAT"];
	 
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
	<br>
	<form id="jobForm">
		<input type="hidden" name="page" value=${pageMaker.cri.page }>
		<input type="hidden" name="perPageNum"
			value=${pageMaker.cri.perPageNum }>
		<div class="box-body" align="right">
			<select name="searchType">
				<option value="x"
					${cri.searchType == null or cri.searchType == "x"?"selected='selected'":"" }>&nbsp;&nbsp;▼
					Check ▼</option>
				<option value="n" ${cri.searchType == "n"?"selected='selected'":"" }>상품명</option>
				<option value="m" ${cri.searchType == "m"?"selected='selected'":"" }>제조사</option>
				<option value="o" ${cri.searchType == "o"?"selected='selected'":"" }>원산지</option>
				<option value="mno"
					${cri.searchType == "mno"?"selected='selected'":"" }>전체</option>
			</select> <input name="keyword" value="${cri.keyword }" />
			<button id="searchBtn" class="btn btn-info">SEARCH</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</form>
	<h1 style="text-align: center; color: silver;">:: 상품 리스트::</h1>
	<fieldset>
		<legend></legend>
	</fieldset>
	<form id="listForm">
		<input id="goods_no" type="hidden" value=${goods.goods_no }> <input
			id="page" type="hidden" value=${cri.page }> <input
			id="perPageNum" type="hidden" value=${cri.perPageNum }>
	</form>
	
	<div  style='display:inline; min-width:1200px;'>
	<div align="center" style='display:inline;float:left;width:600px'>
	<label for="exampleFormControlSelect1" >1차분류</label>
		<select  id="exampleFormControlSelect1" onchange="itemChange()" class="form-control">
		<option>TOP</option>
		<option>OUTER</option>
		<option>BOTTOM</option>
		<option>ACC</option>
		<option>SHOES</option>
		</select>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div style='display:inline;float:left;width:600px' align="center">

		<label >2차분류</label>
		<select id="select2" class="form-control">
		</select>
		</div>
	</div>
	<hr>
	<br>
<!-- 상품 이미지 반복 -->
<br>
	<c:forEach var="goods" items="${list }">
		<div style="border: 1px solid white; float: left; width: 33%;">
		<div class="container">
			<div class="row" >
				<div class="col-sm-4" >
					<div class="panel panel-danger" >
						<div class="panel-heading"> <!-- 타이틀부분 -->
							<div class="info">NO : ${goods.goods_no } &nbsp;&nbsp;&nbsp;
							<a href="/goods/view.do${pageMaker.makeSearch (pageMaker.cri.page)}&goods_no=${goods.goods_no }">${goods.goods_name }</a>
						</div></div>
						<div class="panel-body"> <!-- 이미지 사진 부분 -->
							<img src="https://placehold.it/150x80?text=IMAGE" 	class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">
							<div class="heading">
								<!-- 조회수가 0보다 크면 hit 발생 수정하자 -->
								<c:if test="${goods.goods_hit >= 3}">
									<span class="hit">hit!</span>
								</c:if>
								<!-- 조회수가 0보다 크면 hit 발생 수정하자 -->
							</div>
							<span class="converse"> HIT : ${goods.goods_hit } </span> 
<%-- 							<div class="go-maker">Made in ${goods.goods_maker}</div> --%>
							<div class="price">
								<span class="Ori-price" 	style="font-size: 13px; font-weight: bold; color: #303030;">
									판매가 : <fmt:formatNumber value="${goods.goods_price }"
										pattern="" /> 원	</span ><br />
								<c:if test="${!empty goods.goods_dc }">
									<span class="dis-price" style="color: red;">할인가 : <fmt:formatNumber
											value="${goods.goods_price-(goods.goods_price/goods.goods_dc) }" pattern="" /> 원
									</span>
								</c:if>
							</div><!-- 가격 끝 -->
						</div><!-- footer 끝 -->
					</div><!-- 판넬 끝 -->
				</div>
			</div>
		</div>
		</div>
	</c:forEach>

	<table class="table">
		<tbody>
			<tr>
				<td colspan="5">
					<div class="text-center">
						<ul class="pagination">
							<!-- 이전 페이지 처리 -->
							<c:if test="${pageMaker.prev }">
								<li><a href="goodsList.do?page=${pageMaker.startPage -1 }">&laquo;</a></li>
							</c:if>

							<!-- 시작 페이지부터 끝 페이지까지 반복 처리 -->
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage}" var="idx">
								<li ${pageMaker.cri.page==idx?"class='active'":"" }><a
									href="goodsList.do${pageMaker.makeQuery(idx) }">${idx }</a></li>
							</c:forEach>

							<!-- 다음 페이지 처리 -->
							<c:if test="${pageMaker.next }">
								<li><a href="goodsList.do?page=${pageMaker.endPage + 1 }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>