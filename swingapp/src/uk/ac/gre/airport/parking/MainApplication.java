package uk.ac.gre.airport.parking;

import java.awt.EventQueue;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
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

	private JFrame frmAirportParkingSystem;
	private JTable tblOrder;
	private JTextField txtSearch;
	private JTextField txtCarNo;

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
					window.frmAirportParkingSystem.setVisible(true);
			        
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
		frmAirportParkingSystem = new JFrame();
		frmAirportParkingSystem.setAlwaysOnTop(true);
		frmAirportParkingSystem.setTitle("Airport parking system");
		frmAirportParkingSystem.setResizable(false);
		frmAirportParkingSystem.setBounds(100, 100, 560, 300);
		frmAirportParkingSystem.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmAirportParkingSystem.getContentPane().setLayout(null);
		
		JButton btnSearch = new JButton("Search");
		btnSearch.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				search(txtSearch.getText());
			}
		});
		btnSearch.setBounds(423, 11, 117, 29);
		frmAirportParkingSystem.getContentPane().add(btnSearch);
		
		tblOrder = new JTable();
		JScrollPane scrollPane = new JScrollPane(tblOrder);
		scrollPane.setBounds(16, 46, 524, 174);
		frmAirportParkingSystem.getContentPane().add(scrollPane);
		
		txtSearch = new JTextField();
		txtSearch.setBounds(16, 10, 395, 28);
		frmAirportParkingSystem.getContentPane().add(txtSearch);
		txtSearch.setColumns(10);
		
		txtCarNo = new JTextField();
		txtCarNo.setBounds(168, 232, 134, 28);
		frmAirportParkingSystem.getContentPane().add(txtCarNo);
		txtCarNo.setColumns(10);
		
		JLabel lblCarRegisterNumber = new JLabel("Car register number");
		lblCarRegisterNumber.setBounds(26, 238, 130, 16);
		frmAirportParkingSystem.getContentPane().add(lblCarRegisterNumber);
		
		JButton btnGoIn = new JButton("Go in");
		btnGoIn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				doGoIn();
			}
		});
		btnGoIn.setBounds(308, 232, 109, 29);
		frmAirportParkingSystem.getContentPane().add(btnGoIn);
		
		JButton btnGoOut = new JButton("Go out");
		btnGoOut.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				doGoOut();
			}
		});
		btnGoOut.setBounds(431, 232, 109, 29);
		frmAirportParkingSystem.getContentPane().add(btnGoOut);
		init();
		search(txtSearch.getText());
	}
	
	private IParkingService parkingService;
	
	private void init() {
		URL url = null;
		try {
			url = new URL("http://localhost:8080/WebApplication/ParkingService?wsdl");
			//1st argument service URI, refer to wsdl document above
	        //2nd argument is service name, refer to wsdl document above
	        QName qname = new QName("http://service.parking.airport.gre.ac.uk/", "ParkingServiceService");
	        Service service = Service.create(url, qname);
	        parkingService = service.getPort(IParkingService.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doGoOut() {
		if (parkingService != null) {
			if (parkingService.checkout(txtCarNo.getText())) {
				JOptionPane.showMessageDialog(frmAirportParkingSystem, "Available! Please go out.", "Goodbye!", JOptionPane.INFORMATION_MESSAGE);
			} else {
				JOptionPane.showMessageDialog(frmAirportParkingSystem, "Not available!", "Not found", JOptionPane.WARNING_MESSAGE);
			}
		} else {
			JOptionPane.showMessageDialog(frmAirportParkingSystem, "Could not connect to server", "Error", JOptionPane.ERROR_MESSAGE);
		}
	}
	
	private void doGoIn() {
		if (parkingService != null) {
			if (parkingService.checkin(txtCarNo.getText())) {
				JOptionPane.showMessageDialog(frmAirportParkingSystem, "Available! Please go in.", "Welcome!", JOptionPane.INFORMATION_MESSAGE);
			} else {
				JOptionPane.showMessageDialog(frmAirportParkingSystem, "Not available!", "Not found", JOptionPane.WARNING_MESSAGE);
			}
		} else {
			JOptionPane.showMessageDialog(frmAirportParkingSystem, "Could not connect to server", "Error", JOptionPane.ERROR_MESSAGE);
		}
	}
	
	private void search(String s) {
		try {
			
	        Order[] orders = null;
	        if (parkingService != null)
	        	orders = parkingService.search(s);
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
