
package com.vn.hungtq.peace.entity;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * CountryUserMap generated by hbm2java
 */
@Entity
@Table(name = "country_user_map")
public class CountryUserMap implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2887575007061577604L;
	private Integer id;
	private Country country;
	private User user;
	private Boolean isSelect;

	public CountryUserMap() {
	}

	public CountryUserMap(Country country, User user) {
		this.country = country;
		this.user = user;
	}

	public CountryUserMap(Country country, User user, Boolean isSelect) {
		this.country = country;
		this.user = user;
		this.isSelect = isSelect;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "country_id", nullable = false)
	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "is_select")
	public Boolean getIsSelect() {
		return this.isSelect;
	}

	public void setIsSelect(Boolean isSelect) {
		this.isSelect = isSelect;
	}

}
