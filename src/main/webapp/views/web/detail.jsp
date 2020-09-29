<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/api-admin-comment?new_id=${model.id }"/>
<c:url var="APIurlDel" value="/api-admin-comment"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết bài viết</title>
</head>
<body>
	<!-- SECTION -->
	<div class="section">
		<!-- CONTAINER -->
		<div class="container">
			<!-- ROW -->
			<div class="row">
				<!-- Main Column -->
				<div class="col-md-9">
					<!-- ARTICLE POST -->
					<article class="article article-post">
						<div class="article-main-img">
							<img src="${model.thumbnail}" alt="">
						</div>
						<div class="article-body khung-body">
							<ul class="article-info">
								<li class="article-type"><i class="fa fa-file-text"></i></li>
							</ul>
							<h1 class="article-title">${model.title }</h1>
							<ul class="article-meta">
								<li><i class="fa fa-clock-o"></i>${model.createdDate }</li>
								<li><i class="fa fa-comments"></i> ${comment.count[0] }</li>
							</ul>
							${model.content }
						</div>
					</article>
					<!-- /ARTICLE POST -->
					<!-- article comments -->
					<div class="article-comments">
						<div class="section-title">
							<h2 class="title">Comments</h2>
						</div>
						<c:forEach var="item" items="${comment.listResult}">
							<!-- comment -->
							<div class="media">
								<div class="media-body">
									<div class="media-heading">
										<h5>${item.userComment}
										<c:if test="${not empty item.roleUser }">
											<span style="border: 0.3px solid black;"> ${item.roleUser }</span>
										</c:if>
										  <span class="reply-time">${item.createdDate }</span></h5>
									</div>
									<p>${item.content }</p>
									<a href="" class="btn-delete" id="deleteComment_${item.id}">Xóa bình luận</a>
									<input type="hidden" value="${item.id}" id="id" name="id" />
									<input type="hidden" value="${item.userId}" id=userId name="userId" />
								</div>
							</div>
							<!-- /comment -->
						</c:forEach>
						
					</div>
					<!-- /article comments -->

					<!-- reply form -->
					<div class="article-reply-form">
						<div class="section-title">
							<h2 class="title">Thêm bình luận cho bài viết</h2>
						</div>
						<form id="formComment">
							<textarea name="content" class="input" placeholder="Nhập nội dung"></textarea>
							<input type="button" class="input-btn" id="addComment" value="Bình luận"/>
						</form>
					</div>
					<!-- /reply form -->
				</div>
				<!-- /Main Column -->
			</div>
			<!-- /ROW -->
		</div>
		<!-- /CONTAINER -->
	</div>
	<!-- /SECTION -->
	
	<script>
	var idDel = '#deleteComment_'+$('#id').val();
		$('#addComment').click(function(e){
			e.preventDefault();
	        var data = {};
	        var formData = $('#formComment').serializeArray();
	        $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
	        addComment(data);
		});
		$('idDel').click(function(e){
			$('idDel').click(function(e){
				e.preventDefault();
		        var data = {};
		        var id = $('#id').val();
		        var userId = $('#userId').val();
		        data["id"] = id;
		        data["userId"] = userId;
		        deleteComment(data);
			});
		});
		function addComment(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href="/detail-new?new_id=${model.id}";
	            },
	            error: function (error) {
	            	window.location.href="/detail-new?new_id=${model.id}";
	            }
	        });
	    }
		function deleteComment(data) {
	        $.ajax({
	            url: '${APIurlDel}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	window.location.href="/detail-new?new_id=${model.id}";
	            },
	            error: function (error) {
	            	window.location.href="/detail-new?new_id=${model.id}";
	            }
	        	});
	    	}
	</script>
</body>
</html>