package com.laptrinhjavaweb.controller.admin;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.PageRequest;
import com.laptrinhjavaweb.paging.Pageable;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.sort.Sorter;
import com.laptrinhjavaweb.utils.FormUtil;
import com.laptrinhjavaweb.utils.MessageUtil;

@WebServlet(urlPatterns = { "/account-info","/dang-ki","/admin-account" })
public class AccountController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
	
	@Inject
	private IUserService userService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String view = "";
		view = (action != null && action.equals("registration")) ? "/views/registration.jsp" : "/views/account.jsp";
		if(action == null) {
			try {
				UserModel model = FormUtil.toModel(UserModel.class, request);
				if(model.getType().equals(SystemConstant.LIST)) {
					Pageable pageable = new PageRequest(model.getPage(), model.getMaxPageItem(),
							new Sorter(model.getSortName(), model.getSortBy()));
					model.setListResult(userService.findAll(pageable));
					model.setTotalItem(userService.getTotalItem());
					model.setTotalPage((int) Math.ceil( (double)model.getTotalItem()/model.getMaxPageItem()));
					view="/views/admin/account/list.jsp";
					request.setAttribute(SystemConstant.MODEL, model);
				}else if(model.getType().equals(SystemConstant.EDIT)) {
					if(model.getId() != null) { model = userService.findOne(model.getId()); }
					request.setAttribute(SystemConstant.MODEL, model);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		MessageUtil.showMessage(request);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
