package com.LHC28.ex.Lesson02.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LHC28.ex.Lesson02.dao.ReviewDAO;
import com.LHC28.ex.Lesson02.model.Review;

@Service
public class ReviewBO {

	@Autowired
	private ReviewDAO reviewDAO;
	
	public Review getReview(int id) {
		return reviewDAO.selectReview(id);
	}
	
	public int insertReview(Review review) {
		return reviewDAO.insertReview(review);
	}
	
	public int insertReviewAsField(int storeId, String menu, String userName, double point, String review) {
		return reviewDAO.insertReviewAsField(storeId, menu, userName, point, review);
	}
	
	public int updateReviewById(int id, String review) {
		return reviewDAO.updateReviewById(id, review);
	}
	
	public void deleteReviewById(int id) {
		reviewDAO.deleteReviewById(id);
	}
}
