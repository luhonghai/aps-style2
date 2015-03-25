package uk.ac.gre.airport.parking.dao;

import javax.ejb.Remote;

import uk.ac.gre.airport.parking.dao.entity.Currency;

@Remote
public interface CurrencyDAO extends IBaseDAO<Currency>{
	public Currency findByCode(String code);
}
