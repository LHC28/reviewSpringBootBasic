package com.LHC28.ex.Lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.LHC28.ex.Lesson02.model.UsedGoods;

@Repository
public interface UsedGoodsDAO {
	public List<UsedGoods> selectUsedGoodsList();
}
