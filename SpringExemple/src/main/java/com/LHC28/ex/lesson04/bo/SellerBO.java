package com.LHC28.ex.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LHC28.ex.lesson04.dao.SellerDAO;
import com.LHC28.ex.lesson04.model.Seller;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;
	
	public void addSeller(String nickname, String profileImageUrl, double temparature) {
		sellerDAO.insertSeller(nickname, profileImageUrl, temparature);
	}
	
	public Seller getLastSeller() {
		return sellerDAO.getLastSeller();
	}
}
