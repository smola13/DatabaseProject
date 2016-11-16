package Lab3;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Hibernate {
	
	private static SessionFactory factory;
	public String query;
	
	public void listRows( ){
		//SELECT * From table
		query = "From Location";
		//SELECT * FROM table WHERE 
		query = "FROM Person E WHERE E.id = 10";
		//SELECT * FROM table WHERE condition ORDER BY condition DESC
		query = "FROM Person E WHERE E.id > 10 ORDER BY E.salary DESC";
		//SELECT * FROM table WHERE condition ORDER BY condition DESC
		query = "FROM Employee E WHERE E.id > 10 " +
	            "ORDER BY E.firstName DESC, E.salary DESC ";
		
	      Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         List peopleList = session.createQuery(query).list(); 
	         for (Iterator iterator = 
	                           peopleList.iterator(); iterator.hasNext();){
	            Location location = (Location) iterator.next();
	            System.out.print(location.getCountry()); 
	            System.out.print(location.getArea()); 
	            System.out.println(location.getLocation()); 
	         }
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	   }


	public static void main(String[] args) {

		try{
	         factory = new Configuration().configure().buildSessionFactory();
	      }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
		Hibernate hibernate = new Hibernate();
				
		hibernate.listRows();

	}

}
