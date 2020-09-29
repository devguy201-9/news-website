package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.Pageable;

public interface IUserService {
	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);
	UserModel findByUserName(String userName);
	UserModel save(UserModel userModel);
	UserModel update(UserModel updateUser);
	void delete(long[] ids);
	List <UserModel> findAll(Pageable pageable);
	int getTotalItem();
	UserModel findOne(long id);
}
