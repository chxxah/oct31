package com.drhome.Appointment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AppointmentController {
	
	@Autowired
	private AppointmentService appointmentService;
	
	@GetMapping("/appointment")
	public String appointment(Map<String, Object> map, Model model, HttpSession session) {
		
		List<Map<String, Object>> list = appointmentService.list(map);
		map.put("list", list);
		
		return "appointment";
	}

	
	@PostMapping("/adetail")
	public String adetail(Map<String, Object> map, Model model) {
		
		List<Map<String, Object>> detail = appointmentService.detail(map);
		
		map.put("detail", detail);
		
		return "adetail";
	}
	
}
