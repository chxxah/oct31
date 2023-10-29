package com.drhome.hospitaldetail;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HospitalDetailService {
	@Autowired
	private HospitalDetailDAO hospitalDetailDAO;

	public Map<String, Object> findHospitalByHno(int hno) {
		return hospitalDetailDAO.findHospitalByHno(hno);
	}

	public ArrayList<Map<String, Object>> findDoctorByHno(int hno) {

		return hospitalDetailDAO.findDoctorByHno(hno);
	}

	public ArrayList<Map<String, Object>> findReviewByHno(int hno) {

		return hospitalDetailDAO.findReviewByHno(hno);
	}
	
	public Map<String, Object> countReviewByRate(int hno) {
		return hospitalDetailDAO.countReviewByRate(hno);
	}
	
	public void hospitalUnlike(String hname) {
		hospitalDetailDAO.hospitalUnlike(hname);
	}

	public void hospitalLike(String hname) {
		hospitalDetailDAO.hospitalLike(hname);

	}

	public Map<String, Object> findDoctorByDno(int dno) {
		return hospitalDetailDAO.findDoctorByDno(dno);
	}


}
