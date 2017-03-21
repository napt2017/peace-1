package com.vn.hungtq.peace.common;

/**
 * Created by napt2017 on 3/19/2017.
 */
public class IntValHolder {
    private int value;

    public IntValHolder(int value){
        this.value = value;
    }

    public int incrementAfterGet(){
        return this.value++;
    }
}
