package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.RoleModel;

public class RoleMapper implements RowMapper<RoleModel> {

	@Override
	public RoleModel mapRow(ResultSet resultSet) {
		try {
			RoleModel role = new RoleModel();
			role.setId(resultSet.getLong("id"));
			role.setName(resultSet.getString("name"));
			role.setCode(resultSet.getString("code"));
			return role;
		} catch (SQLException e) {
			return null;
		}
	}
}
