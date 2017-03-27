package com.vn.hungtq.peace.common;

public class ClientAmazonSearchDto {
	private String searchData;
	private boolean isAsinSearch;
	private int page;
	private int totalPage;
	
	public String getSearchData() {
		return searchData;
	}
	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
	public boolean isAsinSearch() {
		return isAsinSearch;
	}
	public void setAsinSearch(boolean isAsinSearch) {
		this.isAsinSearch = isAsinSearch;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	} 
	
}
