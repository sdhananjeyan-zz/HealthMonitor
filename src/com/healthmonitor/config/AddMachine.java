package com.healthmonitor.config;


import java.util.Date;

import org.hibernate.Session;

import com.healthmonitor.hibernate.core.FactoryGenerator;
import com.healthmonitor.pojo.RegisteredMachines;
import com.opensymphony.xwork2.ActionSupport;

public class AddMachine extends ActionSupport{

	private String result;
	private String message;
	private String ipAddress;
	
	public String getResult() {
		return result;
	}
	public String getMessage() {
		return message;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	
	public String execute() {
		Session hbSession = FactoryGenerator.sessionFactory.openSession();
		hbSession.beginTransaction();
		try {
			RegisteredMachines machines = new RegisteredMachines();
			machines.setDateAdded(new Date());
			machines.setIpAddress(ipAddress);
			hbSession.save(machines);
			hbSession.getTransaction().commit();
			result = "success";
		}catch (Exception e) {
			result = "failure";
			message = e.getMessage();
		} finally {
			if(hbSession.isOpen()) {
				hbSession.close();
			}
		}
		return SUCCESS;
	}
	
	
	
}
