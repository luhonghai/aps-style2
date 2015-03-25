package uk.ac.gre.airport.parking.dao.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import uk.ac.gre.airport.parking.dao.BaseDAO;
import uk.ac.gre.airport.parking.dao.CurrencyDAO;
import uk.ac.gre.airport.parking.dao.entity.Currency;

@Stateless
public class CurrencyDaoImpl extends BaseDAO<Currency> implements CurrencyDAO {
	
	@PersistenceContext(unitName = "CJPADB")
	private EntityManager customEntityManager;

	@Override
	protected EntityManager getEntityManager() {
		return customEntityManager;
	}
	
	public CurrencyDaoImpl() {
		super(Currency.class);
	}

	@Override
	public Currency findByCode(String code) {
		List<Currency> currencies = getEntityManager()
				.createNamedQuery("Currency.findByCode", Currency.class)
				.setParameter("code", code)
				.getResultList();
		return currencies.size() > 0 ? currencies.get(0) : null;
	}
}
