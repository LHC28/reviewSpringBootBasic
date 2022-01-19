package com.LHC28.ex.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.LHC28.ex.lesson04.bo.NewUserBO;
import com.LHC28.ex.lesson04.model.NewUser;

@RequestMapping("/lesson04")
@Controller
public class NewUserController {

	@Autowired
	private NewUserBO newUserBO;
	
	@RequestMapping(method=RequestMethod.GET, path="/ex01/1")
	public String addUserView() {
		return "lesson04/addUser";
	}
	
	@PostMapping("ex01/add_user")
	public String addUser(
			@RequestParam("name") String name,
			@RequestParam("yyyymmdd") String yyyymmdd,
			@RequestParam(value="introduce", required=false) String introduce,
			@RequestParam("email") String email
			) {
		newUserBO.addUser(name, yyyymmdd, introduce, email);
		return "/lesson04/afterAddUser";
	}
	
	@GetMapping("/ex01/2")
	public String getUserView(Model model) {
		NewUser newUser = newUserBO.getLastUser();
		model.addAttribute("result", newUser);
		model.addAttribute("subject", "회원 정보");
		
		return "lesson04/getLastUser";
	}
}
