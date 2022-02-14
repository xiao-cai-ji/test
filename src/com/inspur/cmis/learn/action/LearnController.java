package com.inspur.cmis.learn.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.inspur.cmis.learn.model.Learn;
import com.inspur.cmis.learn.service.LearnService;

import com.inspur.common.model.Pagination;

@Controller
@RequestMapping("/learn")
public class LearnController {

	private static final Logger log = LoggerFactory.getLogger(LearnController.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	LearnService learnservice;
	@RequestMapping("/getLearnListBypage")
	public String getLearnListBypage(int pageNo,int pageSize,HttpServletRequest request) {
		Pagination<Learn> page=new Pagination<Learn>(pageNo,pageSize);
		String l_name=request.getParameter("l_name");
        String l_types=request.getParameter("l_type");
        Learn user=new Learn();
        user.setL_name(l_name);
        request.setAttribute("users", user);
        
		learnservice.getLearnListBypage(page,l_name,l_types);
		 request.setAttribute("learnList",page);
         List<Learn>  typeList=learnservice.findLearnType();
		request.setAttribute("typeList", typeList);
		return "study/Studymain";
	}
	
	//更新
	@RequestMapping("/Updatelearn")
    public String EditUser(HttpServletRequest request, Model model) {
		int l_key=Integer.parseInt(request.getParameter("id"));//从首页页面获取到需要修改数据的id
		Learn learn=learnservice.updateById(l_key);
		
		request.setAttribute("learn", learn);
		return "study/StudyEditor";
		
    }
	
	
	@RequestMapping("/EditlearnPost")
	public String updateUser(@RequestParam("file") CommonsMultipartFile  file,HttpServletRequest request,HttpServletResponse response,HttpSession session){
		 try {
	        	String uploadFileName = file.getOriginalFilename();
	        	String path = request.getServletContext().getRealPath("/upload");

	            File realPath = new File(path);
	            if (!realPath.exists()){
	                realPath.mkdir();
	           }
	        if ("".equals(uploadFileName)==false&&uploadFileName!=null){
	        	 InputStream is = file.getInputStream(); //文件输入流
	             OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流

	             //读取写出
	             int len=0;
	             byte[] buffer = new byte[1024];
	             while ((len=is.read(buffer))!=-1){
	                 os.write(buffer,0,len);
	                 os.flush();
	            }
	             os.close();
	             is.close();
	       }
	        
	        	//从界面获取数据
	        	String key = request.getParameter("key");
	        	int l_Key = Integer.parseInt(key);
	        	String l_Name = request.getParameter("l_name");
	    		int l_Type=Integer.parseInt(request.getParameter("l_type"));
	    		String l_Des = request.getParameter("l_des");
	    		String l_Url=uploadFileName;
	    		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    		String l_Date = simpleDateFormat.format(new Date());//上传时间获取当前时间
	    		
	    		Learn learn=new Learn();
	    		//if("".equals(request.getParameter("l_key")) && request.getParameter("l_key")!=null) {
		        	
		    		
		        	//}
	    	
	    		learn.setL_key(l_Key);
	    		learn.setL_name(l_Name);
	    		learn.setL_type(l_Type);
	    		learn.setL_des(l_Des);
	    		learn.setL_url(l_Url);
	    		learn.setL_date(l_Date);
	    		learn.setL_uper("admin");
	        	
	        	
	        	int num=learnservice.updateLearn(learn);
	            if (num > 0) {
	                request.setAttribute("model", new Learn());
	                request.setAttribute("message", "修改成功！"); 
	               
	                return "redirect:/learn/getLearnListBypage?pageNo=1&pageSize=10";
	            } else {
	                request.setAttribute("model", learn);
	                request.setAttribute("message", "修改失败！"); 
	            }
	        } catch (Exception exp) {
	            request.setAttribute("message", exp.getMessage());
	            exp.printStackTrace();
	        }
	        return "study/StudyEditor";
	    }
	
	//删除
	@RequestMapping("/Delete")
	public String Delete(HttpServletRequest request, HttpServletResponse response) {
		String ids=request.getParameter("id");
		String[] l_key=ids.split(",");
		learnservice.deleteLearn(l_key);
	    request.setAttribute("learn", learnservice.getAllLearns());
	    return "redirect:/learn/getLearnListBypage?pageNo=1&pageSize=10";
	}
	
    // 保存添加用户Action
    @RequestMapping("/LearnAddPost")
    @Transactional
    public String saveAddFile(@RequestParam("file") CommonsMultipartFile file,HttpServletRequest request, HttpServletResponse response,HttpSession session) {
        try {
        	 //获取文件名 : file.getOriginalFilename();
            String uploadFileName = file.getOriginalFilename();
            if ("".equals(uploadFileName)==false&&uploadFileName!=null){
                String path = request.getServletContext().getRealPath("/upload");
                //如果路径不存在，创建一个
                File realPath = new File(path);
                if (!realPath.exists()){
                    realPath.mkdir();
               }

                InputStream is = file.getInputStream(); //文件输入流
                OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流

                //读取写出
                int len=0;
                byte[] buffer = new byte[1024];
                while ((len=is.read(buffer))!=-1){
                    os.write(buffer,0,len);
                    os.flush();
               }
                os.close();
                is.close();
           }

            String l_Name = request.getParameter("l_name");
            String l_Url = uploadFileName;
            String l_Type =request.getParameter("l_type");
            String l_Des =request.getParameter("l_des");
            String l_Date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            //String userName=(String)request.getSession().getAttribute("username");
            String ispublic1=request.getParameter("ispublic");
            Learn stu2 = new Learn();
            stu2.setL_name(l_Name);
            if("".equals(l_Type)==false&&l_Type!=null){
            	int l_type=Integer.parseInt(l_Type);
                stu2.setL_type(l_type);
            }
            if("".equals(ispublic1)==false&&ispublic1!=null){
            	int ispublic=Integer.parseInt(ispublic1);
                stu2.setIspublic(ispublic1);
            }
            stu2.setL_des(l_Des);
            stu2.setL_date(l_Date);
           // stu2.setL_uper(userName);
            stu2.setL_url(l_Url);
            stu2.setL_uper("admin");
            if (learnservice.add(stu2) > 0) {
                session.setAttribute("message", "添加成功！");
                return "redirect:/learn/getLearnListBypage?pageNo=1&pageSize=10";
            } else {
                request.setAttribute("model", stu2);
                session.setAttribute("er", "添加失败！");
                return "redirect:/study/StudyAdd";
            }
        } catch (Exception exp) {
        	request.setAttribute("message", exp.getMessage());
            exp.printStackTrace();
            throw new RuntimeException ("添加成功");
        }
    }
    //下载
    @RequestMapping(value="/down",method=RequestMethod.GET)
	public String down( HttpServletRequest request, HttpServletResponse response) throws IOException {
        //得到文件的保存路径
        String path = request.getSession().getServletContext().getRealPath("/upload");  
        String  fileName = request.getParameter("fileName");
        //1、设置response 响应头
        response.reset(); //设置页面不缓存,清空buffer
        response.setCharacterEncoding("UTF-8"); //字符编码
        response.setContentType("multipart/form-data"); //二进制传输数据
      //设置响应头
        response.setHeader("Content-Disposition",
                "attachment;fileName="+URLEncoder.encode(fileName, "UTF-8"));

        File file = new File(path,fileName);
      //2、 读取文件--输入流
        InputStream input=new FileInputStream(file);
        //3、 写出文件--输出流
        OutputStream out = response.getOutputStream();
        byte[] buff =new byte[1024];
        int index=0;
        //4、执行 写出操作
        while((index= input.read(buff))!= -1){
            out.write(buff, 0, index);
            out.flush();
       }
        out.close();
        input.close();
        return null;
     }
}
        
/*
 * //获取输入流 System.out.println(path); InputStream bis = new
 * BufferedInputStream(new FileInputStream(new File(path))); //转码，免得文件名中文乱码
 * l_url = URLEncoder.encode(l_url,"UTF-8"); //设置文件下载头
 * response.addHeader("Content-Disposition", "attachment;l_url=" +l_url);
 * //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
 * response.setContentType("multipart/form-data"); BufferedOutputStream out =
 * new BufferedOutputStream(response.getOutputStream()); int len = 0; while((len
 * = bis.read()) != -1){ out.write(len); out.flush(); } out.close();
 * 
 * }
 * 
 * }
 */