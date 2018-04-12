package com.healthmonitor.home;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class InitiateAction extends ActionSupport implements SessionAware {

	Map<String, Object> session = new HashMap<String, Object>();
	private String activeUser;
	
	public String execute() {
		setActiveUser((String) session.get("user"));
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
		
	}

	public String getActiveUser() {
		return activeUser;
	}

	public void setActiveUser(String activeUser) {
		this.activeUser = activeUser;
	}	
}
