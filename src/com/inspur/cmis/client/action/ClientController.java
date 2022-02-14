package com.inspur.cmis.client.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.inspur.cmis.client.model.Client;
import com.inspur.cmis.client.model.Nation;
import com.inspur.cmis.client.service.ClientService;
import com.inspur.cmis.learn.action.LearnController;
import com.inspur.cmis.learn.model.Learn;
import com.inspur.cmis.learn.service.LearnService;
import com.inspur.common.model.Pagination;

@Controller
@RequestMapping("/client")
public class ClientController {
	private static final Logger log = LoggerFactory.getLogger(LearnController.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	ClientService clientservice;
	
	
	@RequestMapping("/getClientListBypage")
	public String getClientListBypage(int pageNo,int pageSize,HttpServletRequest request) {
		Pagination<Client> page = new Pagination<Client>(pageNo,pageSize);
		log.debug("ClientSelectController getClientListByPage = "+page);

		/*机构  客户经理编号  姓名  状态*/
		String cm_unit = request.getParameter("cm_unit");
		String id = request.getParameter("cm_id");
		String cm_name = request.getParameter("cm_name");
		String cm_status = request.getParameter("cm_status");
		
		clientservice.getClientListBypage(page,cm_unit,id,cm_name,cm_status);
		request.setAttribute("clientList", page);
		
		ArrayList<Integer> allCmId=clientservice.finAll();
		request.setAttribute("allCmId", allCmId);
		
		//获取查询的机构  客户经理编号  姓名
		request.setAttribute("unit",cm_unit);
		request.setAttribute("r_id",id);
		request.setAttribute("name",cm_name);
		request.setAttribute("status",cm_status);
		
		return "/client/clientInfo";
		
	}
	
	  // 保存添加
	@RequestMapping("/ClientAdd")
    public String ClientAdd(HttpServletRequest request, HttpServletResponse response) {
    	//查询民族列表
    	List<Nation> nations =  clientservice.getNationList();
		request.setAttribute("nations", nations);
		//获取客户经理编号
		ArrayList<Integer> allCmId=clientservice.finAll();
		request.setAttribute("allCmId", allCmId);

    	return "client/clientInfoAdd";
    }

	  
    @RequestMapping("/ClientAddPost")
    public String ClientAddPost(@RequestParam("file") MultipartFile file,HttpServletRequest request, HttpServletResponse response) {
        try {
        	String uploadFileName = file.getOriginalFilename();
       	 	if ("".equals(uploadFileName) == false && uploadFileName != null){
          

	        //上传路径保存设置
	        String path = request.getServletContext().getRealPath("/upload");
	        
	        File realPath = new File(path);
	        if (!realPath.exists()){
	            realPath.mkdir();
	        }
	        //System.out.println("上传文件保存地址："+realPath);
	        InputStream is = file.getInputStream(); //文件输入流
	        OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流
	        int len=0;
	        byte[] buffer = new byte[1024];
	        /**
	         * 
			 * is.read()是一次读一个字节
			 * is.read(buffer)
			   is.read(buffer)将path的文件放入buffer作为内存缓冲区并获得可读的长度len
			      意思是一次读1024节
			      就像分段读一样
			      一次传进去一个1024长度的 buffer 而不是往buffer里边传
	         */
	        while ((len=is.read(buffer))!=-1){
	            os.write(buffer,0,len);
	            os.flush();
	        }
	        os.close();
	        is.close();
       	 	}
       	 	
        	String id = request.getParameter("cm_id");
        	String cm_name = request.getParameter("cm_name");
        	String cm_sex = request.getParameter("cm_sex");
        	String cm_ssn = request.getParameter("cm_ssn");
        	String cm_birthday = request.getParameter("cm_birthday");
        	String age = request.getParameter("cm_age");
        	String nation = request.getParameter("cm_nation");
        	String cm_political_landscape = request.getParameter("cm_political_landscape");
        	String cm_hometown = request.getParameter("cm_hometown");
        	/*String cm_photo = request.getParameter("cm_photo");*/
        	String cm_photo = uploadFileName;
        	String cm_education = request.getParameter("cm_education");
        	String cm_degree = request.getParameter("cm_degree");
        	String cm_graduated = request.getParameter("cm_graduated");
        	String cm_professional_titles = request.getParameter("cm_professional_titles");
        	String cm_level = request.getParameter("cm_level");
        	String cm_unit = request.getParameter("cm_unit");
        	String cm_dept = request.getParameter("cm_dept");
        	String cm_position = request.getParameter("cm_position");
        	String cm_hiredate = request.getParameter("cm_hiredate");
        	String cm_entry_time = request.getParameter("cm_entry_time");
        	String financial_years = request.getParameter("cm_financial_years");
        	String working_years = request.getParameter("cm_working_years");
        	String cm_exit_time = request.getParameter("cm_exit_time");
        	String cm_tel = request.getParameter("cm_tel");
        	String cm_mobile = request.getParameter("cm_mobile");
     
        	
        	Client client = new Client(); 
        	if("".equals(id) == false && id != null){
				int cm_id = Integer.parseInt(id);
				client.setCm_id(cm_id);
			}
        	client.setCm_name(cm_name);
        	client.setCm_sex(cm_sex);
        	client.setCm_ssn(cm_ssn);
        	client.setCm_birthday(cm_birthday);
        	if("".equals(age) == false && age != null){
				int cm_age = Integer.parseInt(age);
				client.setCm_age(cm_age);
			}
        	if("".equals(nation) == false && nation != null){
				int cm_nation = Integer.parseInt(nation);
				client.setCm_nation(cm_nation);
			}
        	client.setCm_political_landscape(cm_political_landscape);
        	client.setCm_hometown(cm_hometown);
        	client.setCm_photo(cm_photo);
        	client.setCm_education(cm_education);
        	client.setCm_degree(cm_degree);
        	client.setCm_graduated(cm_graduated);
        	client.setCm_professional_titles(cm_professional_titles);
        	client.setCm_level(cm_level);
        	client.setCm_unit(cm_unit);
        	client.setCm_dept(cm_dept);
        	client.setCm_position(cm_position);
        	client.setCm_hiredate(cm_hiredate);
        	client.setCm_entry_time(cm_entry_time);
        	if("".equals(financial_years) == false && financial_years != null){
				int cm_financial_years = Integer.parseInt(financial_years);
				client.setCm_financial_years(cm_financial_years);
			}
        	if("".equals(working_years) == false && working_years != null){
				int cm_working_years = Integer.parseInt(working_years);
				client.setCm_working_years(cm_working_years);
			}
        	client.setCm_exit_time(cm_exit_time);
        	client.setCm_tel(cm_tel);
        	client.setCm_mobile(cm_mobile);
        	
        	if(clientservice.add(client) > 0){
        		request.setAttribute("message", "添加成功！");
                return "redirect:/client/getClientListBypage?pageNo=1&pageSize=10";
        	}else {
                request.setAttribute("message", "添加失败！");
            }           
        	} catch (Exception exp) {
        		request.setAttribute("message", exp.getMessage());
        		exp.printStackTrace();
        	}
        return "client/clientInfo";      
    }

	//通过id查询单条记录
	@RequestMapping("/Update")
	public String toUpdateClient(HttpServletRequest request){
		String id = request.getParameter("id");
		int cm_id = Integer.parseInt(id);
		//查询单条记录
		Client client = clientservice.selectClient(cm_id);
		request.setAttribute("client", client); 
		//查询民族列表
		List<Nation> nations =  clientservice.getNationList();
		request.setAttribute("nations", nations);
		
		return "client/clientInfoUpdate";
	}
	//更新客户经理表
		@RequestMapping("/clientUpdateIds")
		public String clientUpdateIds(Client client,HttpServletRequest request){
			
			System.out.println(client.getCm_id());
			int result = clientservice.updateClient(client);
			if( result>0){
				log.debug("更新记录成功！");
				return "redirect:/client/getClientListBypage?pageNo=1&pageSize=10"; 
			}
			log.debug("更新记录失败！");
			return "client/clientInfoUpdate"; //返回修改信息页面	
		}
		
		//删除
  		@RequestMapping("/Delete")
  		public String Delete(HttpServletRequest request, HttpServletResponse response) {
  			String ids=request.getParameter("cm_id");
  			String[] cm_id=ids.split(",");
  			clientservice.deleteClient(cm_id);
  		   
  		    return "redirect:/client/getClientListBypage?pageNo=1&pageSize=10";
  		}
  		
  	//查看
  	@RequestMapping("/selectDetail")
  	public String selectDetail(HttpServletRequest request, HttpServletResponse response,int cm_id) {
  		Client client=clientservice.selectClient(cm_id);//查询用户信息
		List<Nation> nationList=clientservice.getNationList();
		request.setAttribute("nationList",nationList);
		request.setAttribute("clientlist",client);
		return "client/clientDetail";
		
		
		
  		
  	}
  	

	/*
	 * 数据校验
	 */
	@RequestMapping("/check")
	public String check(int cm_id,HttpServletRequest request){
		
		Client client=clientservice.selectClient(cm_id);
		if(client!=null){//从页面输入的编号和数据库里的相等，说明已经存在
			request.setAttribute("insertErr", "数据已经存在");
			request.setAttribute("cm_id", "");
			
		}
			request.setAttribute("cm_id", cm_id);
			//查询民族列表
			List<Nation> nations =clientservice.getNationList();
			request.setAttribute("nations", nations);
			return "client/clientInfoAdd";
	}
	

		
		

}
