<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng kí</title>
</head>
<body>
	<div class="container" style="margin-top: 100px; width: 800px;">
		<div class="card bg-light" style="border: 1px solid black;">
			<article class="card-body mx-auto" style="max-width: 900px;">
				<h4 class="card-title mt-3 text-center">Tạo tài khoản người dùng</h4>
				<c:if test="${not empty messageResponse}">
					<div class="alert alert-${alert }" style="text-align: center;">
						<strong>${messageResponse }</strong>
					</div>
				</c:if>
				<form style="width: 400px;" action='<c:url value="/api-admin-account"/>' id="formRegistration" method="POST">
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i> </span>
						</div>
						<input name="userName" type="text" class="form-control" placeholder="Tên đăng nhập">
					</div> <!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i> </span>
						</div>
						<input name="fullName" class="form-control" placeholder="Họ tên đầy đủ" type="text">
					</div> <!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i> </span>
						</div>
						<input name="password" class="form-control" placeholder="Tạo mật khẩu" type="password">
					</div> <!-- form-group// -->
					<div class="form-group">
						<input type="hidden" value="registration" name="action">
						<button type="submit" class="btn btn-primary btn-block">Tạo tài khoản</button>
					</div> <!-- form-group// -->
					<input type="hidden" value="1" id="status" name="status" />
					<p class="text-center">Bạn đã có tài khoản ? <a href="<c:url value="/dang-nhap?action=login" />">Đăng nhập</a> </p>
					<p class="text-center"><a href="<c:url value="/trang-chu?page=1&maxPageItem=9" />"><i class="fa fa-home" aria-hidden="true"></i> Quay lại trang chủ</a> </p>
				</form>
			</article>
		</div> <!-- card.// -->

	</div>
	<!--container end.//-->
</body>
</html>