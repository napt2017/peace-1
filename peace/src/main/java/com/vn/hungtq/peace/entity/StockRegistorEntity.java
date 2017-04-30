package com.vn.hungtq.peace.entity;

import javax.persistence.*;

/**
 * Created by napt2017 on 4/10/2017.
 */
@Entity
@Table(name = "stock_registor", schema = "peace", catalog = "")
public class StockRegistorEntity {
    private int id;
    private String storeName;
    private String productName;
    private String vendorUrl;
    private Double buyPrice;
    private Integer logicCheck;
    private Double stock;
    private String note;
    private String stockWord;
    private int userId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "store_name")
    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    @Basic
    @Column(name = "product_name")
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Basic
    @Column(name = "vendor_url")
    public String getVendorUrl() {
        return vendorUrl;
    }

    public void setVendorUrl(String vendorUrl) {
        this.vendorUrl = vendorUrl;
    }

    @Basic
    @Column(name = "buy_price")
    public Double getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(Double buyPrice) {
        this.buyPrice = buyPrice;
    }

    @Basic
    @Column(name = "logic_check")
    public Integer getLogicCheck() {
        return logicCheck;
    }

    public void setLogicCheck(Integer logicCheck) {
        this.logicCheck = logicCheck;
    }

    @Basic
    @Column(name = "stock")
    public Double getStock() {
        return stock;
    }

    public void setStock(Double stock) {
        this.stock = stock;
    }

    @Basic
    @Column(name = "note")
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Basic
    @Column(name = "stock_word")
    public String getStockWord() {
        return stockWord;
    }

    public void setStockWord(String stockWord) {
        this.stockWord = stockWord;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StockRegistorEntity that = (StockRegistorEntity) o;

        if (id != that.id) return false;
        if (storeName != null ? !storeName.equals(that.storeName) : that.storeName != null) return false;
        if (productName != null ? !productName.equals(that.productName) : that.productName != null) return false;
        if (vendorUrl != null ? !vendorUrl.equals(that.vendorUrl) : that.vendorUrl != null) return false;
        if (buyPrice != null ? !buyPrice.equals(that.buyPrice) : that.buyPrice != null) return false;
        if (logicCheck != null ? !logicCheck.equals(that.logicCheck) : that.logicCheck != null) return false;
        if (stock != null ? !stock.equals(that.stock) : that.stock != null) return false;
        if (note != null ? !note.equals(that.note) : that.note != null) return false;
        if (stockWord != null ? !stockWord.equals(that.stockWord) : that.stockWord != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (storeName != null ? storeName.hashCode() : 0);
        result = 31 * result + (productName != null ? productName.hashCode() : 0);
        result = 31 * result + (vendorUrl != null ? vendorUrl.hashCode() : 0);
        result = 31 * result + (buyPrice != null ? buyPrice.hashCode() : 0);
        result = 31 * result + (logicCheck != null ? logicCheck.hashCode() : 0);
        result = 31 * result + (stock != null ? stock.hashCode() : 0);
        result = 31 * result + (note != null ? note.hashCode() : 0);
        result = 31 * result + (stockWord != null ? stockWord.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "user_id")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
