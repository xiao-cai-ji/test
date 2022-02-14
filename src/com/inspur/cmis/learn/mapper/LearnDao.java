package com.inspur.cmis.learn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.inspur.cmis.learn.model.Learn;
import com.inspur.cmis.permit.user.model.User;



public interface LearnDao {
	
	public List<Learn> getLearnListBypage(Learn learn);
	
	public int selectLearnLidtCount();
	
	public List<Learn> findLearnType();
	
	public Learn updateById(@Param("id")  int id);
	
	public int updateLearn(Learn learn);
	
	public List<Learn> getAllLearns();
	
	//删除
	
	public int deleteLearn(String[] ids);
	//添加
	public int add(Learn learn);

}
