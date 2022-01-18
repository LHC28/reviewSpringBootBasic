package com.LHC28.ex.Lesson02.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.LHC28.ex.Lesson02.model.Real_estate;

@Repository
public interface Real_estateDAO {

	public Real_estate selectRealEstate(@Param("id") int id);
	
	public List<Real_estate> selectRealEstateByRentPrice(@Param("rentPrice") int rentPrice);
	
	public List<Real_estate> selectRealEstateByAreaAndPrice(
			@Param("area") int area
			,@Param("price") int price);
	
	public int updateById(
			@Param("id") int id
			,@Param("price") int price);
	
	public int deleteById(@Param("id") int id);
}
