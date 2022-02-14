package com.inspur.cmis.permit.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.inspur.cmis.permit.login.model.LoginBean;
import com.inspur.cmis.permit.user.model.User;



public interface UserDao {
	/**
	 * 获得user
	 */
	
	//获取所用的用户
	public List<User> getAllUsers();
	//添加用户
	public int add(User entity);
	
	
	public List<User> getUser(User user);
	//删除用户
	public int deleteUser(int id);
	//启用用户
	public int openUser(int id);
	//禁用该用户
	public int closeUser(int id);
	//修改密码
	public int repassword(int id);
	
	public List<User> updateById(@Param("id")  int id);
	
	public int updateUser(User user);
	
	public List<User> getUserListByPage(User user);
	
	public int selectUserListCount();
	
}
