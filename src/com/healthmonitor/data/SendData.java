package com.healthmonitor.data;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.healthmonitor.hibernate.core.FactoryGenerator;
import com.healthmonitor.pojo.RegisteredMachines;
import com.healthmonitor.pojo.VMBasedData;
import com.healthmonitor.util.Utils;
import com.opensymphony.xwork2.ActionSupport;

public class SendData extends ActionSupport implements SessionAware, ServletRequestAware {

	Map<String, Object> session = new HashMap<String, Object>();
	HttpServletRequest request;
	private String activeUser;
	private String cpuStats;
	private String memoryStats;
	private String date;
	private String result = SUCCESS;
	private String message = "";
	private String ipAddress;

	public String execute() {

		try {
			// String ipAddress = request.getRemoteAddr();
			activeUser = (String) session.get("user");
			//request.get

			System.out.println(cpuStats);
			System.out.println(memoryStats);
			System.out.println(date);

			String cpuUtilU = cpuStats.split(":")[1].split(",")[0].split("%")[0];
			String cpuUtilS = cpuStats.split(":")[1].split(",")[1].split("%")[0];
			String cpuAvail = cpuStats.split(":")[1].split(",")[3].split("%")[0];

			String memToatl = memoryStats.split(":")[1].split(",")[0].split("k")[0].trim();
			String memUsed = memoryStats.split(":")[1].split(",")[1].split("k")[0].trim();
			String memAvail = memoryStats.split(":")[1].split(",")[2].split("k")[0].trim();

			System.out.println(cpuUtilU + " " + cpuUtilS + " " + cpuAvail);
			System.out.println(memToatl + " " + memUsed + " " + memAvail);

			if (cpuUtilU.contains(" ")) {
				cpuUtilU = cpuUtilU.split("( )+")[1];
			}
			if (cpuUtilS.contains(" ")) {
				cpuUtilS = cpuUtilS.split("( )+")[1];
			}
			if (cpuAvail.contains(" ")) {
				cpuAvail = cpuAvail.split("( )+")[1];
			}
			if (memToatl.contains(" ")) {
				memToatl = memToatl.split("( )+")[1];
			}
			if (memUsed.contains(" ")) {
				memUsed = memUsed.split("( )+")[1];
			}
			if (memAvail.contains(" ")) {
				memAvail = memAvail.split("( )+")[1];
			}

			VMBasedData vmBasedData = new VMBasedData();
			vmBasedData.setIpAddress(ipAddress);
			vmBasedData.setMemory((Double.parseDouble(memUsed) / Double.parseDouble(memToatl)) * 100);
			vmBasedData.setProcess(((Double.parseDouble(cpuUtilU) + Double.parseDouble(cpuUtilS))
					/ (Double.parseDouble(cpuUtilU) + Double.parseDouble(cpuUtilS) + Double.parseDouble(cpuAvail)))
					* 100);
			vmBasedData.setTime(toDate(date));
			Session hbSession = FactoryGenerator.sessionFactory.openSession();

			try {
				hbSession.beginTransaction();
				Criteria criteria = hbSession.createCriteria(RegisteredMachines.class)
						.add(Restrictions.eq("ipAddress", ipAddress));
				List<VMBasedData> vms = criteria.list();
				if (vms != null && vms.size() != 1) {
					result = "failure";
					message = "vm " + ipAddress + " not registered";

				} else {
					hbSession.save(vmBasedData);
					hbSession.getTransaction().commit();
				}

			} catch (Exception e) {
				result = "failue";
				message = e.getMessage();
			} finally {
				if (hbSession.isOpen()) {
					hbSession.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "failure";
			message = e.getMessage();
		}

		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;

	}

	public String getActiveUser() {
		return activeUser;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;

	}

	public String getDate() {
		return date;
	}

	public Date toDate(String date) {
		String[] dateSplit = date.split(" ");
		Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone(dateSplit[4]));
		calendar.set(Calendar.DAY_OF_WEEK, Utils.getWeek(dateSplit[0]));
		calendar.set(Calendar.MONTH, Utils.getMonth(dateSplit[1]));
		calendar.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateSplit[2]));
		calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt(dateSplit[3].split(":")[0]));
		calendar.set(Calendar.MINUTE, Integer.parseInt(dateSplit[3].split(":")[1]));
		calendar.set(Calendar.SECOND, Integer.parseInt(dateSplit[3].split(":")[2]));
		calendar.set(Calendar.YEAR, Integer.parseInt(dateSplit[5]));

		return calendar.getTime();
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getResult() {
		return result;
	}

	public String getMessage() {
		return message;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setCpuStats(String cpuStats) {
		this.cpuStats = cpuStats;
	}

	public void setMemoryStats(String memoryStats) {
		this.memoryStats = memoryStats;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	

}
