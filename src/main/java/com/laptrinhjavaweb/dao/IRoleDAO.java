package com.laptrinhjavaweb.dao;

import com.laptrinhjavaweb.model.RoleModel;

public interface IRoleDAO extends GenericDAO<RoleModel> {
	RoleModel findOneByCode(String code);
	RoleModel findOne(long id);
}
