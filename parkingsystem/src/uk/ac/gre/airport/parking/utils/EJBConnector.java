package uk.ac.gre.airport.parking.utils;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class EJBConnector<T,K> {
	private static final String DISTINCT_NAME = "";
	private static final String APP_NAME = "";
	private static final String MODULE_NAME = "WebApplication";
	private static final String PKG_INTERFACES = "org.jboss.ejb.client.naming";
	
	private static Context context;
	private Class<T> remoteClass;
	private Class<K> statelessClass;
	
	public EJBConnector(Class<T> rc, Class<K> sc) {
		this.remoteClass = rc;
		this.statelessClass = sc;
	}
	
	private Context getContext() throws NamingException {
		if (context == null) {
			Properties properties = new Properties();
			properties.put(Context.URL_PKG_PREFIXES, PKG_INTERFACES);
			properties.put("jboss.naming.client.ejb.context", true);
			context = new InitialContext(properties);
		}
		return context;
	}
	
	@SuppressWarnings("unchecked")
	public T newInstance() {
		try {
			return (T) getContext().lookup("ejb:" + APP_NAME + "/" 
					+ MODULE_NAME + "/" 
					+ DISTINCT_NAME + "/" 
					+ statelessClass.getSimpleName() + "!"
					+ remoteClass.getName());
		} catch (NamingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
