package com.healthmonitor.pojo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class RegisteredMachines {

	@Id
	private String ipAddress;
	private Date dateAdded;
	
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public Date getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}
	
	
}
