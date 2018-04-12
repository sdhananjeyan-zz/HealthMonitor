package com.healthmonitor.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware{

	Map<String, Object> session = new HashMap<String, Object>();
	
	public String execute() {
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
		
	}
}
