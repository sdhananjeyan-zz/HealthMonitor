import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.healthmonitor.hibernate.core.FactoryGenerator;

public class TestHibernate {

	public static void main(String args[]) {
		Session session =  FactoryGenerator.sessionFactory.openSession();
		session.beginTransaction();
		session.getTransaction().commit();
		System.out.println("Done");
	}
}
