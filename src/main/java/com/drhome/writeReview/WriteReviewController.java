package com.drhome.writeReview;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WriteReviewController {
	
	@Autowired
	private WriteReviewService writeReviewService;
	
	@GetMapping("/writeReview")
	public String writeReview(@RequestParam("hno") int hno,Model model) {
		ArrayList<Map<String, Object>> doctor = writeReviewService.findDoctorByHno(hno);
		Map<String, Object> hospital = writeReviewService.findHospitalByHno(hno);
		System.out.println(doctor);
		model.addAttribute("doctor", doctor);
		model.addAttribute("hospital", hospital);
		return "/writeReview";
	}
}
