package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import com.laptrinhjavaweb.dao.ICategoryDAO;
import com.laptrinhjavaweb.mapper.CategoryMapper;
import com.laptrinhjavaweb.model.CategoryModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

	@Override
	public List<CategoryModel> findAll() {
		String sql="select * from category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public CategoryModel findOne(long id) {
		String sql="SELECT * FROM category WHERE id=?";
		List<CategoryModel> categories = query(sql, new CategoryMapper()	, id);
		return categories.isEmpty() ? null : categories.get(0);
	}

	@Override
	public CategoryModel findOneByCode(String code) {
		String sql="SELECT * FROM category WHERE code=?";
		List<CategoryModel> categories =query(sql, new CategoryMapper()	, code);
		return categories.isEmpty() ? null : categories.get(0);
	}
}
