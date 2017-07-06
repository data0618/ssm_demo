package com.ssm.service;

import java.util.List;

import com.ssm.pojo.User;

public interface IUserService {

    public User getUserById(int userId);
    public int insertUser(User record);
    public List<User> list();
    public long size();
    public int count(String userName, String passWord);
    public int updateByPrimaryKey(User record);
}