package com.drhome.writeReview;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WriteReviewService {
	@Autowired
	private WriteReviewDAO writeReviewDAO;

	public ArrayList<Map<String, Object>> findDoctorByHno(int hno) {
		// TODO Auto-generated method stub
		return writeReviewDAO.findDoctorByHno(hno);
	}

	public Map<String, Object> findHospitalByHno(int hno) {
		return writeReviewDAO.findHospitalByHno(hno);
	}
}
