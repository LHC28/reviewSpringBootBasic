package com.LHC28.ex.quiz02.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LHC28.ex.quiz02.dao.RealtorDAO;
import com.LHC28.ex.quiz02.model.Realtor;

@Service
public class RealtorBO {

	@Autowired
	private RealtorDAO realtorDAO;
	
	public void addRealtor(Realtor realtor) {
		realtorDAO.insertRealtor(realtor);
	}
	
	public Realtor getRealtor(int id) {
		return realtorDAO.selectRealtor(id);
	}
}
