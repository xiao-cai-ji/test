package com.inspur.cmis.learn.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.inspur.cmis.learn.mapper.LearnDao;
import com.inspur.cmis.learn.model.Learn;
import com.inspur.cmis.permit.user.model.User;
import com.inspur.common.model.Pagination;

@Service
public class LearnService {
	@Autowired
	LearnDao learnDao;
	
	
	public void getLearnListBypage(Pagination<Learn> page,String l_name,String l_type) {
		Learn learn=new Learn();
		learn.setPageNo((page.getPageNo()-1)*page.getPageSize());
		learn.setPageSize(page.getPageSize());
		learn.setL_name(l_name);
		if("".equals(l_type)==false && l_type!=null){
			int l_types=Integer.parseInt(l_type);
			learn.setL_type(l_types);
		}
	
		List<Learn> learns=learnDao.getLearnListBypage(learn);
		Integer count =learnDao.selectLearnLidtCount();
		
		page.setList(learns);
		page.setRowCount(count);
		
	}
	public List<Learn> findLearnType() {
		return learnDao.findLearnType();
	}
	
	 public Learn updateById(int id){
		 Learn learn=learnDao.updateById(id);
		 return learn;
	 }
	
	 public int updateLearn(Learn learn){
			int result=learnDao.updateLearn(learn);
			return result;
		}
	 
	 //获取全部
	 public List<Learn> getAllLearns() {
			return learnDao.getAllLearns();
		}
	 
	 //删除
	 public int deleteLearn(String[] ids) {
		 return learnDao.deleteLearn(ids);
	 }
	 
	 
	//添加
		
		public int add(Learn learn) throws Exception {
			return learnDao.add(learn);
		}
		
		// 文件上传
		/*public String upload(MultipartFile file,HttpServletRequest request){
			//获取当前时间，便于区分文件的名称
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
			String res=sdf.format(new Date());
			//上传路径保存设置
				//自定义的保存路径 String realPath="D:/eclipse-workspace/ssm-workspace/cmiManager/WebContent";
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
	}*/
		

	
	

}
