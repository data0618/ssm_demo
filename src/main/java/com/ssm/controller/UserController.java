package com.ssm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.pojo.User;
import com.ssm.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;

	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		int pageSize = StringUtils.isBlank(request.getParameter("pageSize")) ? 8
				: Integer.parseInt(request.getParameter("pageSize"));
		int pageNum = StringUtils.isBlank(request.getParameter("pageNum")) ? 1
				: Integer.parseInt(request.getParameter("pageNum"));
		long totalCount = userService.size();
		long totalPages = (totalCount%pageSize)==0 ? totalCount/pageSize : (totalCount/pageSize)+1;
		// 设置分页的参数
		PageHelper.startPage(pageNum, pageSize); // PageHelper只对紧跟着的第一个SQL语句起作用
		List<User> list = this.userService.list();
		PageInfo<User> pagehelper = new PageInfo<>(list);
		pagehelper.setPages((int)totalPages);
		model.addAttribute("pagehelper", pagehelper);
		return "list";
	}
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model,@RequestParam String username, @RequestParam String password ) {
		int count = this.userService.count(username, password);
		if(count > 0){
			request.getSession().setAttribute("sessionUser", username);
			return "main";
		}
		request.getSession().setAttribute("sessionUser", null);
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("sessionUser");
		return "redirect:/";
	}

	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		return "add";
	}
	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model) {
		return "main";
	}

	@RequestMapping("/updateUser")
	public String update(HttpServletRequest request, Model model) {
		User user = new User();
		int userId = Integer.parseInt(request.getParameter("id"));
		String userName = request.getParameter("userName");
		String userPassWord = request.getParameter("userPassWord");
		int userAge = Integer.parseInt(request.getParameter("userAge"));
		user.setId(userId);
		user.setUserName(userName);
		user.setPassword(userPassWord);
		user.setAge(userAge);
		int status = this.userService.updateByPrimaryKey(user);
		model.addAttribute("status", status);
		return "addResult";
	}
	@RequestMapping("/showUser")
	public String showUser(HttpServletRequest request, Model model) {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = this.userService.getUserById(userId);
		model.addAttribute("user", user);
		return "showUser";
	}
	@ResponseBody
	@RequestMapping(value="getUser", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	public User getJson(HttpServletRequest request, Model model) {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = this.userService.getUserById(userId);
		return user;
	}

	@RequestMapping("/addResult")
	public String addUser(HttpServletRequest request, Model model) {
		User user = new User();
		String userName = request.getParameter("userName");
		String userPassWord = request.getParameter("userPassWord");
		int userAge = Integer.parseInt(request.getParameter("userAge"));
		user.setUserName(userName);
		user.setPassword(userPassWord);
		user.setAge(userAge);
		int status = this.userService.insertUser(user);
		model.addAttribute("status", status);
		return "addResult";
	}

}