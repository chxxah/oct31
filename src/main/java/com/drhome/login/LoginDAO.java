package com.drhome.login;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	LoginDTO loginResult(LoginDTO loginDTO);

}
