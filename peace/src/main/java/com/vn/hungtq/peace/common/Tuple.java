package com.vn.hungtq.peace.common;

public class Tuple<FType,SType> {
	private FType firstValue;
	private SType secondValue;
	
	public static <FType,SType> Tuple<FType, SType> make(FType firstValue,SType secondValue){
		return new Tuple<FType, SType>(firstValue, secondValue);
	}
	
	private Tuple(FType firstValue,SType secondValue){
		this.firstValue = firstValue;
		this.secondValue = secondValue;
	}
	
	public FType getFirst(){
		return this.firstValue;
	}
	
	public SType getSecond(){
		return this.secondValue;
	} 

	public void setFirst(FType firstValue) {
		this.firstValue = firstValue;
	} 

	public void setSecond(SType secondValue) {
		this.secondValue = secondValue;
	} 
}
