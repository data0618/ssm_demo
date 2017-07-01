package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);
    
    long size();
    
    User selectByPrimaryKey(Integer id);
    
    List<User> list();

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}