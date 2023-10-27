package com.drhome.search;

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
	
	@Autowired SearchService searchService;
	
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
	public String search(@RequestParam String keyword) {
		System.out.println(keyword);
		return "redirect:/hospital?keyword=" + keyword;
	}
	
	@GetMapping("/hospital")
	public String hospitalList(@RequestParam String keyword) {
		System.out.println(keyword);
		return "/hospital";
	}
	
}
