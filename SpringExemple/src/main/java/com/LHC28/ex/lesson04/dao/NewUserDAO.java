package com.LHC28.ex.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.LHC28.ex.lesson04.model.NewUser;

@Repository
public interface NewUserDAO {

	public void insertNewUser(@Param("name") String name
			,@Param("yyyymmdd") String yyyymmdd
			,@Param("introduce") String introduce
			,@Param("email") String email);
	
	public NewUser selectLastUser();
}
