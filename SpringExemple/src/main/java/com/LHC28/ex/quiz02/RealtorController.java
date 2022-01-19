package com.LHC28.ex.quiz02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.LHC28.ex.quiz02.bo.RealtorBO;
import com.LHC28.ex.quiz02.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;

	@RequestMapping("/1")
	public String addRealtorView() {
		
		return "lesson04/addRealtor";
	}
	
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model
			) {
		realtorBO.addRealtor(realtor);
		Realtor newRealtor = realtorBO.getRealtor(realtor.getId());
		model.addAttribute("newRealtor", newRealtor);
		
		return "lesson04/getLastRealtor";
	}
}
