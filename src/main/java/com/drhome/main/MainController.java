package com.drhome.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@Autowired MainService mainService;
	
	@GetMapping(value = { "/", "/index" })
	public String main() {
		return "/main";
	}
}
