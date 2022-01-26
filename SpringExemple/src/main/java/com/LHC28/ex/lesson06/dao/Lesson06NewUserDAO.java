package com.LHC28.ex.lesson06.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface Lesson06NewUserDAO {

	public void insertNewUser(
			@Param("name") String name
			,@Param("yyyymmdd") String yyyymmdd
			,@Param("introduce") String introduce
			,@Param("email") String email
			);
	
	public boolean existNewUserByName(@Param("name") String name);
}
