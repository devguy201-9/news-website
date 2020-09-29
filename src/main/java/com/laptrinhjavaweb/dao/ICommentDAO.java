package com.laptrinhjavaweb.dao;

import java.util.List;

import com.laptrinhjavaweb.model.CommentModel;
import com.laptrinhjavaweb.paging.Pageable;

public interface ICommentDAO extends GenericDAO<CommentModel> {
	void delete(long id);
	void deleteByNewId(long id);
	//list admin
	int getTotalItem();
	int getTotalUserNew(long id);
	List<CommentModel> findAll(Pageable pageable);
	CommentModel findOne(long id);
	//detail new
	int getTotalItemNew(long id);
	List<CommentModel> findByNewId(long id);
	Long save(CommentModel commentModel);
	void update(CommentModel updateComment);
}
