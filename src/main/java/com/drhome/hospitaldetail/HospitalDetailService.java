package com.drhome.hospitaldetail;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HospitalDetailService {
	@Autowired
	private HospitalDetailDAO hospitalDetailDAO;

	public Map<String, Object> findHospitalByHno() {
		// 변경예정
		int hno = 1;
		return hospitalDetailDAO.findHospitalByHno(hno);
	}

	public ArrayList<Map<String, Object>> findDoctorByHno() {
		// 변경예정
		int hno = 1;

		return hospitalDetailDAO.findDoctorByHno(hno);
	}

	public ArrayList<Map<String, Object>> findReviewByHno() {
		// 변경예정
		int hno = 1;

		return hospitalDetailDAO.findReviewByHno(hno);
	}

	public void hospitalUnlike(String hname) {
		hospitalDetailDAO.hospitalUnlike(hname);
	}

	public void hospitalLike(String hname) {
		hospitalDetailDAO.hospitalLike(hname);

	}

}
