package com.laptrinhjavaweb.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dao.ICommentDAO;
import com.laptrinhjavaweb.dao.INewDAO;
import com.laptrinhjavaweb.dao.IRoleDAO;
import com.laptrinhjavaweb.dao.IUserDAO;
import com.laptrinhjavaweb.model.CommentModel;
import com.laptrinhjavaweb.model.NewsModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.Pageable;
import com.laptrinhjavaweb.service.ICommentService;

public class CommentService implements ICommentService {

	@Inject
	private ICommentDAO commentDAO;
	@Inject
	private INewDAO newDAO;
	@Inject
	private IUserDAO userDAO;
	@Inject
	private IRoleDAO roleDAO;
	
	@Override
	public void delete(long id) {
		commentDAO.delete(id);
	}

	@Override
	public int getTotalItem() {
		return commentDAO.getTotalItem();
	}

	@Override
	public int getTotalUserNew(long id) {
		return commentDAO.getTotalUserNew(id);
	}

	@Override
	public List<CommentModel> findAll(Pageable pageable) {
		List<CommentModel> list = commentDAO.findAll(pageable);
		if(list == null) return null;
		for (CommentModel commentModel : list) {
			NewsModel newModel = newDAO.findOne(commentModel.getNewId());
			commentModel.setTitleNew(newModel.getTitle());
			commentModel.setCount(commentDAO.getTotalItemNew(newModel.getId()),
					commentDAO.getTotalUserNew(newModel.getId()));
		}
		return list;
	}

	@Override
	public int getTotalItemNew(long id) {
		return commentDAO.getTotalItemNew(id);
	}

	@Override
	public List<CommentModel> findByNewId(long id) {
		List<CommentModel> comments = commentDAO.findByNewId(id);
		try {
			for (CommentModel commentModel : comments) {
				UserModel user  = userDAO.findOne(commentModel.getUserId());
				commentModel.setUserComment(user.getUserName());
				if(roleDAO.findOne(user.getRoleId()).getCode().equals(SystemConstant.ADMIN)) {
					commentModel.setRoleUser(roleDAO.findOne(user.getRoleId()).getName());
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return comments;
	}

	@Override
	public CommentModel save(CommentModel commentModel) {
		commentModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long id = commentDAO.save(commentModel);
		return commentDAO.findOne(id);
	}

	@Override
	public CommentModel update(CommentModel updateComment) {
		CommentModel oldComment = commentDAO.findOne(updateComment.getId());
		updateComment.setCreatedDate(oldComment.getCreatedDate());
		updateComment.setCreatedBy(oldComment.getCreatedBy());
		updateComment.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		commentDAO.update(updateComment);
		return commentDAO.findOne(updateComment.getId());
	}

	@Override
	public void deleteByNewId(long[] ids) {
		for (long id : ids) {
			commentDAO.deleteByNewId(id);
		}
	}

}
