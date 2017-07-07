package com.ssm.service;

import java.util.List;

import com.ssm.pojo.Department;
import com.ssm.pojo.User;
import com.ssm.pojo.UserDetail;

public interface IStructureService {
    
    List<Department>getAllDepartment();
    
    List<User>getDepartmentUser(Integer deptId);
    
    UserDetail getUser(Integer userId);
}
