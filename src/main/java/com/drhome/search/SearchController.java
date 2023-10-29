package com.drhome.search;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
	
	@Autowired private SearchService searchService;
	@Autowired private SearchUtil searchUtil;
	
	@GetMapping("/search")
	public String search(Model model) {
		// 증상 가져오기
		List<Map<String, Object>> departmentKeyword = searchService.departmentKeyword();
		//{dpkeyword=감기,예방접종,성장판검사,신생아황달}, {dpkeyword=치아교정,충치치료,치아미백,치통}

		// 모든 증상 뽑아내기
		List<String> allKeyword = new ArrayList<>();
		for (Map<String, Object> item : departmentKeyword) {
			String dpkeyword = (String) item.get("dpkeyword");
			String[] keywords = dpkeyword.split(",");
			for (String keyword : keywords) {
				allKeyword.add(keyword);
			}
		}
		
		// 증상 랜덤으로 8개 뽑아서 모델에 담기
		List<String> randomKeyword = new ArrayList<>();
		Random random = new Random();
		for (int i = 0; i < 8; i++) {
			int randomIndex = random.nextInt(allKeyword.size());
			randomKeyword.add(allKeyword.get(randomIndex));
		}
		model.addAttribute("randomKeyword",randomKeyword);
		return "/search";
	}
	
	@PostMapping("/search")
	public String search(@RequestParam String keyword) throws Exception {
	    	// 한글로 들어올 때 인코딩 해주기
	        String encodedKeyword = URLEncoder.encode(keyword, StandardCharsets.UTF_8.toString());
	        return "redirect:/hospital?keyword=" + encodedKeyword;
	}
	
	@GetMapping("/hospital")
	public String hospitalList(@RequestParam(required = false) String keyword, Model model) {
		List<Map<String, Object>> hospitalList = searchService.hospitalList(keyword);
		//[{dpkind=피부과, average=4.2, hholidayendtime=12:00:00, hparking=1, dpno=5, hnightday=수요일, dno=1, dpsymptom=피부 질환, hno=1, dpkeyword=티눈,아토피,안면홍조, COUNT(rno)=4, dspecialist=0, dgender=0, hopentime=09:00:00, hnightendtime=23:00:00, hname=연세세브란스, haddr=서울특별시 서대문구 신촌동 연세로 50-1, hclosetime=18:00:00, hholiday=0})
		//[{dpkind=피부과, hholidayendtime=12:00:00, hparking=1, dpno=5, hnightday=수요일, dno=1, dpsymptom=피부 질환, hno=1, dpkeyword=티눈,아토피,안면홍조, dspecialist=0, dgender=0, reviewCount=4, hopentime=09:00:00, hnightendtime=23:00:00, hname=연세세브란스, haddr=서울특별시 서대문구 신촌동 연세로 50-1, hclosetime=18:00:00, hholiday=0, reviewAverage=4.2}

		model.addAttribute("hospitalList", hospitalList);
		model.addAttribute("keyword", keyword);
		return "/hospital";
	}
	
}
