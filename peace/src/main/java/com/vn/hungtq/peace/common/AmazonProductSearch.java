package com.vn.hungtq.peace.common;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by napt2017 on 3/24/2017.
 */
public final class AmazonProductSearch {
    private final String name;
    private final String price;
    private final String imageUrl;
    private final String link;
    private final String sin;
    private final Map<String,String> productAttribute;
    private final int index;


    public AmazonProductSearch(String name, String price,String link ,String imageUrl,String sin,int index) {
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
        this.link = link;
        this.sin = sin;
        this.index = index;
        this.productAttribute = new HashMap<String, String>();
    }

    public String getSin() {
        return sin;
    }

    public String getLink() {
        return link;
    }

    public void addProductAttribute(String key, String value){
        this.productAttribute.put(key,value);
    }

    public Map<String,String> getProductAttribute(){
        return this.productAttribute;
    }

    public String getName() {
        return name;
    }

    public String getPrice() {
        return price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public int getIndex() {
        return index;
    }
}
