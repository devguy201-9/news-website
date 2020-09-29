<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>

    <!-- css -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css/bootstrap.min.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css/owl.carousel.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css/owl.theme.default.css' />" />
	<link rel="stylesheet" href="<c:url value='/template/web/css/font-awesome.min.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css/style.css' />" />
	<script src="<c:url value='/template/web/jquery.min.js' />"></script>
	<script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>

</head>
<body class="no-skin">
	<!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->
   
   	<dec:body/>

	<!-- footer -->
	<%@ include file="/common/web/footer.jsp" %>
	<!-- footer -->
	
    <script src="<c:url value='/template/web/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/template/web/js/owl.carousel.min.js' />"></script>
    <script src="<c:url value='/template/web/js/main.js' />"></script>
</body>
</html>