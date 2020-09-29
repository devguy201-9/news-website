<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-account"/>
<c:url var="AccountUrl" value="/account-info"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa tài khoản</title>
</head>
<body>	
	<div class="container">
		<div class="row flex-lg-nowrap">
			<div class="col">
				<div class="row">
					<div class="col mb-3">
						<div class="card">
							<div class="card-body">
							<c:if test="${not empty messageResponse}">
									<div class="alert alert-${alert}">
  										${messageResponse}
									</div>
							</c:if>
							<c:if test="${not empty model }">
								<div class="e-profile">
									<div class="row">
										<div
											class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
											<div class="text-center text-sm-left mb-2 mb-sm-0">
												<h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">Hồ sơ: ${model.fullName }</h4>
												<p class="mb-0">${model.userName }</p>
											</div>
											<div class="text-center text-sm-right">
												<span class="badge badge-secondary">Chức năng tài khoản: ${model.role.name }</span>
												<div class="text-muted">
													<small>Ngày tạo: ${model.createdDate}</small>
												</div>
												<div class="text-muted">
													<small>Người tạo: ${model.createdBy}</small>
												</div>
												<div class="text-muted">
													<small>Ngày sửa: ${model.modifiedDate}</small>
												</div>
											</div>
										</div>
									</div>
									<ul class="nav nav-tabs">
										<li class="nav-item"><a href="" class="active nav-link">Settings</a>
										</li>
									</ul>
									<div class="tab-content pt-3">
										<div class="tab-pane active">
											<form class="form" id="formAccountEdit">
												<div class="row">
													<div class="col">
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Họ và tên đầy đủ</label> <input
																		class="form-control" type="text" name="fullName"
																		value="${model.fullName }">
																</div>
															</div>
															<div class="col">
																<div class="form-group">
																	<label>Tên tài khoản</label> <input
																		class="form-control" type="text" name="userName"
																		value="${model.userName }">
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-6 mb-3">
														<div class="mb-2">
															<b>Đổi mật khẩu</b>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Mật khẩu hiện tại</label> <input
																		class="form-control" type="text" disabled
																		placeholder="${model.password }">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Nhập mật khẩu mới</label> <input
																		class="form-control" type="password"
																		name="password" placeholder="••••••••••••"
																		value="${model.password }">
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col d-flex justify-content-start">
														<input type="button" class="btn btn-white btn-danger" id="btnDelete" value="Xóa tài khoản"/>
													</div>
													<div class="col d-flex justify-content-end">
														<button class="btn btn-primary" type="button" onclick="window.location.href='<c:url value="/admin-account?maxPageItem=4&page=1&type=list"/>';">Trở về trang chủ</button>
													</div>
													<div class="col d-flex justify-content-end">
														<input type="button" class="btn btn-white btn-primary btn-bold" id="btnUpdate" value="Lưu lại"/>
													</div>
												</div>
											</form>
											<input type="hidden" value="${model.id}" id="id" name="id" />
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${empty model }">
								<div class="e-profile">
									<div class="row">
										<div
											class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
											<div class="text-center text-sm-left mb-2 mb-sm-0">
												<h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">Hồ sơ: ${USERMODEL.fullName }</h4>
												<p class="mb-0">${USERMODEL.userName }</p>
											</div>
											<div class="text-center text-sm-right">
												<span class="badge badge-secondary">Chức năng tài khoản: ${USERMODEL.role.name }</span>
												<div class="text-muted">
													<small>Ngày tạo: ${USERMODEL.createdDate}</small>
												</div>
												<div class="text-muted">
													<small>Ngày sửa: ${USERMODEL.modifiedDate}</small>
												</div>
												<div class="text-muted">
													<small>Người tạo: ${USERMODEL.createdBy}</small>
												</div>
											</div>
										</div>
									</div>
									<ul class="nav nav-tabs">
										<li class="nav-item"><a href="" class="active nav-link">Settings</a>
										</li>
									</ul>
									<div class="tab-content pt-3">
										<div class="tab-pane active">
											<form class="form" id="formAccountEdit">
												<div class="row">
													<div class="col">
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Họ và tên đầy đủ</label> <input
																		class="form-control" type="text" name="fullName"
																		value="${USERMODEL.fullName }">
																</div>
															</div>
															<div class="col">
																<div class="form-group">
																	<label>Tên tài khoản</label> <input
																		class="form-control" type="text" name="userName"
																		value="${USERMODEL.userName }">
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-6 mb-3">
														<div class="mb-2">
															<b>Đổi mật khẩu</b>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Mật khẩu hiện tại</label> <input
																		class="form-control" type="text" disabled
																		placeholder="${USERMODEL.password }">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Nhập mật khẩu mới</label> <input
																		class="form-control" type="password"
																		name="password" placeholder="••••••••••••"
																		value="${USERMODEL.password }">
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col d-flex justify-content-start">
														<input type="button" class="btn btn-white btn-danger" id="btnDelete" value="Xóa tài khoản"/>
													</div>
													<div class="col d-flex justify-content-end">
														<button class="btn btn-primary" type="button" onclick="window.location.href='<c:url value="/trang-chu?page=1&maxPageItem=9"/>';">Trở về trang chủ</button>
													</div>
													<div class="col d-flex justify-content-end">
														<input type="button" class="btn btn-white btn-primary btn-bold" id="btnUpdate" value="Lưu lại"/>
													</div>
												</div>
											</form>
											<input type="hidden" value="${USERMODEL.id}" id="id" name="id" />
										</div>
									</div>
								</div>
							</c:if>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-3 mb-3">
						<div class="card mb-3">
							<div class="card-body">
								<div class="px-xl-3">
									<button class="btn btn-block btn-secondary">
										<i class="fa fa-sign-out"></i> <a href="<c:url value="/thoat?action=logout"/>" style="text-decoration:none; color:white;">Đăng xuất</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="popup_box">
      <h1>Xác nhận tác vụ</h1>
      <label>Bạn có chắc muốn xóa</label>
      <div class="btns">
        <a href="#" class="btn2">Xóa</a>
        <a href="#" class="btn1">Hủy</a>
      </div>
    </div>
	<script>
		$('#btnUpdate').click(function (e) {
	        e.preventDefault();
	        var data = {};
	        var formData = $('#formAccountEdit').serializeArray();
	        $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
	        var id = $('#id').val();
	        data["id"] =id ;
	        updateNew(data);
	    });
		function updateNew(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href="${AccountUrl}?&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href="${AccountUrl}?message=error_system";
	            }
	    	});
		}
		$('#btnDelete').click(function() {
			$('.popup_box').css("display", "block");
        	$('.btn1').click(function(){
        		$('.popup_box').css("display", "none");
        	});
        	$('.btn2').click(function(){
        		var id = $('#id').val();
    			var data={};
          		$('.popup_box').css("display", "none");
    	        data["id"] =id;
				deleteAccount(data);
        	});
		});
		function deleteAccount(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	window.location.href="/thoat?action=logout";
            },
            error: function (error) {
            	window.location.href="${AccountUrl}?message=error_system";
            }
        	});
    	}
	</script>
</body>
</html>