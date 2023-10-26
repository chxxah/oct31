package com.drhome.login;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public int IDresult(Map<String, Object> map) {
		return loginDAO.IDresult(map);
	}

	public int PWresult(Map<String, Object> map) {
		return loginDAO.PWresult(map);
	}

	public Map<String, Object> loginCheck(Map<String, Object> map) {
		return loginDAO.loginCheck(map);
	}
	
}
