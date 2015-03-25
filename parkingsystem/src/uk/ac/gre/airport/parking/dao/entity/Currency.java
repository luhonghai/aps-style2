package uk.ac.gre.airport.parking.dao.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity(name="currency")
@NamedQueries({
	@NamedQuery(
			name="Currency.findByCode", 
			query = "SELECT c from currency c where c.code=:code")
})
public class Currency implements Serializable, IBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -57145435878540123L;

	@Id
	private long id;
	
	private String name;
	
	private String code;
	
	@Column(name="rate")
	private float exchangeRate;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public float getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(float exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
}
