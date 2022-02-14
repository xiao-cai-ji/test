package com.inspur.cmis.client.mapper;

import java.util.ArrayList;
import java.util.List;

import com.inspur.cmis.client.model.Certificate;
import com.inspur.cmis.client.model.Client;


public interface CertificateDao {
	
	public int selectCertLidtCount();
	public List<Certificate> getcertListBypage(Certificate certificate);
	
	public List<Certificate> fingClientname();
	
	//添加
	public int add(Certificate certificate);
	
		//证件列表
		public List<Certificate> findtype();
		
		//查询已入库数据
		public Certificate selectNew(Certificate certificate);
		
		//往客户经理表添加数据
		public int updateCmInfo(Client client);
		
		
		//修改
				public Certificate selectCertificate(int cm_key);
				public int update(Certificate certificate);
				
		//删除
		//先查询
			public List<Certificate> selectType(String[] cm_key);
			
			public int delete(String[] cm_key);
			
	//获取所有的客户经理编号
			public ArrayList<Integer> finAll();
				
}
