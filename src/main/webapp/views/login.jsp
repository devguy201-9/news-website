<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
			<c:if test="${not empty message }">
				<div class="alert alert-${alert }" style="text-align: center;">
					<strong>${message }</strong>
				</div>
			</c:if>
				<form class="login100-form validate-form flex-sb flex-w"
					action='<c:url value='/dang-nhap'/> ' id="formLogin" method="POST">
					<span class="login100-form-title p-b-51">
						Đăng nhập tài khoản
					</span>
					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Username is required">
						<input class="input100" type="text" placeholder="Tên đăng nhập"
							name="userName"> <span class="focus-input100"></span>
					</div>


					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Password is required">
						<input class="input100" type="password" placeholder="Mật khẩu"
							name="password"> <span class="focus-input100"></span>
					</div>
					<input type="hidden" value="login" id="action" name="action">
					<div class="container-login100-form-btn m-t-17">
						<input type="hidden" value="login" name="action">
						<button type="submit" class="login100-form-btn">Đăng nhập
						</button>
					</div>
				</form>
				<div style="text-align: center; padding-top:40xp;">
					<p class="text-center" style="font-size: 18px; margin:20px">Bạn chưa có tài khoản ? <a href="<c:url value="/dang-ki?action=registration" />" style="font-size: 18px;">Đăng kí</a> </p>
				</div>
				<div style="text-align: center; margin-bottom: 20px;">
					<a style="font-size: 18px;" href="<c:url value="/trang-chu?page=1&maxPageItem=9" />"><i class="fa fa-home" aria-hidden="true"></i> Quay lại trang chủ</a>
				</div>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>
</body>
</html>