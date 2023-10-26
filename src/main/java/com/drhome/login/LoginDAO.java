package com.drhome.login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	int IDresult(Map<String, Object> map);

	int PWresult(Map<String, Object> map);

	Map<String, Object> loginCheck(Map<String, Object> map);

}
