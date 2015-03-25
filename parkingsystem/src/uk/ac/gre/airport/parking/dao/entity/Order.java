package uk.ac.gre.airport.parking.dao.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="`order`")
public class Order implements Serializable, IBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1539276025980375250L;
	
	@Id
	private long id;
	
	@Column(name="park_id")
	private long parkId;
	
	@Column(name="user_id")
	private long userId;
	
	@Column(name="arrival_date")
	private Date arrivalDate;
	
	@Column(name="departure_date")
	private Date departureDate;
	
	@Column(name="car_number")
	private String carNumber;
	
	@Column(name="car_made_by")
	private String carMadeBy;
	
	@Column(name="car_model")
	private String carModel;
	
	private int type;

	public long getParkId() {
		return parkId;
	}

	public void setParkId(long parkId) {
		this.parkId = parkId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public Date getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	public String getCarMadeBy() {
		return carMadeBy;
	}

	public void setCarMadeBy(String carMadeBy) {
		this.carMadeBy = carMadeBy;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public long getId() {
		return id;
	}

	@Override
	public void setId(long id) {
		this.id = id;
	}

	public Date getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
}
