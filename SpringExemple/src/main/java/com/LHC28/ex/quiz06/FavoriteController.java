package com.LHC28.ex.quiz06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.LHC28.ex.quiz06.bo.FavoriteBO;
import com.LHC28.ex.quiz06.model.Favorite;

@RequestMapping("/quiz06")
@Controller
public class FavoriteController {

	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "quiz06/addFavorite";
	}
	
	@PostMapping("/add_favorite")
	@ResponseBody
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("address") String address
			) {
		
		favoriteBO.addFavorite(name, address);
		return "success";
	}
	
	@RequestMapping("/get_new_favorite")
	public String getNewFavorite(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "quiz06/getNewFavorite";
	}
	
	@PostMapping("/is_duplicated_address")
	@ResponseBody
	public Map<String, Boolean> isDuplicatedAddress(
			@RequestParam("address") String address
			){
		Map<String, Boolean> result = new HashMap<>();
		boolean check = favoriteBO.getFavoriteByAddress(address);
		result.put("result", check);
		return result; 
	}
	
	@PostMapping("/delete_favorite")
	@ResponseBody
	public Map<String, String> deleteFavorite(
			@RequestParam("favorite_id") int favoriteId
			){
		
		favoriteBO.deleteFavorite(favoriteId);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
}
