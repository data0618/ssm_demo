package com.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.dao.StructureMapper;
import com.ssm.pojo.Department;
import com.ssm.pojo.User;
import com.ssm.pojo.UserDetail;
import com.ssm.service.IStructureService;

@Service
public class StructureService implements IStructureService {

    @Resource
    private StructureMapper structureMapper;

    @Override
    public List<Department> getAllDepartment() {
        return structureMapper.searchAllDepartment();
    }

    @Override
    public List<User> getDepartmentUser(Integer deptId) {
        return structureMapper.searchUserByDepartment(deptId);
    }

    @Override
    public UserDetail getUser(Integer userId) {
        return structureMapper.searchUserById(userId);
    }

}
