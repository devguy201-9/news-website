package com.laptrinhjavaweb.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.FormUtil;
import com.laptrinhjavaweb.utils.HttpUtil;
import com.laptrinhjavaweb.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-admin-account"})
public class AccountAPI extends HttpServlet {

	/**
	 * 
	 */
	
	@Inject
	private IUserService userService;
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel = FormUtil.toModel(UserModel.class, request);
		if(StringUtils.isBlank(userModel.getUserName()) || StringUtils.isBlank(userModel.getFullName()) || StringUtils.isBlank(userModel.getPassword()) ) {
			response.sendRedirect(request.getContextPath()+"/dang-ki?action=registration&message=fill_not_enough&alert=danger");
		}else {
			UserModel checkUserName = userService.findByUserName(userModel.getUserName());
			if(checkUserName != null) { response.sendRedirect(request.getContextPath()+"/dang-ki?action=registration&message=account_existed&alert=danger"); }
			else {
				UserModel currentModel = (UserModel)(SessionUtil.getInstance().getValue(request, "USERMODEL"));
				if(currentModel != null) {
					userModel.setRoleCode((currentModel.getRole().getCode().equals(SystemConstant.ADMIN) ? SystemConstant.ADMIN : SystemConstant.USER));
					userModel.setCreatedBy(currentModel.getUserName());
				}else {
					userModel.setCreatedBy("");
					userModel.setRoleCode(SystemConstant.USER);
				}
				userModel = userService.save(userModel);
				response.sendRedirect(request.getContextPath()+"/dang-nhap?action=login&message=registration_success&alert=success");
			}
		}
	}
	
	
	protected void doPut(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel updateUser = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		updateUser.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
		updateUser.setStatus(1);
		updateUser = userService.update(updateUser);
		mapper.writeValue(response.getOutputStream(), updateUser);
	}
	
	
	protected void doDelete(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		if(userModel.getId() != null) {
			long[] ids = new long[1];
			ids[0] = userModel.getId().longValue();
			userModel.setIds(ids);
		}
		userService.delete(userModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{ }");
	}

}
