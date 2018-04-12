package com.healthmonitor.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;

import com.healthmonitor.hibernate.core.FactoryGenerator;
import com.healthmonitor.pojo.SystemUser;
import com.opensymphony.xwork2.ActionSupport;

public class SignInAction extends ActionSupport implements SessionAware {

	Map<String, Object> session = new HashMap<String, Object>();

	private String userId;
	private String password;
	private String result;
	private SystemUser systemUser = new SystemUser();
	private String activeUser;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public String execute() {

		Session hbSession = FactoryGenerator.sessionFactory.openSession();
		hbSession.beginTransaction();
		try {
			SystemUser user = (SystemUser) hbSession.load(SystemUser.class, userId);
			if (user.getPassword().equals(password)) {
				result = SUCCESS;
				systemUser.setMobile(user.getMobile());
				systemUser.setName(user.getName());
				systemUser.setPassword(user.getPassword());
				systemUser.setUserId(user.getUserId());
				session.put("user", systemUser.getName());
				activeUser = systemUser.getName();
			} else {
				systemUser = null;
				result = "invalid password";
			}
		} catch (org.hibernate.ObjectNotFoundException e) {
			e.printStackTrace();
			systemUser = null;
			result = "no user";
		} catch (Exception e) {
			systemUser = null;
			result = "failure";
		}finally {
			if (hbSession.isOpen()) {
				hbSession.close();
			}
		}
		return SUCCESS;

	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;

	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public SystemUser getSystemUser() {
		return systemUser;
	}

	public void setSystemUser(SystemUser systemUser) {
		this.systemUser = systemUser;
	}

	public String getActiveUser() {
		return activeUser;
	}

	public void setActiveUser(String activeUser) {
		this.activeUser = activeUser;
	}
}
