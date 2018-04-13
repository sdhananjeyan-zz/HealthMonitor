package com.healthmonitor.data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Criteria;
import org.hibernate.Session;

import com.healthmonitor.hibernate.core.FactoryGenerator;
import com.healthmonitor.pojo.RegisteredMachines;
import com.opensymphony.xwork2.ActionSupport;

public class GetMachines extends ActionSupport implements SessionAware {

	Map<String, Object> session = new HashMap<String, Object>();
	private List<RegisteredMachines> machines = new ArrayList<RegisteredMachines>();
	private String result;
	private String activeUser;
	private String message;

	@Override
	public void setSession(Map<String, Object> arg0) {

		this.session = arg0;
	}
	
	public String execute() {
		result = "failure";
		Session hbSession = FactoryGenerator.sessionFactory.openSession();
		try {
			hbSession.beginTransaction();
			List<RegisteredMachines> mchns = hbSession.createCriteria(RegisteredMachines.class).list();
			copyMachines(mchns);
			activeUser = (String)session.get("user");
			result = SUCCESS;
			hbSession.getTransaction().commit();
		} catch (Exception e) {
			result = "failure";
			message = e.getMessage();
		}finally {
			if(hbSession.isOpen()) {
				hbSession.close();
			}
		}
		return SUCCESS;
	}

	private void copyMachines(List<RegisteredMachines> machns) {
		for (RegisteredMachines rMachine : machns) {
			RegisteredMachines machine = new RegisteredMachines();
			machine.setIpAddress(rMachine.getIpAddress());
			machine.setDateAdded(rMachine.getDateAdded());
			this.machines.add(machine);
		}
	}

	public List<RegisteredMachines> getMachines() {
		return machines;
	}

	public String getResult() {
		return result;
	}

	public String getActiveUser() {
		return activeUser;
	}

	public String getMessage() {
		return message;
	}
	

}
