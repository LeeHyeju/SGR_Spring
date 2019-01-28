<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 이영환 -->
<!-- 작성일 : 2018-11-14 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator" 	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- title을 개별 jsp에 있는 title로 적용한다. -->
<title>SGR::<decorator:title /></title>

<!-- jQuery, BootStrap 웹 라이브러리를 등록 했으므로 url 적용되는 개별 jsp에 등록 금지 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel = "stylesheet" href = "/resources/main/AdminLTE.css">
<link href="/resources/main/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
header, footer {
	background: AntiqueWhite;
}

li {
	color: gray;
	list-style-type: none;
}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

#nav {
	border: 1px solid #ccc;
	border-width: 1px 0;
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

#nav li {
	display: inline;
}

#nav a {
	display: inline-block;
	padding: 10px;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

article {
	min-height: 795px;
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<!-- 개별 jsp의 head 태그안에 있는 css, js를 넣어준다. -->
<decorator:head />
</head>
<body>
	<header>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="../main/main.do">:::S G R:::</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
<%-- 						<c:if test="${!empty login }"> --%>
							<li><a class="navbar-brand" href="../qna/qnaList.do">Q&A</a></li>
						<li><a class="navbar-brand" href="../admin/listPage.ad">Review</a></li>
<%-- 							</c:if> --%>
					</ul>
					<!-- 오른쪽에 위치하는 메뉴바 -->
					<ul class="nav navbar-nav navbar-right">
						<!-- 로그인을 안한 경우의 메뉴 -->
						<c:if test="${empty login }">
							<li><a href="../member/join.do"><span
									class="glyphicon glyphicon-user"></span> 회원가입</a></li>
							<li><a href="../member/login.do"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:if>
						<!-- 로그인이 된 경우 -->
						<c:if test="${!empty login }">
							<c:choose>
								<c:when test="${login.mb_id == 'admin'}">
									<div class="top_right_part"
										style="margin-right: 100px; margin-top: 20px">
										<ul class="nav navbar-nav">
											<li>${login.mb_id}님환영합니다.</li>
											<li><a href="../member/view.do">MyPage</a></li>
											<li class="dropdown"><a class="dropdown-toggle"
												data-toggle="dropdown" href="#">AdminPage <span
													class="caret"></span>
											</a>
												<ul class="dropdown-menu" role="menu"
													aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem"
														tabindex="-1" href="../admin/listPage.ad">회원 리스트</a></li>
													<li role="presentation"><a role="menuitem"
														tabindex="-1" href="../category/cateList.ad">카테고리 리스트</a></li>
													<li role="presentation"><a role="menuitem"
														tabindex="-1" href="../goods/adminList.ad">상품 관리 리스트</a></li>
													<li role="presentation"><a role="menuitem"
														tabindex="-1" href="#">이벤트 등록</a></li>
													<li role="presentation"><a role="menuitem"
														tabindex="-1" href="#">결제 리스트</a></li>
												</ul></li>
											<li><a href="../member/logout.do"
												class="glyphicon glyphicon-log-in">Logout</a></li>
										</ul>
									</div>
								</c:when>
								<c:otherwise>
									<div class="top_right_part"
										style="margin-right: 100px; margin-top: 20px">
										<ul class="nav navbar-nav">
											<li>${login.mb_id}님환영합니다.</li>
											<li class="dropdown"><a class="dropdown-toggle"
												data-toggle="dropdown" href="#">MyPage <span
													class="caret"></span>
											</a>
												<ul class="dropdown-menu" role="menu"
													aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem"
														tabindex="-1" href="../member/view.do">내 정보 보기</a></li>
													<li role="presentation"><a role="menuitem"
														tabindex="-1" href="#">주문/결제 리스트</a></li>
													<li role="presentation"><a role="menuitem"
														tabindex="-1" href="#">장바구니</a></li>
												</ul></li>
											<li><a href="../member/logout.do"> <span
													class="glyphicon glyphicon-log-in"></span> Logout
											</a></li>
										</ul>
									</div>
								</c:otherwise>
							</c:choose>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<article>
		<decorator:body />
	</article>
	
	<footer class="container-fluid text-center" style="float:left;">
		<p>COMPANY : (주)SGR OWNER : 이혜주 BUSINESS LICENSE : 123-45-67890
			MALL-ORDER LICENSE : 제2018-서울구로-00123호 ADDRESS : 12345 서울특별시 구로구 구로동
			123-45 1층 TEL : 032-123-4567 COPYRIGHT © (주)SGR ALL RIGHTS RESERVED.
			HOSTING By SGRCo. | DESIGNED By SGRCo.</p>
	</footer>
</body>
</html>