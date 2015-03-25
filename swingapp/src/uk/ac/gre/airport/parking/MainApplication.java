package uk.ac.gre.airport.parking;

import java.awt.EventQueue;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

import javax.swing.JLabel;

import uk.ac.gre.airport.parking.dao.entity.Order;
import uk.ac.gre.airport.parking.service.IParkingService;

import java.awt.Font;


public class MainApplication {

	private JFrame frame;
	private JTable tblOrder;
	private JTextField txtSearch;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					System.out.println("Preparing");
					MainApplication window = new MainApplication();
					System.out.println("Done");
					window.frame.setVisible(true);
			        
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public MainApplication() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 560, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JButton btnSearch = new JButton("Search");
		btnSearch.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				search(txtSearch.getText());
			}
		});
		btnSearch.setBounds(423, 11, 117, 29);
		frame.getContentPane().add(btnSearch);
		
		tblOrder = new JTable();
		JScrollPane scrollPane = new JScrollPane(tblOrder);
		scrollPane.setBounds(16, 46, 524, 211);
		frame.getContentPane().add(scrollPane);
		
		txtSearch = new JTextField();
		txtSearch.setBounds(16, 10, 395, 28);
		frame.getContentPane().add(txtSearch);
		txtSearch.setColumns(10);
		search(txtSearch.getText());
	}
	
	private void search(String s) {
		URL url = null;
		try {
			url = new URL("http://localhost:8080/WebApplication/ParkingService?wsdl");
			//1st argument service URI, refer to wsdl document above
	        //2nd argument is service name, refer to wsdl document above
	        QName qname = new QName("http://service.parking.airport.gre.ac.uk/", "ParkingServiceService");
	        Service service = Service.create(url, qname);
	        IParkingService parkingService = service.getPort(IParkingService.class);
	        Order[] orders = parkingService.search(s);
	        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	        DefaultTableModel model = new DefaultTableModel();
	    	model.addColumn("Arrival Date");
	    	model.addColumn("Departure Date");
	    	model.addColumn("Car RegNo");
	    	model.addColumn("Car Made by");
	    	model.addColumn("Car Model");
	    	model.addColumn("Parking Type");
	        if (orders == null) {
	        } else {
	        	
		        for (Order order : orders) {
		        	model.addRow(new Object[] {
		        		    sdf.format(order.getArrivalDate()),
		        		    sdf.format(order.getDepartureDate()),
		        		    order.getCarNumber(),
		        		    order.getCarMadeBy(),
		        		    order.getCarModel(),
		        		    order.getType() == Constant.PACKING_TYPE_DEFAULT 
	    					? "Default"	: (order.getType() == Constant.PACKING_TYPE_DISABLED
							? "Disabled" : "Family"),
		        	});
		        }
		        
	        }
	        tblOrder.setModel(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
	}
}
