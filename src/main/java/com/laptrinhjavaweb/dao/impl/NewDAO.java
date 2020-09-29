package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.laptrinhjavaweb.dao.INewDAO;
import com.laptrinhjavaweb.mapper.NewMapper;
import com.laptrinhjavaweb.model.NewsModel;
import com.laptrinhjavaweb.paging.Pageable;

public class NewDAO extends AbstractDAO<NewsModel> implements INewDAO {
		@Override
		public List<NewsModel> findByCategoryId(Long categoryId) {
			String sql="SELECT * FROM news WHERE categoryid=?";
			return query(sql, new NewMapper(), categoryId);
		}

		@Override
		public Long save(NewsModel newModel) {
			StringBuilder sql = new StringBuilder("INSERT INTO news(title,content,");
			sql.append("thumbnail,shortdescription,categoryid,createddate,createdby)");
			sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?)");
			return insert(sql.toString(), newModel.getTitle(),newModel.getContent(),newModel.getThumbnail(),
					newModel.getShortDescription(),newModel.getCategoryid(),newModel.getCreatedDate(),
					newModel.getCreatedBy());
		}

		@Override
		public void update(NewsModel updateNew) {
			StringBuilder sql = new StringBuilder("UPDATE news SET title = ? , content = ? , thumbnail = ? ,");
			sql.append(" shortdescription = ? , categoryid = ? ,");
			sql.append(" createddate = ? , createdby = ?,modifieddate=?,modifiedby=? WHERE id = ?");
			update(sql.toString(), updateNew.getTitle(),updateNew.getContent(),updateNew.getThumbnail(),
					updateNew.getShortDescription(),updateNew.getCategoryid(),
					updateNew.getCreatedDate(),updateNew.getCreatedBy(),
					updateNew.getModifiedDate(),updateNew.getModifiedBy(),updateNew.getId());
		}

		@Override
		public NewsModel findOne(Long id) {
			String sql="SELECT * FROM news WHERE id=?";
			List<NewsModel> news =query(sql, new NewMapper(), id);
			return news.isEmpty() ? null : news.get(0);
		}

		@Override
		public void delete(long id) {
			String sql="DELETE FROM news WHERE  id = ? ";
			update(sql, id);
		}

		@Override
		public List<NewsModel> findAll(Pageable pageable) {
			StringBuilder sql = new StringBuilder("SELECT * FROM news");
			if(pageable.getSorter() != null && StringUtils.isNotBlank(pageable.getSorter().getSortName()) && StringUtils.isNotBlank(pageable.getSorter().getSortBy())) {
				sql.append(" ORDER BY "+pageable.getSorter().getSortName()+" "+pageable.getSorter().getSortBy());
			}
			if(pageable.getOffset() != null && pageable.getLimit() != null) {
				sql.append(" LIMIT "+pageable.getOffset()+", "+pageable.getLimit());
			}
			return query(sql.toString(), new NewMapper());
		}

		@Override
		public int getTotalItem() {
			String sql = "SELECT COUNT(*) FROM news";
			return count(sql);
		}
}
