<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="<c:url value="/trang-chu?page=1&maxPageItem=9" />" class="navbar-brand">
                <small>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    Trang chủ
                </small>
            </a>
        </div>
        <div class="navbar-header pull-left">
            <a href="<c:url value="/admin-home" />" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    Trang quản trị
                </small>
            </a>
        </div>
        <div class="navbar-buttons navbar-header pull-right collapse navbar-collapse" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue dropdown-modal">
                    <a href="<c:url value="/account-info" />">
                        Xin chào, ${USERMODEL.userName }
                    </a>
                    <li class="light-blue dropdown-modal">
                        <a href='<c:url value="/thoat?action=logout"/>'>
                            <i class="ace-icon fa fa-power-off"></i>
                            Đăng xuất
                        </a>
                    </li>
                </li>
            </ul>
        </div>
    </div>
</div>
