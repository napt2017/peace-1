package com.vn.hungtq.peace.common;

import java.util.ArrayList; 
import java.util.List;

/**
 * Created by napt2017 on 3/24/2017.
 */
public class AmazonSearchResult {
    private final List<AmazonProductSearch> lstProductSearch;
    private int totalPage;
    private int currentPage;

    public AmazonSearchResult() {
        this.lstProductSearch = new ArrayList<AmazonProductSearch>(26);
    }

    public void addAllProductSearch(List<AmazonProductSearch> lstSubProductSearch){
        this.lstProductSearch.addAll(lstSubProductSearch);
    }

    public void addProductSearch(AmazonProductSearch amazonProductSearch){
        this.lstProductSearch.add(amazonProductSearch);
    }

    public List<AmazonProductSearch> getLstProductSearch() {
        return lstProductSearch;
    }

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}  
}
