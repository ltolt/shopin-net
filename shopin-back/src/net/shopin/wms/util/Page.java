/*
 * 文件名： Page.java
 * 
 * 创建日期： 2010-2-25
 *
 * Copyright(C) 2010, by neo.
 *
 * 原始作者: wangmeng
 *
 */
package net.shopin.wms.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页对象
 * 
 * @author wangmeng
 * 
 * @version
 * 
 * @since 2010-2-25
 */
public class Page<E> {

	// -- 公共常量 --//
	/** 默认页行数 */
	public static final int DEFAULT_FETCH_SIZE = 5;

	/** 升序排序关键字 */
	public static final String ASC = "ASC";

	/** 降序排序关键字 */
	public static final String DESC = "DESC";

	// -- 分页参数 --//
	/** 页码数，从1开始 */
	protected int pageNumber = 1;

	/** 页行数 */
	protected int fetchSize = DEFAULT_FETCH_SIZE;

	/** 页面总数 */
	private int pageCount;

	/** 排序字段字符串 */
	protected String orderBy;

	/** 排序方式 */
	protected String order;

	// -- 返回结果 --//
	/** 结果集 */
	protected List<E> list = new ArrayList<E>();

	/** 数据总数量 */
	protected long totalCount = -1;

	/**
	 * 
	 * 功能描述：默认构造
	 * 
	 * 
	 */
	public Page() {
	}

	/**
	 * 
	 * 功能描述：有参构造，设置页码数和默认页行数
	 * 
	 * 
	 */
	public Page(int pageNumber) {

		if (pageNumber > 0)
			this.pageNumber = pageNumber;
		this.fetchSize = Page.DEFAULT_FETCH_SIZE;
	}

	/**
	 * 
	 * 功能描述：有参构造，设置页码和页行数
	 * 
	 * 
	 */
	public Page(int pageNumber, int fetchSize) {

		if (pageNumber > 0)
			this.pageNumber = pageNumber;
		if (fetchSize > 0)
			this.fetchSize = fetchSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	/**
	 * @return 返回 页行数。
	 */
	public int getFetchSize() {
		return fetchSize;
	}

	/**
	 * @param fetchSize
	 *            要设置的 页行数。
	 */
	public void setFetchSize(int fetchSize) {
		this.fetchSize = fetchSize;
	}

	/**
	 * @return 返回 排序方式。
	 */
	public String getOrder() {
		return order;
	}

	/**
	 * @param order
	 *            要设置的 排序方式。
	 */
	public void setOrder(String order) {
		this.order = order;
	}

	/**
	 * @return 返回 排序字段字符串。
	 */
	public String getOrderBy() {
		return orderBy;
	}

	/**
	 * @param orderBy
	 *            要设置的 排序字段字符串。
	 */
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	/**
	 * @return 返回 页码数。
	 */
	public int getPageNumber() {
		return pageNumber;
	}

	/**
	 * @param pageNumber
	 *            要设置的 页码数。
	 */
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	/**
	 * @return 返回 分页查询结果集。
	 */
	public List<E> getList() {
		return list;
	}

	/**
	 * @param result
	 *            要设置的 分页查询结果集。
	 */
	public void setList(List<E> list) {
		this.list = list;
	}

	/**
	 * @return 返回 数据总行数。
	 */
	public long getTotalCount() {
		return totalCount;
	}

	/**
	 * @param totalCount
	 *            要设置的 数据总行数。
	 */
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
		pageCount = this.calculatePages();

		// 如果输入显示页数大于总页数时，返回组后一页
		if (pageCount < pageNumber) {
			if (pageCount > 0) {
				this.pageNumber = pageCount;
			} else {
				this.pageNumber = 1;
			}
		}
	}

	private int calculatePages() {
		if (totalCount > 0 && totalCount <= getFetchSize()) {
			return 1;
		} else if (totalCount == 0) {
			return 0;
		} else if (totalCount % getFetchSize() > 0) {

			return (int) totalCount / getFetchSize() + 1;
		}
		return (int) totalCount / getFetchSize();
	}
}
