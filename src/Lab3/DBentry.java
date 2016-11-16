/*
 * Program: CS485_lab4
 * Purpose: The program is designed to illustrate 1) the use of SQL connector 
 * to connect to and update on MySQL database; 2) the use of JSP to create a
 * Web page for data entry. To make the program work, both JDK, Apache, MySQL
 * need to be installed.
 * @copyright the program is intended for class use, it should not be distributed
 * outside the class without permission from the instructor, Dr. Mingrui Zhang  
 */
package Lab3;
import java.sql.*;
import java.util.ArrayList;

public class DBentry {
	static DBentry instance = new DBentry();
	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	String dpwd = null;
	StringBuilder sb = new StringBuilder();
	
	//change URL to your database server as needed
	String dbPath="jdbc:mysql://localhost:3306/cs485_project";
	
	public static DBentry getInstance() {
		if (instance==null) {
			instance = new DBentry();
		}
		return instance;
	}
	
	//Establish connection to MySQL server
	public Connection newConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			try {			
				dbconn = DriverManager.getConnection(dbPath,"root","root");
				System.out.println("gain the connection");
				return dbconn;
			}
			catch (Exception s){
				System.out.println(s.getStackTrace().toString());}
		}
		catch (Exception err){
			System.out.println(err.getStackTrace().toString());
		}
		return null;
	}
	
	public ResultSet selectStatement( String query ) {
		try {
			dbconn=instance.newConnection();
			sql=dbconn.prepareStatement(query);
			ResultSet results;
			results=sql.executeQuery();
			System.out.println("query="+query);
	
			//WARNING!
			//Need to process ResultSet before closing connection
			
//			dbconn.close();
			return results;
		}
		catch (Exception err) {
			System.out.println(err.getMessage());
			return null;
		}
	}
	
	public void closeDB(){
		try {
			dbconn.close();
			System.out.println("close the connection");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean DBentry( String query ) {
		try {
			System.out.println("query="+query);
			instance.newConnection();
			sql=dbconn.prepareStatement(query);
			sql.executeUpdate(query);
			dbconn.close();
			return true;
		}
		catch ( Exception err ) {
			err.getStackTrace();
			return false;
		}
	}
	
	public boolean entry( String itemNumber, String priceEach, String firstName, String lastName, String shippingAddress, String creditCard, String cardNumber ) {
		try {
			instance.DBentry("INSERT INTO databaseproject.sharkdata (`item_number`, `price`, `first_name`,`last_name`, `address`,`card_type`, `card_number`) " +
								"VALUES ('"+itemNumber+"','"+priceEach+"','"+firstName+"','"+lastName+"','"+shippingAddress+"','"+creditCard+"','"+cardNumber+"');");
			
//			PreparedStatement pStmt= dbconn.prepareStatement( "insert into cs485_lab.customer values(`item_number`, `price`, `first_name`,`last_name`, `address`,`card_type`, `card_number`)");
//			pStmt.setString(1, itemNumber);
//			pStmt.setString(2, priceEach);
//			pStmt.setString(3, firstName);
//			pStmt.setString(4, lastName);
//			pStmt.setString(5, shippingAddress);
//			pStmt.setString(6, creditCard);
//			pStmt.setString(7, cardNumber);
//			pStmt.executeUpdate();
//			
//			closeDB();
			
			return true;
		}
		catch ( Exception err ) {
			err.getStackTrace();
			return false;
		}
	}
	
	public static void main(String[] args) {	
//		instance.entry("Golf");
	}
}