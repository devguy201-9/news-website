<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/api-admin-comment"/>
<c:url var="CommentUrl" value="/admin-comment"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách comment</title>
</head>

<body>
	<div class="main-content">
		<form action='<c:url value='${CommentUrl }'/> ' id="formSubmit"
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
													<th>Tiêu đề bài viết</th>
													<th>Số lượng comment của bài viết</th>
													<th>Số lượng tài khoản comment bài viết</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<th><input type="checkbox" id="checkbox_${item.newId}" value="${item.newId}"></th>
														<td>${item.titleNew}</td>
														<td>${item.count[0]}</td>
														<td>${item.count[1]}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page" />
										<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
										<input type="hidden" value="" id="sortName" name="sortName" />
										<input type="hidden" value="" id="sortBy" name="sortBy" />
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
						$('#sortName').val('new_id');
						$('#sortBy').val('desc');
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
					window.location.href="${CommentUrl}?maxPageItem=4&page=1&message=delete_error";	
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
            	window.location.href="${CommentUrl}?maxPageItem=4&page=1&message=delete_success";
            },
            error: function (error) {
            	window.location.href="${CommentUrl}?maxPageItem=4&page=1&message=error_system";
            }
        	});
    	}
	</script>
</body>

</html>