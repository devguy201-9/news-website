<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/api-admin-account"/>
<c:url var="AccountUrl" value="/admin-account"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách tài khoản</title>
</head>

<body>
	<div class="main-content">
		<form action='<c:url value='${AccountUrl }'/> ' id="formSubmit"
			method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="<c:url value="/admin-home" />">Trang chủ</a>
						</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm tài khoản'
												href='<c:url value="/dang-ki?action=registration"/>'> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											<button id="btnDelete" type="button"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Xóa tài khoản'>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
								<c:if test="${not empty messageResponse}">
									<div class="alert alert-${alert}">
  										${messageResponse}
									</div>
								</c:if>
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th><input type="checkbox" id="checkAll"></th>
													<th>Tên tài khoản</th>
													<th>Họ và tên tài khoản người dùng</th>
													<th>Chức năng tài khoản</th>
													<th>Trạng thái tài khoản</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<th><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></th>
														<td>${item.userName}</td>
														<td>${item.fullName}</td>
														<td>${item.role.name}</td>
														<td>
															<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
															   title="Trạng thái hoạt động" href='${editUrl }'> <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
															</a>
														</td>
														<td>
															<c:url var="editUrl" value="/account-info">
																<c:param name="type" value="edit"></c:param>
																<c:param name="id" value="${item.id }"></c:param>
															</c:url>
															<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
															   title="Cập nhật tài khoản" href='${editUrl }'> <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
															</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page" />
										<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
										<input type="hidden" value="" id="sortName" name="sortName" />
										<input type="hidden" value="" id="sortBy" name="sortBy" />
										<input type="hidden" value="" id="type" name="type" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		</div>
		<div class="popup_box">
	      <h1>Xác nhận tác vụ</h1>
	      <label>Bạn có chắc muốn xóa</label>
	      <div class="btns">
	        <a href="#" class="btn2">Xóa</a>
	        <a href="#" class="btn1">Hủy</a>
	      </div>
	    </div>
	<!-- /.main-content -->
	<script type="text/javascript">
		$(function() {
			var totalPages = ${model.totalPage};
			var currentPage = ${model.page};
			var limit = 4;
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#sortName').val('userName');
						$('#sortBy').val('desc');
						$('#type').val('list');
						$('#formSubmit').submit();
					}
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
		$("#checkAll").click(function() {
		    $("input[type=checkbox]").prop("checked", $(this).prop("checked"));
		});

		$("input[type=checkbox]").click(function() {
		    if (!$(this).prop("checked")) {
		        $("#checkAll").prop("checked", false);
		    }
		});
		$('#btnDelete').click(function() {
			$('.popup_box').css("display", "block");
        	$('.btn1').click(function(){
        		$('.popup_box').css("display", "none");
        	});
        	$('.btn2').click(function(){
          		$('.popup_box').css("display", "none");
          		var data={};
				var ids = $('tbody input[type=checkbox]:checked').map(function(){
					return $(this).val();
				}).get();
				if(ids.length != 0){
					data['ids']=ids;
					deleteNew(data);
				}else{
					window.location.href="${AccountUrl}?maxPageItem=4&page=1&type=list&message=delete_error";	
				}
        	});
		});
		function deleteNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	window.location.href="${AccountUrl}?maxPageItem=4&page=1&type=list&message=delete_success";
            },
            error: function (error) {
            	window.location.href="${AccountUrl}?maxPageItem=4&page=1&type=list&message=error_system";
            }
        	});
    	}
	</script>
</body>

</html>