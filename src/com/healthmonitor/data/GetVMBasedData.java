package com.healthmonitor.data;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.healthmonitor.hibernate.core.FactoryGenerator;
import com.healthmonitor.pojo.VMBasedData;
import com.opensymphony.xwork2.ActionSupport;

public class GetVMBasedData extends ActionSupport{
	
	private String ipAddress;
	private double[] process = new double[10];
	private double[] memory = new double[10];
	private String[] time = new String[10];
	private String result;
	private String message;
	
	public String execute() {
		
		Session hbSession = FactoryGenerator.sessionFactory.openSession();
		hbSession.beginTransaction();
		try {
		Criteria criteria = hbSession.createCriteria(VMBasedData.class).add(Restrictions.eq("ipAddress", ipAddress)).addOrder(Order.desc("time"));
		List<VMBasedData> datas = criteria.list();
		if(datas==null||datas.size()==0) {
			result = "nodata";
			return SUCCESS;
		}
		
		for(int i=0;i<9&&i<datas.size();i++) {
			
			
			process[i] = datas.get(i).getProcess();
			memory[i] = datas.get(i).getMemory();
			time[i] = datas.get(i).getTime().toString();
		}
		hbSession.getTransaction().commit();
		}catch (Exception e) {
			message = e.getMessage();
			result = "failure";
		}finally {
			if(hbSession.isOpen()) {
				hbSession.close();
			}
		}
		return SUCCESS;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public double[] getProcess() {
		return process;
	}

	public double[] getMemory() {
		return memory;
	}

	public String getResult() {
		return result;
	}

	public String getMessage() {
		return message;
	}

	public String[] getTime() {
		return time;
	}
	
	
	
	
	
	
}
