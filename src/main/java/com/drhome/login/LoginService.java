package com.drhome.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public LoginDTO loginResult(LoginDTO loginDTO) {
		return loginDAO.loginResult(loginDTO);
	}
	
}
