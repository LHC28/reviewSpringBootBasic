package com.LHC28.ex.lesson06;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.LHC28.ex.lesson06.bo.Lesson06NewUserBO;

@RequestMapping("/lesson06/ex02")
@Controller
public class Lesson06Ex02Controller {

	@Autowired
	private Lesson06NewUserBO newUserBO;
	
	@RequestMapping("/add_name")
	public String ex02() {
		return "lesson06/addName";
	}
	
	@GetMapping("/is_duplication")
	@ResponseBody
	public Map<String, Boolean> isDuplication(
			@RequestParam("name") String name
			){
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplication", newUserBO.existNewUserByName(name));
		
		return result;
	}
}
