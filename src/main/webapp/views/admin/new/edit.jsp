<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var="NewUrl" value="/admin-new"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <c:url var="newUrl" value="/admin-new">
                		<c:param name="page" value="1"></c:param>
                		<c:param name="maxPageItem" value="4"></c:param>
                		<c:param name="sortName" value="title"></c:param>
                		<c:param name="sortBy" value="desc"></c:param>
                		<c:param name="type" value="list"></c:param>
                	</c:url>
                    <a href="${newUrl }">Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa bài viết</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                        <c:if test="${not empty messageResponse}">
									<div class="alert alert-${alert}">
  										${messageResponse}
									</div>
						</c:if>
                        <form id="formSubmit">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="categoryCode" name="categoryCode">
                                    	<c:if test="${empty model.categoryCode }">
                                    		<option value="">Chọn thể loại bài viết</option>
									    	<c:forEach var="item" items="${categories}">
									    		<option value="${item.code }">${item.name }</option>
									    	</c:forEach>
                                    	</c:if>
									    <c:if test="${not empty model.categoryCode }">
									    	<c:forEach var="item" items="${categories}">
									    		<option value="">Chọn thể loại bài viết</option>
									    		<option value="${item.code }" 
									    			<c:if test="${item.code  == model.categoryCode}">selected="selected"</c:if>>
									    			${item.name }
									    		</option>
									    	</c:forEach>
                                    	</c:if>
									  </select>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="title" name="title" value="${model.title }"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="thumbnail" name="thumbnail" value="${model.thumbnail }"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="shortDescription" name="shortDescription" value="${model.shortDescription }"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                                <div class="col-sm-9">                                 
                                    <%-- <input type="text" class="form-control" id="content" name="content" value="${model.content }"/> --%>
                                	<textarea rows="" cols="" id="content" name="content" style="width: 750px; height: 153px;">${model.content }</textarea>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <div class="col-sm-12">
                                	<c:if test="${not empty model.id }">
                                		<input type="button" class="btn btn-white btn-primary btn-bold" id="btnAddOrUpdateNew" value="Cập nhật bài viết"/>
                                	</c:if>                                 
                                	<c:if test="${empty model.id }">
                                		<input type="button" class="btn btn-white btn-primary btn-bold" id="btnAddOrUpdateNew" value="Thêm bài viết"/>
                                	</c:if>
                                	<a href="${newUrl }"><input type="button" class="btn btn-white btn-danger btn-bold" value="Hủy bỏ"/></a>
                                </div>
                            </div>
                        </form>
                        <input type="hidden" value="${model.id}" id="id" name="id" />
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var editor ='';
    $(document).ready(function(){
        editor = CKEDITOR.replace('content');
    });
    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        data["content"]=editor.getData();
        var id = $('#id').val();
        if (id == "") {
            addNew(data);
        } else {
        	data["id"] =id ;
            updateNew(data);
        }
    });
    function addNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href="${NewUrl}?type=edit&id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href="${NewUrl}?maxPageItem=4&page=1&type=list&message=error_system";
            }
        });
    }
    function updateNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href="${NewUrl}?type=edit&id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href="${NewUrl}?maxPageItem=4&page=1&type=list&message=error_system";
            }
        });
    }
</script>
</body>
</html>
