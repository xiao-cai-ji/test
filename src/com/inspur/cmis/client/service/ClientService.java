package com.inspur.cmis.client.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.client.mapper.ClientDao;
import com.inspur.cmis.client.model.Client;
import com.inspur.cmis.client.model.Nation;

import com.inspur.common.model.Pagination;

@Service
public class ClientService {
	@Autowired
	ClientDao clientDao;
	public void getClientListBypage(Pagination<Client> page,String cm_unit,String id,String cm_name,String cm_status) {
		Client client=new Client();
		client.setPageNo((page.getPageNo()-1)*page.getPageSize());
		client.setPageSize(page.getPageSize());
		
		if("".equals(id) == false && id != null){
			int cm_id = Integer.parseInt(id);
			client.setCm_id(cm_id);
		}
		
		client.setCm_unit(cm_unit);
		client.setCm_name(cm_name);
		client.setCm_status(cm_status);
		
		List<Client> clients=clientDao.getClientListBypage(client);
		Integer count =clientDao.selectClientLidtCount();
		
		
		page.setList(clients);
		page.setRowCount(count);
	}
	
	//查询民族列表
		public List<Nation> getNationList(){
			return clientDao.getNationList();		
		}
		//查询单条客户经理信息记录
		public Client selectClient(int cm_id){
			return clientDao.selectClient(cm_id);
		}
		//更新客户经理信息表
		public int updateClient(Client cli){
			return clientDao.updateClient(cli);
		}
		//添加
				public int add(Client client) throws Exception {
				
					return clientDao.add(client);
				}
				//删除
				 public int deleteClient(String[] ids) {
					 return clientDao.deleteClient(ids);
				 }
				 
				//获取客户经理编号
					public ArrayList<Integer> finAll(){
						return clientDao.finAll();
					}
	

	
				 
}
