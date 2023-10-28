package com.drhome.search;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SearchDAO {

	List<Map<String, Object>> deparmentKeyword();

}
