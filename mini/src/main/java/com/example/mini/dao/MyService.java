package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Funding;
import com.example.mini.model.Recipe;
import com.example.mini.model.SmartMarket;

public interface MyService {
	
	//레시피 저장
	List<Recipe> searchLikeRecipe(HashMap<String, Object>map);
	
	//펀딩참여이력
	List<Funding> searchAttendFunding(HashMap<String, Object>map);
	
	//주문내역
	List<SmartMarket> searchOderList(HashMap<String, Object>map);
}
