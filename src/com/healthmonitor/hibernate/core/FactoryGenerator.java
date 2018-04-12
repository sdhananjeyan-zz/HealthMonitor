package com.healthmonitor.hibernate.core;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistryBuilder;

import com.healthmonitor.pojo.ProcessBasedData;
import com.healthmonitor.pojo.RegisteredMachines;
import com.healthmonitor.pojo.SystemUser;
import com.healthmonitor.pojo.VMBasedData;


public class FactoryGenerator {
	public static SessionFactory sessionFactory;
	public static FactoryGenerator factoryGenerator=new FactoryGenerator();
	//static initializer
	static{
		if(sessionFactory==null)
		sessionFactory=getSessionFactory();
	
	}
	
	private static  SessionFactory getSessionFactory()
	{
		Configuration configuration = new Configuration();
		
		
		configuration.addAnnotatedClass(SystemUser.class);
		configuration.addAnnotatedClass(ProcessBasedData.class);
		configuration.addAnnotatedClass(VMBasedData.class);
		configuration.addAnnotatedClass(RegisteredMachines.class);
	
		configuration.configure();
	    return  configuration.buildSessionFactory(new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry());
	}
}