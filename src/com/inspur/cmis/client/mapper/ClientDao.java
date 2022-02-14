package com.inspur.cmis.client.mapper;

import java.util.ArrayList;
import java.util.List;

import com.inspur.cmis.client.model.Client;
import com.inspur.cmis.client.model.Nation;


public interface ClientDao {
	
	public List<Client> getClientListBypage(Client client);
	
	public int selectClientLidtCount();
	//查询民族列表
	public List<Nation> getNationList();
	public Client selectClient(int cm_id); //通过id查询单条记录
	public int updateClient(Client cli); //更新学习园地表
	
	public int add(Client client);
	
	//删除
	
		public int deleteClient(String[] ids);
	//查看
		
		//获取所有的客户经理编号
		public ArrayList<Integer> finAll();


	

}
