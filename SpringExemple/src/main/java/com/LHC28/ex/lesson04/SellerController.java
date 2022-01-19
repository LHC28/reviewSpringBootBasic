package com.LHC28.ex.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.LHC28.ex.lesson04.bo.SellerBO;
import com.LHC28.ex.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;

	@RequestMapping("/1")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname
			,@RequestParam("profileImageUrl") String profileImageUrl,
			@RequestParam("temparature") double temparature
			) {
		sellerBO.addSeller(nickname, profileImageUrl, temparature);
		return "lesson04/afterAddSeller";
	}
	
	@RequestMapping("/seller_info")
	public String getLastSeller(
			Model model
			) {
		Seller seller = sellerBO.getLastSeller();
		model.addAttribute("seller", seller);
		
		return "lesson04/getLastSeller";
	}
}
