package com.LHC28.ex.quiz02.dao;

import org.springframework.stereotype.Repository;

import com.LHC28.ex.quiz02.model.Realtor;

@Repository
public interface RealtorDAO {

	public void insertRealtor(Realtor realtor);
	
	public Realtor selectRealtor(int id);
}
