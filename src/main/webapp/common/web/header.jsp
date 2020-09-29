<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
	<header id="header">
		<!-- Center Header -->
		<div id="center-header">
			<div class="container">
				<div class="header-logo">
					<a href="#" class="logo"><img src="<c:url value='/template/web/img/logo.png' />" alt=""></a>
				</div>
				<div class="header-ads">
					<img class="center-block" src="<c:url value='/template/web/img/ad-2.jpg' />" alt="">
				</div>
			</div>
		</div>
		<!-- /Center Header -->

		<!-- Nav Header -->
		<div id="nav-header">
			<div class="container">
				<nav id="main-nav">
					<div class="nav-logo">
						<a href="#" class="logo"><img src="<c:url value='/template/web/img/logo-alt.png' />" alt=""></a>
					</div>
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="<c:url value="/trang-chu?page=1&maxPageItem=9" />">Home</a></li>
						<c:forEach var="item" items="${categories}">
							<li><a href="/trang-chu?page=1&maxPageItem=9&categoryid=${item.id }">${item.name }</a></li>
						</c:forEach>
					</ul>
				</nav>
				<div class="button-nav">
					<button class="search-collapse-btn">
						<i class="fa fa-search"></i>
					</button>
					<button class="nav-collapse-btn">
						<i class="fa fa-bars"></i>
					</button>
					<div class="search-form">
						<form>
							<input class="input" type="text" name="search" placeholder="Search">
						</form>
					</div>
				</div>
				<c:if test="${not empty USERMODEL}">
					<div class="button-nav">
						<a href="<c:url value="/admin-home"/>"> <div class="login">Trang quản trị</div></a>
					</div>
					<div class="button-nav">
						<a href="<c:url value="/thoat?action=logout"/>"> <div class="login">Đăng xuất</div></a>
					</div>
					<div class="button-nav">
						<a href="<c:url value="/account-info" />"><div class="login">Wellcom, ${USERMODEL.userName}</div></a>
					</div>
				</c:if>
				<c:if test="${empty USERMODEL}">
					<div class="button-nav">
						<a href="<c:url value="/dang-ki?action=registration"/>"><div class="login">Đăng ký</div></a>
					</div>
					<div class="button-nav">
						<a href="<c:url value="/dang-nhap?action=login"/>"> <div class="login">Đăng nhập</div></a>
					</div>
				</c:if>
		</div>
		</div>
		<!-- /Nav Header -->
	</header>