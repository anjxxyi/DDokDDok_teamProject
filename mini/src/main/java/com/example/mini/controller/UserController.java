package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.UserService;
import com.example.mini.model.Recipe;
import com.example.mini.model.User;
import com.google.gson.Gson;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	HttpSession session;
	//로그인
	@RequestMapping("/login.do") 
    public String main(Model model) throws Exception{
    	String id = (String) session.getAttribute("sessionId");
    	String pw = (String) session.getAttribute("sessionPw");
    	String name = (String) session.getAttribute("sessionName");
    	String nick = (String) session.getAttribute("sessionNick");
    	String status = (String) session.getAttribute("sessionStatus");
    	
    	session.removeAttribute(id);
    	session.removeAttribute(pw);
    	session.removeAttribute(name);
    	session.removeAttribute(nick);
    	session.removeAttribute(status);
    	
    	session.invalidate();
    	
        return "/login";
    }
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String get(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchUserInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			session.setAttribute("sessionId", user.getUserId());
			session.setAttribute("sessionPw", user.getPassword());
			session.setAttribute("sessionName", user.getName());
			session.setAttribute("sessionNick", user.getNick());
			session.setAttribute("sessionStatus", user.getStatus());
		}
		return new Gson().toJson(resultMap);
		
    }
	
	@RequestMapping("/join.do") 
    public String add(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
    	
        return "/join";
    }
	//회원가입
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addUser(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.addUser(map);
		resultMap.put("result", "success");
		
		return new Gson().toJson(resultMap);
	}
	//아이디중복체크
	@RequestMapping(value = "/user/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.searchUserCnt(map);
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	//닉네임중복체크
	@RequestMapping(value = "/user/nickCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String nickCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.searchUserNickCnt(map);
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	//주소
	@RequestMapping("/addr.do") 
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/jusoPopup";
    }
	//id찾기
	@RequestMapping("/findId.do") 
    public String findAccount(Model model) throws Exception{

        return "/findId";
    }
	//id찾기 결과	
	@RequestMapping(value = "/user/findId.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findId(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.searchUserIdCnt(map);
		resultMap.put("id", userService.searchUserId(map));
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	//비번찾기
	@RequestMapping("/findPw.do") 
    public String findPw(Model model) throws Exception{

        return "/findPw";
    }
	
	@RequestMapping(value = "/user/findPw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findPw(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.searchUserCnt(map);
		resultMap.put("pw", userService.searchUserPw(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	//비번 변경
	@RequestMapping(value = "/pwUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateBbs(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.editPw(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//회원 정보 수정
	@RequestMapping("/modify.do") 
    public String mypageEdit(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
    	request.setAttribute("sessionId", session.getAttribute("sessionId"));
    	request.setAttribute("sessionPw", session.getAttribute("sessionPw"));
    	request.setAttribute("sessionName", session.getAttribute("sessionName"));
        return "/modify";
    }
	//회원정보
	@RequestMapping(value = "/modify/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewUser(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("user", userService.searchUser(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	//회원정보변경
	@RequestMapping(value = "/user/modify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateUser(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.editUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	//탈퇴
	@RequestMapping(value = "/user/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteUser(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.removeUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/payment.do") 
    public String payment(Model model) throws Exception{

        return "/payment";
    }
	
	
	
	
	
	
	
}
