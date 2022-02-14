package com.inspur.cmis.client.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.inspur.cmis.client.mapper.CertificateDao;
import com.inspur.cmis.client.model.Certificate;
import com.inspur.cmis.client.model.Client;

import com.inspur.common.model.Pagination;

@Service
public class CertificateService {
	@Autowired
	CertificateDao certificateDao;
	public void getCertListBypage(Pagination<Certificate> page,String cm_id,String cm_year) {
		Certificate certificate=new Certificate();
		certificate.setPageNo((page.getPageNo()-1)*page.getPageSize());
		certificate.setPageSize(page.getPageSize());
		if("".equals(cm_id) == false && cm_id != null){
			int cm_ids = Integer.parseInt(cm_id);
			certificate.setCm_id(cm_ids);
		}
		
		certificate.setCm_year(cm_year);
		
		List<Certificate> certs=certificateDao.getcertListBypage(certificate);
		Integer counnt =certificateDao.selectCertLidtCount();
		
		page.setList(certs);
		page.setRowCount(counnt);
		
	}
	//获取主表的姓名显示在维护表上
	public List<Certificate> fingClientname() {
		List<Certificate> certificate=certificateDao.fingClientname();
		return certificate;
	}
	//查询
	public List<Certificate> findtype(){
		return certificateDao.findtype();
	}
	
	
	
	
	
	
	//添加
	public int add(Certificate certificate) throws Exception {
		
		return certificateDao.add(certificate);
	}
	
	//查询当前入库数据中发证时间最大的数据
		public Certificate selectNew(Certificate certificate){
			
			return certificateDao.selectNew(certificate);
		}
		
		//更新客户经理表
		public  int  updateCmInfo(Certificate certificate2){
			int result=0;
			//从查询的结果集中获取以下值
			int cm_id=certificate2.getCm_id();//客户经理编号
			String cm_certificate_no=certificate2.getCm_certificate_no();//证书编号
			
			String cm_start_date=certificate2.getCm_start_date();//证书发证时间
			int cm_period=certificate2.getCm_period();//证书有效性
			
			//判断添加的证书类型
			//1).如果是岗位证书，更新主表
			if(("1").equals(certificate2.getCm_certificate_type())){

			Client client=new Client();
			client.setCm_id(cm_id);
			client.setCm_status_number(cm_certificate_no);
			client.setCm_status_number_date(cm_start_date);
			client.setCm_status_number_period(cm_period);
			client.setCm_certificate_type(certificate2.getCm_certificate_type());
			//调用客户经理信息更新表  
			result=certificateDao.updateCmInfo(client);

			}
			//2).如果是从业资格证书，更新主表
			if(("0").equals(certificate2.getCm_certificate_type())){
				Client client=new Client();
				client.setCm_id(cm_id);
				client.setCm_certificate_number(cm_certificate_no);//从业资格证书编号
				client.setCm_certificate_date(cm_start_date);//从业证书发证时间
				client.setCm_certificate_period(cm_period);//从业证书有效性
				client.setCm_certificate_type(certificate2.getCm_certificate_type());
				//调用客户经理信息更新表  
				result=certificateDao.updateCmInfo(client);
			
		}
			
			//3).如果是等级资格证书，更新主表
			if(("2").equals(certificate2.getCm_certificate_type())){
				Client client=new Client();
				client.setCm_id(cm_id);
				client.setCm_level_number(cm_certificate_no);//等级资格证书编号
				client.setCm_level_date(cm_start_date);//等级资格证书发证时间
				client.setCm_level_period(cm_period);//等级资格证书有效性
				client.setCm_certificate_type(certificate2.getCm_certificate_type());
				//调用客户经理信息更新表  
				result=certificateDao.updateCmInfo(client);
				
				
				
			}
			
			return result;
		}
		
		
		
		
		
		
		/*
		 * 文件上传
		 */
		public String upload(MultipartFile file,HttpServletRequest request){
				//获取当前时间，便于区分文件的名称
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
				String res=sdf.format(new Date());
				//上传路径保存设置
					
			       String realPath = request.getServletContext().getRealPath("WEB-INF/upload");
			       //获取文件名
			       String fileName=file.getOriginalFilename();
			       //新文件名
			       String newFileName=res+fileName;
			      //新文件
			       File targetFile=new File(realPath+"\\"+newFileName);
			       //如果路径不存在 建立一个
			       if(!targetFile.getParentFile().exists()){
			    	   targetFile.mkdirs();
			       }
			       try {
					file.transferTo(targetFile);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			       String url=realPath+'\\'+newFileName;
			       return url;
		}
		
	
		
		
		//修改
		public Certificate selectCertificate(int cm_key){
			return certificateDao.selectCertificate(cm_key);
		}
		public int update(Certificate certificate){
			return certificateDao.update(certificate);
		}
		
		
		
		
		
		//删除
		public List<Certificate> selectType(String[] cm_key){
			return certificateDao.selectType(cm_key);
		}
		public int delete(String[] cm_key){
			return certificateDao.delete(cm_key);
		}
		
		//获取客户经理编号
		public ArrayList<Integer> finAll(){
			return certificateDao.finAll();
		}

	
		
 }
