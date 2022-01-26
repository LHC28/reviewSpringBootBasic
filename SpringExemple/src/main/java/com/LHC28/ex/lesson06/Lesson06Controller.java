package com.LHC28.ex.lesson06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.LHC28.ex.lesson06.bo.Lesson06NewUserBO;

@RequestMapping("/lesson06/ex01")
@Controller
public class Lesson06Controller {

	@Autowired
	private Lesson06NewUserBO newUserBO;
	
	@RequestMapping("/add_user_view")
	public String ex01() {
		return "/lesson06/addNewUser";
	}
	
	@PostMapping("/add_user")
	@ResponseBody
	public String addUser(
			@RequestParam("name") String name
			,@RequestParam("yyyymmdd") String yyyymmdd
			,@RequestParam(value="introduce", required=false) String introduce
			,@RequestParam(value="email", required=false) String email
			) {
		
		newUserBO.addNewUser(name, yyyymmdd, introduce, email);
		return "seccess";
	}
	
	@RequestMapping("/get_user")
	public String getUser() {
		return "lesson06/getNewUser";
	}
}
