package com.laptrinhjavaweb.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.CommentModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.HttpUtil;
import com.laptrinhjavaweb.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-admin-comment"})
public class CommentAPI extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ICommentService commentService;
	@Inject
	private IUserService userService;
	
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		String new_id = request.getParameter("new_id");
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
		CommentModel commentModel = HttpUtil.of(request.getReader()).toModel(CommentModel.class);
		commentModel.setNewId(Long.parseLong(new_id));
		commentModel.setUserId(user.getId());
		commentModel.setCreatedBy(user.getUserName());
		commentService.save(commentModel);
		mapper.writeValue(response.getOutputStream(), commentModel);
	}
	
	
	protected void doPut(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		
	}
	
	
	protected void doDelete(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CommentModel commentModel = HttpUtil.of(request.getReader()).toModel(CommentModel.class);
		UserModel currentModel = (UserModel)(SessionUtil.getInstance().getValue(request, "USERMODEL"));
		if(commentModel.getId() != null && currentModel != null) {
				String userName =  (userService.findOne(commentModel.getUserId()).getUserName());
				if(userName.equals(currentModel.getUserName())) {
					commentService.delete(commentModel.getId());
				}
		}else {
			commentService.deleteByNewId(commentModel.getIds());
		}
		mapper.writeValue(response.getOutputStream(), "{ }");
	}
}
