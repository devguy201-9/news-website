package com.laptrinhjavaweb.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.CommentModel;
import com.laptrinhjavaweb.model.NewsModel;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.utils.FormUtil;

@WebServlet(urlPatterns = { "/detail-new" })
public class DetailController extends HttpServlet {
	
	@Inject
	private ICategoryService categoryService;
	@Inject
	private INewService newService;
	@Inject
	private ICommentService commentService;
	
	private static final long serialVersionUID = -7781481559433070368L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("new_id");
		NewsModel model = newService.findOne(Long.parseLong(id));
		CommentModel commentModel = FormUtil.toModel(CommentModel.class, request);
		commentModel.setListResult(commentService.findByNewId(Long.parseLong(id)));
		commentModel.setCount(commentService.getTotalItemNew(Long.parseLong(id)),0);
		request.setAttribute("comment", commentModel);
		request.setAttribute(SystemConstant.MODEL, model);
		request.setAttribute("categories",categoryService.findAll());
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
