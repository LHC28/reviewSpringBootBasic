package com.LHC28.ex.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.LHC28.ex.lesson04.model.Seller;

@Repository
public interface SellerDAO {

	public void insertSeller(@Param("nickname") String nickname
			,@Param("profileImageUrl") String profileImageUrl
			,@Param("temparature") double temparature);
	
	public Seller getLastSeller();
}
