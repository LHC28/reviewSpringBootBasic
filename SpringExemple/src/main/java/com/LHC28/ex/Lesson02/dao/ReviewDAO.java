package com.LHC28.ex.Lesson02.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.LHC28.ex.Lesson02.model.Review;

@Repository
public interface ReviewDAO {

	public Review selectReview(int id);
	
	public int insertReview(Review review);
	
	public int insertReviewAsField(
			@Param("storeId") int storeId
			,@Param("menu") String menu
			,@Param("userName") String userName
			,@Param("point") double point
			,@Param("review") String review);
	
	public int updateReviewById(
			@Param("id") int id
			,@Param("review") String review);
	
	public void deleteReviewById(@Param("id") int id);
}
