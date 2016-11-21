package Lab3;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projections;

public class Hibernate {
	
	static Hibernate instance = new Hibernate();
	private static SessionFactory factory;
	
	public void hibernateConnect(){
		try{
	         factory = new Configuration().configure().buildSessionFactory();
	      }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
	}
	
	public List countDistinct(String query, String table){
		List count = null;
		hibernateConnect();
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Location.class);
		
		// To get distinct count of a property.
		count = cr.setProjection(Projections.countDistinct("Country")).list();
		
		return count;
	}
	
	public List listRows(String query, String table){
	
		hibernateConnect();
		
	      Session session = factory.openSession();
	      Transaction tx = null;
	      @SuppressWarnings("rawtypes")
		  List returnList = null;
	      
		try{
	         tx = session.beginTransaction();
	         returnList = session.createQuery(query).list(); 
	         
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
//	         session.close(); 
	      }
		return returnList;
	   }
 

	public static void main(String[] args) {
		String Query;
		String Table;
		
		Table = "Location";
//		Table = "Person";
		
		//SELECT * From table
				Query = "From " + Table;
//				//SELECT * FROM table WHERE 
//				Query = "FROM Person E WHERE E.id = 10";
//				//SELECT * FROM table WHERE condition ORDER BY condition DESC
//				Query = "FROM Person E WHERE E.id > 10 ORDER BY E.salary DESC";
//				//SELECT * FROM table WHERE condition ORDER BY condition DESC
//				Query = "FROM Employee E WHERE E.id > 10 " +
//			            "ORDER BY E.firstName DESC, E.salary DESC ";
				
		List values = null;
	    List count = null;
	    
	    Hibernate hibernate = new Hibernate();
	    count = hibernate.countDistinct(null, null);
	    values = hibernate.listRows("FROM Location", "Location");

		for (@SuppressWarnings("rawtypes") Iterator iterator = values.iterator(); iterator.hasNext();){
			Location location = (Location) iterator.next();
 
			System.out.println(location.getCountry());
			System.out.println(location.getArea());
			System.out.println(location.getLocation());
		}

	}

}
