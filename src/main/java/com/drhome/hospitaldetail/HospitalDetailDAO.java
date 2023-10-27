package com.drhome.hospitaldetail;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HospitalDetailDAO {

	Map<String, Object> findHospitalByHno(int hno);

	ArrayList<Map<String, Object>> findDoctorByHno(int hno);

	ArrayList<Map<String, Object>> findReviewByHno(int hno);

	void hospitalUnlike(String hname);

	void hospitalLike(String hname);


}
