package com.vn.hungtq.peace.common;

/**
 * Created by napt2017 on 4/30/2017.
 */
public enum StockCheckType {
    HAS_STOCK ,HAS_NOT_STOCK;

    @Override
    public String toString() {
        if(this.equals(StockCheckType.HAS_STOCK)){
            return "List of stock has product:";
        }else if(this.equals(StockCheckType.HAS_NOT_STOCK)){
            return "List of stock has not products :";
        }
        return super.toString();
    }
}
