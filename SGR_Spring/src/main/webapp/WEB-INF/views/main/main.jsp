<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <script 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
	width : 100%;
}

hr {
border : 0; height : 2px
}
</style>
<!-- 이미지 전체 너비의 70% 정도, 가운데 정렬 -->
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 80%;
    margin: 0 auto; 
	max-height: 500px;
	}
	.item > img{
	margin-left: 0px;
	margin-right: 0px;
	}
	

  </style>
<script type="text/javascript">
	var result = "${message}";
	if (result == "joinOk") {
		alert("WoW! 회원가입이 완료되었습니다.");
	} else if (result == "deleteOk") {
		alert("탈퇴되셨습니다..");
	}
</script>
</head>
<body>
<div>
  <div class="container text-center" >
    <br>
    <h1 style="color: navy; font-weight: 900; font-family:fantasy;">S a G a R a </h1>      
    <p style="color: teal; font">- Women's Shopping Mall - </p>
  <p></p>
  </div>
</div>
  <div>
    <div>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar" >
<ul id="nav"  >
  <li><a href="/goods/goodsList.do">SGR</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li><a href="/goods/goodsList.do?searchType=n&keyword=TOP">TOP</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li><a href="/goods/goodsList.do?searchType=n&keyword=OUTER">OUTER</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li><a href="/goods/goodsList.do?searchType=n&keyword=BOTTOM">BOTTOM</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li><a href="/goods/goodsList.do?searchType=n&keyword=ACC">ACC</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li><a href="/goods/goodsList.do?searchType=n&keyword=SHOES">SHOES</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li><a href="/contact/"><span class="glyphicon glyphicon-picture"></span>PHOTO</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li><a href="/contact/"><span class="glyphicon glyphicon-list-alt"></span>ORDER</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li><a href="/contact/"><span class="glyphicon glyphicon-shopping-cart"></span>CART</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  >
  <button ><span class="glyphicon glyphicon-search"></span>SEARCH</button></li>
</ul>
    </div>
  </div>
<div class="container">
<br/>
<!-- 컨베이어 -->
  <div id="myCarousel" class="carousel slide" data-ride="carousel" > 
    <!-- Indicators : 지시자 - 이미지 위에 클릭할 수 있는 동그라미 표시 -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

   <!-- 메인 슬라이드 이미지 -->
    <div class="carousel-inner" role="listbox">
      <div class="item active" >
        <img src="../resources/main/main01.jpg" alt="테스트" width=100% height=400px;>
      </div>
      <div class="item" style="width:100%; height:100%">
    <img src="../resources/main/main02.jpg" alt="테스트2" width=100% height=400px> 
    </div> 
     <div class="item" style="width:100%; height:100%"> 
         <img src="../resources/main/main03.jpg" alt="테스트3" width=100% height=400px> 
       </div> 
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
<br><br>
</div>
</body>
</html>
