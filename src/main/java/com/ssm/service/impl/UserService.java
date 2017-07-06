package com.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.dao.UserMapper;
import com.ssm.pojo.User;
import com.ssm.service.IUserService;

@Service("userService")
public class UserService implements IUserService {

    @Resource
    private UserMapper userDao;

    public User getUserById(int userId) {
        return this.userDao.selectByPrimaryKey(userId);
    }

	@Override
	public int insertUser(User record) {
		return this.userDao.insertSelective(record);
	}

	@Override
	public List<User> list() {
		return this.userDao.list();
	}

	@Override
	public long size() {
		return this.userDao.size();
	}

	@Override
	public int count(String userName, String passWord) {
		return this.userDao.count(userName, passWord);
	}

	@Override
	public int updateByPrimaryKey(User record) {
		return this.userDao.updateByPrimaryKeySelective(record);
	}

}