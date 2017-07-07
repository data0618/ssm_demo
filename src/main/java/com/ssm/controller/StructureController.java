package com.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.pojo.Department;
import com.ssm.pojo.User;
import com.ssm.pojo.UserDetail;
import com.ssm.service.impl.StructureService;

@Controller
@RequestMapping(value = "/user")
public class StructureController {

    @Autowired
    private StructureService structureService;

    @RequestMapping(value = "structure", method = RequestMethod.GET)
    public ModelAndView structure() {

        List<Department> deptList = structureService.getAllDepartment();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("structure");
        mv.addObject("deptList", deptList);
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "departmentUser", method = RequestMethod.GET)
    public Map<String, Object> departmentUser(@RequestParam(required = true) Integer deptId) {

        List<User> userList = structureService.getDepartmentUser(deptId);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userList", userList);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "userDeatil", method = RequestMethod.GET)
    public Map<String, Object> userDeatil(@RequestParam(required = true) Integer userId, Model model) {

        UserDetail userDetail = structureService.getUser(userId);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userDetail", userDetail);
        return map;
    }
}
