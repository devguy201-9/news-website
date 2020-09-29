package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.model.CommentModel;
import com.laptrinhjavaweb.paging.Pageable;

public interface ICommentService {
	void delete(long id);
	void deleteByNewId(long[] ids);
	//list admin
	int getTotalItem();
	int getTotalUserNew(long id);
	List<CommentModel> findAll(Pageable pageable);
	//detail new
	int getTotalItemNew(long id);
	List<CommentModel> findByNewId(long id);
	CommentModel save(CommentModel commentModel);
	CommentModel update(CommentModel updateComment);
}
