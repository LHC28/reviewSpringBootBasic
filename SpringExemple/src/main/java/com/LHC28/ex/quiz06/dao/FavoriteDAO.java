package com.LHC28.ex.quiz06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.LHC28.ex.quiz06.model.Favorite;

@Repository
public interface FavoriteDAO {

	public void insertFavorite(
			@Param("name") String name
			,@Param("address") String address);
	
	public List<Favorite> selectFavoriteList();
	
	public boolean selectFavoriteByAddress(@Param("address") String address);
	
	public void deleteFavorite(@Param("favoriteId") int favoriteId);
}
