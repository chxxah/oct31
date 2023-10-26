package com.drhome.Appointment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AppointmentService {

	@Autowired
	private AppointmentDAO appointmentDAO;

	public List<Map<String, Object>> list(Map<String, Object> map) {
		return appointmentDAO.list(map);
	}

	public List<Map<String, Object>> detail(Map<String, Object> map) {
		return appointmentDAO.detail(map);
	}
	
	
	
}
