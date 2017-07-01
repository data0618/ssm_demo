package com.ssm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		int pageSize = StringUtils.isBlank(request.getParameter("pageSize")) ? 10
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

	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		return "add";
	}
	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model) {
		return "main";
	}

	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request, Model model) {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = this.userService.getUserById(userId);
		model.addAttribute("user", user);
		return "user";
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