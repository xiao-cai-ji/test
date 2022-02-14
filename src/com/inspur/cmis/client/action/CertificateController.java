package com.inspur.cmis.client.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.inspur.cmis.client.model.Certificate;
import com.inspur.cmis.client.model.Client;
import com.inspur.cmis.client.service.CertificateService;
import com.inspur.cmis.learn.action.LearnController;
import com.inspur.common.model.Pagination;

@Controller
@RequestMapping("/cert")
public class CertificateController {
	private static final Logger log = LoggerFactory.getLogger(LearnController.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	CertificateService certificateservice;

	@RequestMapping("/getCertListBypage")
	public String getClientListBypage(int pageNo, int pageSize, HttpServletRequest request) {

		
		Pagination<Certificate> page = new Pagination<Certificate>(pageNo, pageSize);
		String cm_id = request.getParameter("cm_id");
		String cm_year = request.getParameter("cm_year");
		String cm_name = request.getParameter("cm_name");

		certificateservice.getCertListBypage(page, cm_id, cm_year);

		request.setAttribute("CertList", page);
		request.setAttribute("cm_id", cm_id);
		request.setAttribute("cm_name", cm_name);
		request.setAttribute("cm_year", cm_year);

		/*
		 * // 查询客户姓名 //证书类型
		 */		
		List<Certificate> findtype=certificateservice.findtype();
		request.setAttribute("findtype", findtype);

		List<Certificate> certificate = certificateservice.fingClientname();
		request.setAttribute("client", certificate);
		
		//获取客户经理编号
		ArrayList<Integer> allCmId=certificateservice.finAll();
		request.setAttribute("allCmId", allCmId);

		return "client/clietOthers";
	}
	
	//添加的文件上传用的一种方法，修改是另一种方法
	@RequestMapping("/add")
	public String ClientAddPost(@RequestParam("file") MultipartFile file,HttpServletRequest request, HttpServletResponse response) {
		try {
		
			String uploadFileName = file.getOriginalFilename(); 
			System.out.println(uploadFileName);
			if("".equals(uploadFileName) == false && uploadFileName != null){
			  			  
			  //上传路径保存设置 
				String path = request.getServletContext().getRealPath("/upload");
			  
			  File realPath = new File(path); 
			  if (!realPath.exists()){ 
				  realPath.mkdir(); 
			  }

			  InputStream is = file.getInputStream(); //文件输入流 
			  OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流 
			  int len=0; 
			  byte[] buffer = new byte[1024];
			 /**
				 * 一次传进去一个1024长度的 buffer 而不是往buffer里边传
				 */
			  while ((len=is.read(buffer))!=-1){
			       os.write(buffer,0,len);
			       os.flush();
			  }
			    os.close();
			    is.close();
		      }
					 
		String id = request.getParameter("cm_id");
		String cm_certificate_name = request.getParameter("cm_certificate_name");
		String cm_certificate_type = request.getParameter("cm_certificate_type");
		String cm_certificate_no = request.getParameter("cm_certificate_no");
		String cm_certificate_unit = request.getParameter("cm_certificate_unit");
		String cm_start_date = request.getParameter("cm_start_date");
		String cm_end_date = request.getParameter("cm_end_date");
		String cm_remark = request.getParameter("cm_remark");
		String cm_modification_date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String cm_modification_person=(String) request.getSession().getAttribute("loginName");
		String cm_year=request.getParameter("cm_year");
	

		Certificate certificate = new Certificate();
		if ("".equals(id) == false && id != null) {
			int cm_id = Integer.parseInt(id);
			certificate.setCm_id(cm_id);
		}
		certificate.setCm_certificate_name(cm_certificate_name);
		certificate.setCm_certificate_type(cm_certificate_type);
		certificate.setCm_certificate_no(cm_certificate_no);
		certificate.setCm_certificate_unit(cm_certificate_unit);
		certificate.setCm_start_date(cm_start_date);
		certificate.setCm_end_date(cm_end_date);
		certificate.setCm_remark(cm_remark);
		certificate.setCm_modification_date(cm_modification_date);
		certificate.setCm_modification_person(cm_modification_person);
		certificate.setCm_year("2020");
		//有效性判断
				if(request.getParameter("cm_end_date")!=""){
					Date currentTime=new Date();//获取当前时间
					Date cm_end_date1=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("cm_end_date"));
					int date=currentTime.compareTo(cm_end_date1);
					if(date==1){
						certificate.setCm_period(2);//无效
					}
					else if(date==0){//当前时间等于失效时间 说明文件已经失效
						certificate.setCm_period(2);//失效
					}else{
						certificate.setCm_period(1);//有效
					}
				}
		
		int result=0;
		result = certificateservice.add(certificate);
		
		if(result>0) {
			Certificate certificate2=certificateservice.selectNew(certificate);
			certificateservice.updateCmInfo(certificate2);
		}
							
		 }catch(Exception exp){
			 request.setAttribute("message", exp.getMessage());
		 exp.printStackTrace();
		 }
		 
		return "redirect:/cert/getCertListBypage?pageNo=1&pageSize=10";

    }

	
	/*
	 * 修改
	 */
	@RequestMapping(value="/Update",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String Update(@RequestParam(value="cm_key") int cm_key,HttpServletRequest request) {
		
		Certificate certificate=certificateservice.selectCertificate(cm_key);
		String json=JSON.toJSONString(certificate);//json数据的转换
		request.setAttribute("certificateType", Integer.parseInt(certificate.getCm_certificate_type()));
		return json;
		
	}
	@RequestMapping("/update")
	public String update(@RequestParam("file") MultipartFile file ,Certificate certificate,HttpServletRequest request){
	
		String cm_modification_date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		certificate.setCm_modification_date(cm_modification_date);
		String cm_modification_person=(String) request.getSession().getAttribute("loginName");
		certificate.setCm_modification_person(cm_modification_person);
		int result=0;
		
		//调用文件上传
			if("".equals(file.getOriginalFilename())==false&&file.getOriginalFilename()!=null){
				String realPath=certificateservice.upload(file, request);//获取文件的保存路径
				certificate.setCm_certificate_url(realPath);//将文件路径保存到数据库

			}
			//有效性判断
			if(request.getParameter("cm_end_date")!=""){
				Date currentTime=new Date();//获取当前时间
				Date cm_end_date1;
				try {
					cm_end_date1 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("cm_end_date"));
					int date=currentTime.compareTo(cm_end_date1);
					if(date==1){
						certificate.setCm_period(2);//无效
					}
					else if(date==0){//当前时间等于失效时间 说明文件已经失效
						certificate.setCm_period(2);//失效
					}else{
						certificate.setCm_period(1);//有效
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}
			 
			result=certificateservice.update(certificate);//修改信息
			if(result>0){//当修改成功时 客户经理表自动更新
				
				//1.先查询已入库数据中发证时间最大的记录
				Certificate certificate2=certificateservice.selectNew(certificate);
				if(certificate2==null) {
					//修改之后，此类型的数据全都无效，需要将主表设置为空
					certificate.setCm_certificate_no("");
					certificate.setCm_start_date("");
					certificate.setCm_period(0);
					certificateservice.updateCmInfo(certificate);
	
				}else {

					//2.更新客户经理信息表
					certificateservice.updateCmInfo(certificate2);
				}
		
		}

		return "redirect:/cert/getCertListBypage?pageNo=1&pageSize=10";

	}
	
	
	
	
	
	/*
	 * 删除
	 */
	@RequestMapping("/Delete")
	@Transactional
	public String delete(String[] cm_key){
		try{
		//删除之前先查询所删除数据的客户经理编号和证书类型，若此条记录删除，此类型还有其他数据，自动将最新的数据填上，如果该类型下的数据为空了，那么主表数据为空
		List<Certificate> certificate=certificateservice.selectType(cm_key);
		int result=certificateservice.delete(cm_key);
		if(result>0){
			for (Certificate certificate2 : certificate) {
				//1.先查询已入库数据中发证时间最大的记录
				Certificate certificate3=certificateservice.selectNew(certificate2);
				if(certificate3==null){//删除之后表里没有这个类型的数据的时候
					certificate2.setCm_certificate_no("");
					certificate2.setCm_start_date("");
					certificate2.setCm_period(0);
					certificateservice.updateCmInfo(certificate2);
				}
				//2.更新客户经理信息表
				certificateservice.updateCmInfo(certificate3);
			}
		}	
		}catch(Exception e){
			System.out.println("删除");
		}
	
			return "redirect:/cert/getCertListBypage?pageNo=1&pageSize=10";
	

	}
	
	
}
