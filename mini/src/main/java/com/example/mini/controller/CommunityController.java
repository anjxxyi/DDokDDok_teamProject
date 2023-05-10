package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;

@Controller
public class CommunityController {


	// 5. 커뮤니티
	@RequestMapping("/community.do")
	public String community(Model model) throws Exception{
		return "/e-community-list";
	}
	
	// 5. 커뮤니티 상세
	@RequestMapping("/community-view.do")
	public String communityInfo(Model model) throws Exception{
		return "/e-community-view";
	}
	
	// 5. 커뮤니티 글 작성 및 수정
	@RequestMapping("/community-edit.do")
	public String communityEdit(Model model) throws Exception{
		return "/e-community-edit";
	}
	

		
	
}
		
	