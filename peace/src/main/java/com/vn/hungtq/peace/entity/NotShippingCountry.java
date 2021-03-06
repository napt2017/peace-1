package com.vn.hungtq.peace.entity;
 

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * NotShippingCountry generated by hbm2java
 */
@Entity
@Table(name = "not_shipping_country")
public class NotShippingCountry implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4605906379310518120L;
	private Integer id;
	private int countryGroupId;
	private Boolean isActive;

	public NotShippingCountry() {
	}

	public NotShippingCountry(int countryGroupId) {
		this.countryGroupId = countryGroupId;
	}

	public NotShippingCountry(int countryGroupId, Boolean isActive) {
		this.countryGroupId = countryGroupId;
		this.isActive = isActive;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "country_group_id", nullable = false)
	public int getCountryGroupId() {
		return this.countryGroupId;
	}

	public void setCountryGroupId(int countryGroupId) {
		this.countryGroupId = countryGroupId;
	}

	@Column(name = "is_active")
	public Boolean getIsActive() {
		return this.isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
