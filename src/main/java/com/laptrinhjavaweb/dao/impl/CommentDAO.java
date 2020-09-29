package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.laptrinhjavaweb.dao.ICommentDAO;
import com.laptrinhjavaweb.mapper.CommentMapper;
import com.laptrinhjavaweb.model.CommentModel;
import com.laptrinhjavaweb.paging.Pageable;

public class CommentDAO extends AbstractDAO<CommentModel> implements ICommentDAO {

	@Override
	public void delete(long id) {
		String sql="DELETE FROM comment WHERE id=?";
		update(sql, id);
	}

	@Override
	public int getTotalItem() {
		String sql="SELECT COUNT(*) comment";
		return count(sql);
	}

	@Override
	public List<CommentModel> findAll(Pageable pageable) {
		StringBuilder sql = new StringBuilder("SELECT * FROM comment GROUP BY new_id");
		if(pageable.getSorter() != null && StringUtils.isNotBlank(pageable.getSorter().getSortName()) &&
				 			StringUtils.isNotBlank(pageable.getSorter().getSortBy())) {
			 sql.append(" ORDER BY "+pageable.getSorter().getSortName()+" "+pageable.getSorter().getSortBy());
		 }
		if(pageable.getOffset() != null && pageable.getLimit() != null) {
		 sql.append(" LIMIT "+pageable.getOffset()+", "+pageable.getLimit());
		}
		return query(sql.toString(), new CommentMapper());
	}

	@Override
	public int getTotalItemNew(long id) {
		String sql = "SELECT COUNT(*) FROM comment WHERE new_id=?";
		return count(sql, id) ;
	}

	@Override
	public List<CommentModel> findByNewId(long id) {
		String sql = "SELECT * FROM comment WHERE new_id=?";
		return query(sql,new CommentMapper(), id);
	}

	@Override
	public Long save(CommentModel commentModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO comment(content,new_id,user_id,createddate,createdby)");
		sql.append(" VALUES(?,?,?,?,?)");
		return insert(sql.toString(), commentModel.getContent(), commentModel.getNewId(), commentModel.getUserId(),
				commentModel.getCreatedDate(), commentModel.getCreatedBy());
	}

	@Override
	public void update(CommentModel updateComment) {
		StringBuilder sql = new StringBuilder("UPDATE comment SET content = ?, new_id = ?, user_id = ?,");
		sql.append(" createddate = ? , createdby = ?,modifieddate=?,modifiedby=? WHERE id = ?");
		update(sql.toString(), updateComment.getContent(), updateComment.getNewId(), updateComment.getUserId(),
				updateComment.getCreatedDate(), updateComment.getCreatedBy(), updateComment.getModifiedDate(),
				updateComment.getModifiedBy(), updateComment.getId());
	}

	@Override
	public int getTotalUserNew(long id) {
		String sql = "SELECT COUNT(DISTINCT user_id) FROM comment WHERE new_id=?";
		return count(sql, id);
	}

	@Override
	public CommentModel findOne(long id) {
		String sql = "SELECT * FROM comment WHERE id=?";
		List<CommentModel> comment = query(sql, new CommentMapper(), id);
		return comment.isEmpty() ? null : comment.get(0) ;
	}

	@Override
	public void deleteByNewId(long id) {
		String sql="DELETE FROM comment WHERE new_id=?";
		update(sql, id);
	}
}
