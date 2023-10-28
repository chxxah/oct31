package com.drhome.search;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchService {
	@Autowired 
	private SearchDAO searchDAO;

	public List<Map<String, Object>> departmentKeyword() {
		return searchDAO.deparmentKeyword();
	}
}
