package com.LHC28.ex.lesson06.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LHC28.ex.lesson06.dao.Lesson06NewUserDAO;

@Service
public class Lesson06NewUserBO {

	@Autowired
	private Lesson06NewUserDAO newUserDAO;
	
	public void addNewUser(String name, String yyyymmdd, String introduce, String email) {
		newUserDAO.insertNewUser(name, yyyymmdd, introduce, email);
	}
	
	public boolean existNewUserByName(String name) {
		return newUserDAO.existNewUserByName(name);
	}
}
