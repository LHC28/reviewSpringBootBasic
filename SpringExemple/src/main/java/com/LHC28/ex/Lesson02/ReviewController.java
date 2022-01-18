package com.LHC28.ex.Lesson02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.LHC28.ex.Lesson02.bo.ReviewBO;
import com.LHC28.ex.Lesson02.model.Review;

@RestController
public class ReviewController {

	@Autowired
	private ReviewBO reviewBO;
	
	@RequestMapping("/lesson03/ex01")
	public Review ex01(int id) {
		System.out.println("### id : ");
		return reviewBO.getReview(id);
	}
	
	@RequestMapping("/lesson03/ex02")
	public String ex02() {
		Review review = new Review();
		review.setStoreId(7);
		review.setMenu("삼겹혼밥세트");
		review.setUserName("신보람");
		review.setPoint(4.5);
		review.setReview("혼자 먹기 딱 적당하네요.");
		
		int row = reviewBO.insertReview(review);
		return "success row count : " + row;
	}
	
	@RequestMapping("/lesson03/ex02/2")
	public String ex02_2() {
		int row = reviewBO.insertReviewAsField(4,"콤비네이션R","신바다",5.0,"역시 맛있다!!!");
		return "success row count" + row;
	}
	
	@RequestMapping("/lesson03/ex03")
	public String ex03(
			@RequestParam(value="id") int id,
			@RequestParam(value="review") String review
			) {
		int row = reviewBO.updateReviewById(id, review);
		return "변경 완료 : "+row; 
	}
	
	@RequestMapping("/lesson03/ex04")
		public String ex03(@RequestParam(value="id") int id) {
		reviewBO.deleteReviewById(id);
		return "삭제 완료";
	}
}
