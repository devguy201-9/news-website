package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.CommentModel;

public class CommentMapper implements RowMapper<CommentModel> {

	@Override
	public CommentModel mapRow(ResultSet resultSet) {
		try {
			CommentModel comment = new CommentModel();
			comment.setId(resultSet.getLong("id"));
			comment.setContent(resultSet.getString("content"));
			comment.setUserId(resultSet.getLong("user_id"));
			comment.setNewId(resultSet.getLong("new_id"));
			comment.setCreatedBy(resultSet.getString("createdby"));
			comment.setCreatedDate(resultSet.getTimestamp("createddate"));
			if(resultSet.getTimestamp("modifieddate") != null) {
				comment.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			if(resultSet.getString("modifiedby") != null) {
				comment.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return comment;
		} catch (SQLException e) {
			return null;
		}
	}
}
