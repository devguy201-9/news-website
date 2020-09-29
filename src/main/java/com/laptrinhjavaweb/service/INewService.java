package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.model.NewsModel;
import com.laptrinhjavaweb.paging.Pageable;

public interface INewService {
	List<NewsModel> findByCaterogyId(Long categoryId);
	NewsModel save(NewsModel newModel);
	NewsModel update(NewsModel updateNew);
	void delete(long[] ids);
	List <NewsModel> findAll(Pageable pageable);
	int getTotalItem();
	NewsModel findOne(long id);
}
