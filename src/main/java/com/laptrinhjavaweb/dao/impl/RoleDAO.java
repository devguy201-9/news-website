package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import com.laptrinhjavaweb.dao.IRoleDAO;
import com.laptrinhjavaweb.mapper.RoleMapper;
import com.laptrinhjavaweb.model.RoleModel;

public class RoleDAO extends AbstractDAO<RoleModel> implements IRoleDAO {
	@Override
	public RoleModel findOneByCode(String code) {
		String sql = "SELECT * FROM role WHERE code=?";
		List<RoleModel> roles =query(sql, new RoleMapper(), code);
		return roles.isEmpty() ? null : roles.get(0);
	}

	@Override
	public RoleModel findOne(long id) {
		String sql = "SELECT * FROM role WHERE id=?";
		List<RoleModel> roles =query(sql, new RoleMapper(), id);
		return roles.isEmpty() ? null : roles.get(0);
	}

}
