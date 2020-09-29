package com.laptrinhjavaweb.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.IRoleDAO;
import com.laptrinhjavaweb.dao.IUserDAO;
import com.laptrinhjavaweb.model.RoleModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.Pageable;
import com.laptrinhjavaweb.service.IUserService;

public class UserService implements IUserService {

	@Inject
	private IUserDAO UserDAO;
	@Inject
	private IRoleDAO roleDAO;
	
	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		return UserDAO.findByUserNameAndPasswordAndStatus(userName, password, status);
	}

	@Override
	public UserModel save(UserModel userModel) {
		userModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		RoleModel roleModel = roleDAO.findOneByCode(userModel.getRoleCode());
		userModel.setRoleId(roleModel.getId());
		long id = UserDAO.save(userModel);
		return UserDAO.findOne(id);
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			UserDAO.delete(id);
		}
	}

	@Override
	public List<UserModel> findAll(Pageable pageable) {
		List<UserModel> list = UserDAO.findAll(pageable);
		if(list == null) return null;
		for (UserModel userModel : list) {
			RoleModel roleModel = roleDAO.findOne(userModel.getRoleId());
			userModel.setRole(roleModel);
		}
		return list;
	}

	@Override
	public int getTotalItem() {
		return UserDAO.getTotalItem();
	}

	@Override
	public UserModel findOne(long id) {
		return UserDAO.findOne(id);
	}

	@Override
	public UserModel update(UserModel updateUser) {
		UserModel oldUser = UserDAO.findOne(updateUser.getId()) ;
		updateUser.setCreatedDate(oldUser.getCreatedDate());
		updateUser.setCreatedBy(oldUser.getCreatedBy());
		updateUser.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		UserDAO.update(updateUser);
		return UserDAO.findOne(updateUser.getId());
	}

	@Override
	public UserModel findByUserName(String userName) {
		return UserDAO.findByUserName(userName);
	}

}
