package com.LHC28.ex.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Ex02Controller {

	@RequestMapping("/lesson01/ex02/1")
	public String ex02() {
		return "lesson01/ex02";
	}
	
	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03_1() {
		
		return "lesson01/quiz03_1";
	}
}
