package uk.ac.gre.airport.parking.service;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import uk.ac.gre.airport.parking.dao.entity.Order;

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface IParkingService {
	
	public Order[] search(String s);
	
	public boolean checkin(String carNo);
	
	public boolean checkout(String carNo);
}
