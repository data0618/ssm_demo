package com.ssm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.sms.SmsService;

@Controller
@RequestMapping("/act")
public class ActionController {
	
	@RequestMapping("/validate")
	public String list(HttpServletRequest request, Model model) {
		String code = "a3s4";
		SmsService.getInstance().init(null, null, null, "{\"name\":\"帅哥\", \"password\":\""+ code +"\", \"time\":\"2017\"}");
		int result = SmsService.getInstance().sendMessCode();
		request.setAttribute("validateCode", code); 
		return "register";
	}
}
