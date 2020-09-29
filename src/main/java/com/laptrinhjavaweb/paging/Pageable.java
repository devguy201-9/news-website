package com.laptrinhjavaweb.paging;

import com.laptrinhjavaweb.sort.Sorter;

public interface Pageable {
	Integer getPage();
	Integer getLimit();
	Integer getOffset();
	Sorter getSorter();
}
