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
	
	//??????
	@RequestMapping("/Updatelearn")
    public String EditUser(HttpServletRequest request, Model model) {
		int l_key=Integer.parseInt(request.getParameter("id"));//?????????????????????????????????????????????id
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
	        	 InputStream is = file.getInputStream(); //???????????????
	             OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //???????????????

	             //????????????
	             int len=0;
	             byte[] buffer = new byte[1024];
	             while ((len=is.read(buffer))!=-1){
	                 os.write(buffer,0,len);
	                 os.flush();
	            }
	             os.close();
	             is.close();
	       }
	        
	        	//?????????????????????
	        	String key = request.getParameter("key");
	        	int l_Key = Integer.parseInt(key);
	        	String l_Name = request.getParameter("l_name");
	    		int l_Type=Integer.parseInt(request.getParameter("l_type"));
	    		String l_Des = request.getParameter("l_des");
	    		String l_Url=uploadFileName;
	    		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    		String l_Date = simpleDateFormat.format(new Date());//??????????????????????????????
	    		
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
	                request.setAttribute("message", "???????????????"); 
	               
	                return "redirect:/learn/getLearnListBypage?pageNo=1&pageSize=10";
	            } else {
	                request.setAttribute("model", learn);
	                request.setAttribute("message", "???????????????"); 
	            }
	        } catch (Exception exp) {
	            request.setAttribute("message", exp.getMessage());
	            exp.printStackTrace();
	        }
	        return "study/StudyEditor";
	    }
	
	//??????
	@RequestMapping("/Delete")
	public String Delete(HttpServletRequest request, HttpServletResponse response) {
		String ids=request.getParameter("id");
		String[] l_key=ids.split(",");
		learnservice.deleteLearn(l_key);
	    request.setAttribute("learn", learnservice.getAllLearns());
	    return "redirect:/learn/getLearnListBypage?pageNo=1&pageSize=10";
	}
	
    // ??????????????????Action
    @RequestMapping("/LearnAddPost")
    @Transactional
    public String saveAddFile(@RequestParam("file") CommonsMultipartFile file,HttpServletRequest request, HttpServletResponse response,HttpSession session) {
        try {
        	 //??????????????? : file.getOriginalFilename();
            String uploadFileName = file.getOriginalFilename();
            if ("".equals(uploadFileName)==false&&uploadFileName!=null){
                String path = request.getServletContext().getRealPath("/upload");
                //????????????????????????????????????
                File realPath = new File(path);
                if (!realPath.exists()){
                    realPath.mkdir();
               }

                InputStream is = file.getInputStream(); //???????????????
                OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //???????????????

                //????????????
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
                session.setAttribute("message", "???????????????");
                return "redirect:/learn/getLearnListBypage?pageNo=1&pageSize=10";
            } else {
                request.setAttribute("model", stu2);
                session.setAttribute("er", "???????????????");
                return "redirect:/study/StudyAdd";
            }
        } catch (Exception exp) {
        	request.setAttribute("message", exp.getMessage());
            exp.printStackTrace();
            throw new RuntimeException ("????????????");
        }
    }
    //??????
    @RequestMapping(value="/down",method=RequestMethod.GET)
	public String down( HttpServletRequest request, HttpServletResponse response) throws IOException {
        //???????????????????????????
        String path = request.getSession().getServletContext().getRealPath("/upload");  
        String  fileName = request.getParameter("fileName");
        //1?????????response ?????????
        response.reset(); //?????????????????????,??????buffer
        response.setCharacterEncoding("UTF-8"); //????????????
        response.setContentType("multipart/form-data"); //?????????????????????
      //???????????????
        response.setHeader("Content-Disposition",
                "attachment;fileName="+URLEncoder.encode(fileName, "UTF-8"));

        File file = new File(path,fileName);
      //2??? ????????????--?????????
        InputStream input=new FileInputStream(file);
        //3??? ????????????--?????????
        OutputStream out = response.getOutputStream();
        byte[] buff =new byte[1024];
        int index=0;
        //4????????? ????????????
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
 * //??????????????? System.out.println(path); InputStream bis = new
 * BufferedInputStream(new FileInputStream(new File(path))); //????????????????????????????????????
 * l_url = URLEncoder.encode(l_url,"UTF-8"); //?????????????????????
 * response.addHeader("Content-Disposition", "attachment;l_url=" +l_url);
 * //1.????????????ContentType?????????????????????????????????????????????????????????
 * response.setContentType("multipart/form-data"); BufferedOutputStream out =
 * new BufferedOutputStream(response.getOutputStream()); int len = 0; while((len
 * = bis.read()) != -1){ out.write(len); out.flush(); } out.close();
 * 
 * }
 * 
 * }
 */