package com.drhome.hospitaldetail;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HospitalDetailController {
	@Autowired
	private HospitalDetailService hospitalDetailService;

	@Autowired
	private HospitalDetailUtil util;

	@GetMapping("/hospitaldetail/{hno}")
	public String hospitaldetail(HttpSession session,@PathVariable int hno, Model model) {
		// 추후 변경 로그인 페이지 만든후 변경
		String[] hospitallike = { "연세세브란스" };
		
		// 로그인 페이지에서 Session에 추가
		session.setAttribute("hospitallike", hospitallike);
		session.setAttribute("mno", 1);
		
		Map<String, Object> hospital = hospitalDetailService.findHospitalByHno(hno);
		
		ArrayList<Map<String, Object>> doctorList = hospitalDetailService.findDoctorByHno(hno);
		
		ArrayList<Map<String, Object>> reviewList = hospitalDetailService.findReviewByHno(hno);
		
		String averageHospitalRate = util.getHospitalAverageRate(reviewList);

		Map<String, Object> reviewCount = hospitalDetailService.countReviewByRate(hno);
		System.out.println(reviewCount);

		Map<String, Object> now = new HashMap<>();
		now.put("dayOfWeek", util.getDayOfWeek(util.dayOfWeek));
		now.put("time", util.time);

		model.addAttribute("hospital", hospital);
		model.addAttribute("doctorList", doctorList);
		model.addAttribute("now", now);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("averageHospitalRate", averageHospitalRate);
		model.addAttribute("reviewCount", reviewCount);

		return "/hospitalDetail";
	}

	@GetMapping("/doctorDetail/{dno}")
	public String dotordetail(@PathVariable int dno, Model model) {
		Map<String, Object> doctorDetail = hospitalDetailService.findDoctorByDno(dno);
		System.out.println(doctorDetail);
		model.addAttribute("doctorDetail", doctorDetail);
		return "/doctorDetail";

	}

	@ResponseBody
	@PostMapping("/unlike")
	public String unlike(@RequestParam("hospitalname") String hname) {
		hospitalDetailService.hospitalUnlike(hname);
		return "";
	}

	@ResponseBody
	@PostMapping("/like")
	public String like(@RequestParam("hospitalname") String hname) {
		hospitalDetailService.hospitalLike(hname);
		return "";
	}
}
