package com.drhome.search;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class SearchUtil {
	
	public List<String> splitByComma(String text) {
		List<String> splitStrings = new ArrayList<>();
		String[] arrayString = text.split(",");
		for (String keyword : arrayString) {
			splitStrings.add(keyword);
		}
		return splitStrings;
	}
}
