package com.laptrinhjavaweb.dao;

import java.util.List;

import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.paging.Pageable;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findByUserNameAndPasswordAndStatus(String userName,String password,Integer status);
	UserModel findByUserName(String userName);
	Long save(UserModel userModel);
	void update(UserModel updateUser);
	void delete(long id);
	List <UserModel> findAll(Pageable pageable);
	int getTotalItem();
	UserModel findOne(long id);
}
