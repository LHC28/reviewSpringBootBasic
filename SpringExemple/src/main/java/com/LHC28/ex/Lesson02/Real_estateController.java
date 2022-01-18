package com.LHC28.ex.Lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.LHC28.ex.Lesson02.bo.Real_estateBO;
import com.LHC28.ex.Lesson02.model.Real_estate;

@RestController
public class Real_estateController {

	@Autowired
	private Real_estateBO real_estateBO; 
	
	@RequestMapping("/lesson03/quiz01/1")
	public Real_estate quiz01_1(
			@RequestParam("id") int id
			) {
		return real_estateBO.getRealEstate(id);
	}
	
	@RequestMapping("/lesson03/quiz01/2")
	public List<Real_estate> quiz01_2(
			@RequestParam("rent_price") int rent_price
			){
		List<Real_estate> realEstate = real_estateBO.getRealEstateByRentPrice(rent_price);
		return realEstate;
	}
	
	@RequestMapping("/lesson03/quiz01/3")
	public List<Real_estate> quiz01_3(
			@RequestParam("area") int area
			,@RequestParam("price") int price
			){
		List<Real_estate> estate = real_estateBO.getRealEstateByAreaAndPrice(area,price);
		return estate;
	}
	
	@RequestMapping("/lesson03/quiz03/1")
	public String quiz03_1(
			@RequestParam("id") int id
			,@RequestParam("price") int price) {
		int row = real_estateBO.updateById(id, price);
		return "수정 성공 : "+row;
	}
	
	@RequestMapping("/lesson03/quiz04/1")
	public String quiz04_1(
			@RequestParam("id") int id){
		int row = real_estateBO.deleteById(id);
		return "삭제 성공 : "+row;
	}
}
