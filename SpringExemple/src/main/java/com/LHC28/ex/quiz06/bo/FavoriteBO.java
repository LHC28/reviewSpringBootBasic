package com.LHC28.ex.quiz06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LHC28.ex.quiz06.dao.FavoriteDAO;
import com.LHC28.ex.quiz06.model.Favorite;

@Service
public class FavoriteBO {

	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public void addFavorite(String name, String address) {
		favoriteDAO.insertFavorite(name, address);
	}
	
	public List<Favorite> getFavoriteList(){
		return favoriteDAO.selectFavoriteList();
	}
	
	public boolean getFavoriteByAddress(String address) {
		return favoriteDAO.selectFavoriteByAddress(address);
	}
	
	public void deleteFavorite(int favoriteId) {
		favoriteDAO.deleteFavorite(favoriteId);
	}
}
