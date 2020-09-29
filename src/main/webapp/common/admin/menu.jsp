<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <ul class="nav nav-list">
        <li >
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Quản lý trang
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li>
                	<c:url var="newUrl" value="/admin-new">
                		<c:param name="page" value="1"></c:param>
                		<c:param name="maxPageItem" value="4"></c:param>
                		<c:param name="sortName" value="title"></c:param>
                		<c:param name="sortBy" value="desc"></c:param>
                		<c:param name="type" value="list"></c:param>
                	</c:url>
                    <a href='${newUrl }'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách bài viết
                    </a>
                    <b class="arrow"></b>
                </li>
                <li>
                	<c:url var="accountUrl" value="/admin-account">
                		<c:param name="page" value="1"></c:param>
                		<c:param name="maxPageItem" value="4"></c:param>
                		<c:param name="sortName" value="userName"></c:param>
                		<c:param name="sortBy" value="desc"></c:param>
                		<c:param name="type" value="list"></c:param>
                	</c:url>
                    <a href='${accountUrl }'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách tài khoản
                    </a>
                    <b class="arrow"></b>
                </li>
                <li>
                	<c:url var="commentUrl" value="/admin-comment">
                		<c:param name="page" value="1"></c:param>
                		<c:param name="maxPageItem" value="4"></c:param>
                		<c:param name="sortName" value="new_id"></c:param>
                		<c:param name="sortBy" value="desc"></c:param>
                	</c:url>
                    <a href='${commentUrl }'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách comment của bài viết
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul>
    <div class="sidebar-toggle sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>