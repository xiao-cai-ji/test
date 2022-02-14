package com.inspur.cmis.permit.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.permit.login.model.LoginBean;
import com.inspur.cmis.permit.user.mapper.UserDao;
import com.inspur.cmis.permit.user.model.User;
import com.inspur.common.model.Pagination;


@Service
public class UserService{

    @Autowired
    UserDao userDao;

	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}
	
	public int add(User entity) throws Exception {
		if(entity.getCname()==null||entity.getCname().equals("")){
			throw new Exception("姓名必须不为空");
		}
		return userDao.add(entity);
	}

	
	 public List<User> updateById(int id){
		 List<User> user=userDao.updateById(id);
		 return user;
	 }
	 
	 public int updateUser(User user){
			int result=userDao.updateUser(user);
			return result;
		}
	 
	

	
	public List<User> getUser(User user) {
		return userDao.getUser(user);
	}
	//删除
	public int delete(int id) {
		return userDao.deleteUser(id);
	}
	
	public int deleteUser(String[] ids) {
		int rows=0;
		for(String idStr:ids) {
			int id=Integer.valueOf(idStr);
			rows+=delete(id);
		}
		return rows;
	}
	//启用
	public int open(int id) {
		return userDao.openUser(id);
	}
	public int openUser(String[] ids) {
		int rows=0;
		for (String idStr:ids) {
			int id=Integer.parseInt(idStr);
			rows+=open(id);
		}
		return rows;
	}
	
	//禁用
	public int close(int id) {
		return userDao.closeUser(id);
	}
	public int closeUser(String[] ids) {
		int rows=0;
		for (String idStr:ids) {
			int id=Integer.parseInt(idStr);
			rows+=close(id);
		}
		return rows;
	}
	//重置密码
	public int repass(int id) {
		return userDao.repassword(id);
	}
	public int rePass(String[] ids) {
		int rows=0;
		for (String idStr:ids) {
			int id=Integer.parseInt(idStr);
			rows+=repass(id);
		}
		return rows;
	}
	
	public void  getUserListByPage(Pagination<User> page,String name,String men_ids) {
		User user=new User();
		user.setPageNo((page.getPageNo()-1)*page.getPageSize());
		user.setPageSize(page.getPageSize());
		user.setCname(name);
		if("".equals(men_ids)==false && men_ids!=null) {
			int men_id=Integer.parseInt(men_ids);
			user.setMen_id(men_id);
		}

		List<User> users=userDao.getUserListByPage(user);
		Integer count=userDao.selectUserListCount();
		
		page.setList(users);
		page.setRowCount(count);
	}
	
}