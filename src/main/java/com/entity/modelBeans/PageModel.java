/**
 * 
 */
package com.entity.modelBeans;

import java.util.List;

/**
 * @author slw
 * 分页模型类
 */
public class PageModel<T> {

	//当前页号
	private int pageNo=1;
	//每页显示的记录数
	private int pageSize=2;
	//总记录数
	private int recordCount;
	//总页数
	private int pageCount;
	//存放分页数据的集合
	private List<T> datas;
	
	public PageModel(){
		
	}
	
	public PageModel(int pageNo,int pageSize){
		this.pageNo=pageNo;
		this.pageSize=pageSize;
	}

	public PageModel(int pageNo, int pageSize, int recordCount, List<T> datas) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		this.datas = datas;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getPageCount() {
		if(this.getRecordCount()<=0){
			return 0;
		}else{
			pageCount=(recordCount+pageSize-1)/pageSize;
		}
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	
	
}
