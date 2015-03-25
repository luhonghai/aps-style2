package uk.ac.gre.airport.parking.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.airport.parking.dao.CurrencyDAO;
import uk.ac.gre.airport.parking.dao.entity.Currency;
import uk.ac.gre.airport.parking.dao.impl.CurrencyDaoImpl;
import uk.ac.gre.airport.parking.utils.EJBConnector;

@Path("/money")
public class CurrencyService {
	private CurrencyDAO currencyDAO;
	
	public CurrencyService() {
		currencyDAO = new EJBConnector<CurrencyDAO, CurrencyDaoImpl>(CurrencyDAO.class, CurrencyDaoImpl.class).newInstance();
	}
	@GET
	@Path("/convert")
	@Produces("application/json")
	public float exchange(@QueryParam("amount") float amount, @QueryParam("code") String code) {
		Currency currency = currencyDAO.findByCode(code);
		if (currency != null) {
			return currency.getExchangeRate() * amount;
		}
		return 0.0f;
	}

	@GET
	@Path("/currencies")
	@Produces("application/json")
	public List<Currency> listAllCurrencies() {
		return currencyDAO.findAll();
	}
}
