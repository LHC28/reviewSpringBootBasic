package com.LHC28.ex.Lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LHC28.ex.Lesson02.dao.Real_estateDAO;
import com.LHC28.ex.Lesson02.model.Real_estate;

@Service
public class Real_estateBO {

	@Autowired
	private Real_estateDAO real_estateDAO;
	
	public Real_estate getRealEstate(int id) {
		return real_estateDAO.selectRealEstate(id);
	}
	
	public List<Real_estate> getRealEstateByRentPrice(int rentPrice){
		return real_estateDAO.selectRealEstateByRentPrice(rentPrice);
	}
	
	public List<Real_estate> getRealEstateByAreaAndPrice(int area, int price){
		return real_estateDAO.selectRealEstateByAreaAndPrice(area,price);
	}
	
	public int updateById(int id, int price) {
		return real_estateDAO.updateById(id, price);
	}
	
	public int deleteById(int id) {
		return real_estateDAO.deleteById(id);
	}
}
