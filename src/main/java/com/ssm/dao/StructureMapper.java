package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.Department;
import com.ssm.pojo.User;
import com.ssm.pojo.UserDetail;

public interface StructureMapper {

    List<Department> searchAllDepartment();

    List<User> searchUserByDepartment(@Param("deptId") Integer deptId);

    UserDetail searchUserById(@Param("userId") Integer userId);

}
