package com.LHC28.ex.Lesson02;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.LHC28.ex.Lesson02.bo.StoreBO;
import com.LHC28.ex.Lesson02.model.Store;

@RestController
public class StoreRestController {

	@Autowired
	private StoreBO storeBO;
	
	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01(){
		List<Store> store = storeBO.getStoreList();
		return store;
	}
}
