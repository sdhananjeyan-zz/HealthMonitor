package com.healthmonitor.pojo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class VMBasedData {

	@Id
	@GeneratedValue
	private long id;
	private Date time;
	private double process;
	private double memory;
	private String ipAddress;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public double getProcess() {
		return process;
	}
	public void setProcess(double process) {
		this.process = process;
	}
	public double getMemory() {
		return memory;
	}
	public void setMemory(double memory) {
		this.memory = memory;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	
	
}
