package com.drhome.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@GetMapping(value = { "/", "/login" })
	public String login() {
		
		return "/login";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		LoginDTO loginDTO = new LoginDTO();
		loginDTO.setId(request.getParameter("mid"));
		loginDTO.setPw(request.getParameter("mpw"));
		
		loginDTO = loginService.loginResult(loginDTO);
		
		
		return "/main";
	}
	
}
