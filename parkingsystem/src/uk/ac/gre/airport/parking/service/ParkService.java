package uk.ac.gre.airport.parking.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.airport.parking.dao.ParkDAO;
import uk.ac.gre.airport.parking.dao.entity.Park;
import uk.ac.gre.airport.parking.dao.impl.ParkDaoImpl;

@Path("park")
public class ParkService extends BaseService<Park, ParkDAO, ParkDaoImpl> {

	public ParkService() {
		super(ParkDAO.class, ParkDaoImpl.class);
	}

	@Override
	@GET
	@Path("/delete")
	@Produces("application/json")
	public boolean delete(@QueryParam("id") long id) {
		return super.delete(id);
	}
	
	@Override
	@POST
	@Path("/save")
	@Produces("application/json")
	public Park save(final Park obj) {
		return super.save(obj);
	}

	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public Park find(@QueryParam("id") long id) {
		return super.find(id);
	}

	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<Park> findAll() {
		return super.findAll();
	}
}
