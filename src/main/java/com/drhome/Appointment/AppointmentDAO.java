package com.drhome.Appointment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AppointmentDAO {

	List<Map<String, Object>> list(Map<String, Object> map);

	List<Map<String, Object>> detail(Map<String, Object> map);
	
}
