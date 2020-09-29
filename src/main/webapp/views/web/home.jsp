<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Trang chủ</title>
</head>

<body>
	<!-- Owl Carousel 1 -->
	<div id="owl-carousel-1" class="owl-carousel owl-theme center-owl-nav">
	<c:forEach begin="0"  end="4" var="item" items="${model.listResult}">
		
		<!-- ARTICLE -->
		<article class="article thumb-article khung-slide">
			<div class="article-img">
				<img src="<c:url value="${item.thumbnail }" />" alt="">
				<%-- <img src="${pageContext.request.contextPath}/template/web/img/img-lg-1.jpg" alt=""> --%>
			</div>
			<div class="article-body">
				<ul class="article-info">
					<li class="article-category"><a href="#">${item.categoryCode }</a></li>
					<li class="article-type"><i class="fa fa-camera"></i></li>
				</ul>
				<h2 class="article-title"><a href='<c:url value="/detail-new?new_id=${item.id }" />'>${item.title }</a></h2>
				<ul class="article-meta">
					<li><i class="fa fa-clock-o"></i> ${item.createdDate }</li>
					<li><i class="fa fa-comments"></i> ${item.countComment }</li>
				</ul>
			</div>
		</article>
		<!-- /ARTICLE -->
		
	</c:forEach>
	<!-- /Owl Carousel 1 -->
	</div>


	<!-- SECTION -->
	<div class="section">
		<!-- CONTAINER -->
		<div class="container">
			<!-- ROW -->
			<div class="row">
				<!-- Main Column -->
				<div class="col-md-12">
					<div class="row">
						<!-- section title -->
						<div class="col-md-12">
							<div class="section-title">
								<h2 class="title">News</h2>
							</div>
						</div>
						<!-- /section title -->
						<c:forEach var="item" items="${model.listResult}">
							<!-- Column 1 -->
						<div class="col-md-4 col-sm-4 khung-content">
							<!-- ARTICLE -->
							<article class="article">
								<div class="article-img">
									<a href="#">
										<img src="<c:url value="${item.thumbnail }" />" alt="">
										<%-- <img src="${pageContext.request.contextPath}/template/web/img/img-sm-3.jpg" alt=""> --%>
									</a>
									<ul class="article-info">
										<li class="article-type"><i class="fa fa-camera"></i></li>
									</ul>
								</div>
								<div class="article-body">
									<c:url var="NewUrl" value="/detail-new">
										<c:param name="new_id" value="${item.id }"></c:param>
									</c:url>
									<h3 class="article-title"><a href='${NewUrl }'>${item.title}</a></h3>
									<ul class="article-meta">
										<li><i class="fa fa-clock-o"></i>${item.createdDate}</li>
										<li><i class="fa fa-comments"></i> ${item.countComment}</li>
									</ul>
									<p>${item.shortDescription}</p>
								</div>
							</article>
							<!-- /ARTICLE -->
						</div>
						<!-- /Column 1 -->
						</c:forEach>
					</div>
				</div>
				<!-- /ROW -->
			</div>
			<!-- /CONTAINER -->
		</div>
		<!-- /SECTION -->
	</div>
	
	<form action="<c:url value='/trang-chu'/>" id="formSubmit" method="GET">
		<div style="width:600px ; margin-left:auto; margin-right:auto;">
			<ul class="pagination" id="pagination"></ul>
		</div>
		<input type="hidden" value="" id="page" name="page" />
		<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
	</form>
	
	<!-- SECTION -->
	<div class="section">
		<!-- CONTAINER -->
		<div class="container">
			<!-- ROW -->
			<div class="row">
				<!-- Main Column -->
				<div class="col-md-12">
					<!-- section title -->
					<div class="section-title">
						<h2 class="title">Popular Video</h2>
					</div>
					<!-- /section title -->

					<!-- owl carousel 2 -->
					<div id="owl-carousel-2" class="owl-carousel owl-theme">
						<!-- ARTICLE -->
						<article class="article thumb-article khung-video">
							<div class="article-img">
								<img src="https://i.ytimg.com/vi/eDfVhlX1UJk/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLD7_uhyBpuzD4A79Vf1oLfnwJ3WIw" alt="">
							</div>
							<div class="article-body">
								<ul class="article-info">
									<li class="article-type"><i class="fa fa-video-camera"></i></li>
								</ul>
								<h3 class="article-title"><a href="https://www.youtube.com/embed/eDfVhlX1UJk">Thời sự Chào buổi tối 24/8/2020: Vì sao tên trộm 350 cây vàng trị giá 13 tỷ bị bại lộ? | VTC Now</a>
								</h3>
							</div>
						</article>
						<!-- /ARTICLE -->

						<!-- ARTICLE -->
						<article class="article thumb-article khung-video">
							<div class="article-img">
								<img src="https://i.ytimg.com/vi/r8zH_hv28bw/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLB37kLtRVGHPkKzf9CZuhRCQMIcxA" alt="">
							</div>
							<div class="article-body">
								<ul class="article-info">
									<li class="article-type"><i class="fa fa-video-camera"></i></li>
								</ul>
								<h3 class="article-title"><a href="https://www.youtube.com/embed/r8zH_hv28bw">60 Giây Sáng - Ngày 23/08/2020 - HTV Tin Tức Mới Nhấ</a>
								</h3>

							</div>
						</article>
						<!-- /ARTICLE -->

						<!-- ARTICLE -->
						<article class="article thumb-article khung-video">
							<div class="article-img">
								<img src="https://i.ytimg.com/vi/MrAktgYeias/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLAQSRKkgJdd2GPziXUuYPXgEisrKQ" alt="">
							</div>
							<div class="article-body">
								<ul class="article-info">
									<li class="article-type"><i class="fa fa-video-camera"></i></li>
								</ul>
								<h3 class="article-title"><a href="https://www.youtube.com/embed/MrAktgYeias">Tin tức | Chào buổi sáng | Tin tức Việt Nam mới nhất hôm nay| TT24h</a>
								</h3>
							</div>
						</article>
						<!-- /ARTICLE -->
					</div>
					<!-- /owl carousel 2 -->
				</div>
				<!-- /Main Column -->
			</div>
			<!-- /ROW -->
		</div>
		<!-- /CONTAINER -->
	</div>
	<!-- /SECTION -->
	
	<script type="text/javascript">
		$(function() {
			var totalPages = ${model.totalPage};
			var currentPage = ${model.page};
			var limit = 9;
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
	</script>
</body>
</html>