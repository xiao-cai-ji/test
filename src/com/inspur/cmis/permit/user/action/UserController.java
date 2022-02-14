package com.inspur.cmis.permit.user.action;

import com.inspur.cmis.permit.user.model.User;
import com.inspur.cmis.permit.user.service.UserService;
import com.inspur.common.model.Pagination;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	UserService userservice;
	//获取全部用户资料
	@RequestMapping("/listuser")
	public String ListUser(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("users", userservice.getAllUsers());
		return "user/ListUser";
	}
	//可以添加用户
	@RequestMapping("/addUser")
	public String addUser(HttpServletRequest request, HttpServletResponse response) {
		try {

			String cname = request.getParameter("name");
			String sex = request.getParameter("sex");
			String born=request.getParameter("born");
			String roleided = request.getParameter("roleid");
			int roleids = Integer.parseInt(roleided);
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
			String register_time=simpleDateFormat.format(new Date());
			String last_time=simpleDateFormat.format(new Date());
			String isenable=request.getParameter("isenable");

			User entity = new User();
			entity.setCname(cname);
			entity.setMen_sex(sex);
			entity.setRoleid(roleids);
			entity.setMen_born(born);
			entity.setRegister_time(register_time);
			entity.setLast_time(last_time);
			entity.setIsenable(isenable);

			if (userservice.add(entity) > 0) {
				request.setAttribute("message", "添加成功！");
				return "redirect:/user/getUserListBypage?pageNo=1&pageSize=10";
			} else {
				request.setAttribute("message", "添加失败！");
			}
		} catch (Exception exp) {
			request.setAttribute("message", exp.getMessage());
			exp.printStackTrace();
		}
		return "user/AddUser";
	}
	//获取用户ID根据用户ID查询用户信息并绑定到修改页面
	@RequestMapping("/Updateuser")
    public String EditUser(HttpServletRequest request, Model model) {
		int men_id=Integer.parseInt(request.getParameter("id"));
		List<User> user=userservice.updateById(men_id);
		model.addAttribute("user",user);
		return "user/EditUser";
		
    }
    //修改页面
	@RequestMapping("/EdituserPost")
	public String updateUser(User user1,HttpServletRequest request){
		int result=userservice.updateUser(user1);
		if(result>0){
			System.out.println("更改成功");
			return "redirect:/user/getUserListBypage?pageNo=1&pageSize=10";
		}else{
			request.setAttribute("insertErr", "更新失败");
			return "user/EditUser";
		}
	}
	
	
	
	//可以查找用户
	@RequestMapping("/selectUser")
	public String  SelectUser(HttpServletRequest request, HttpServletResponse response,Model model) {
		String name=request.getParameter("cname");
		String id=request.getParameter("men_id");
		User user=new User();
		user.setCname(name);
		if("".equals(id)==false && id!=null) {
			int men_ids=Integer.parseInt(id);
			user.setMen_id(men_ids);
		}
		model.addAttribute("users", userservice.getUser(user));
		return "redirect:/user/getUserListBypage?pageNo=1&pageSize=10";
		
	}
	//可以删除用户
	@RequestMapping("/Delete")
	public String Delete(HttpServletRequest request, HttpServletResponse response) {
		String ids=request.getParameter("id");
		String[] med_id=ids.split(",");
		if(med_id!=null && med_id.length>0) {
			request.setAttribute("message", userservice.deleteUser(med_id)>0 ? "删除成功！" : "删除失败！");
		}else {
			request.setAttribute("message","请选择删除的项");
		}
	    request.setAttribute("users", userservice.getAllUsers());
	    return "redirect:/user/getUserListBypage?pageNo=1&pageSize=10";
	}
	//启用用户可以
	@RequestMapping("/openUser")
	public String openUser(HttpServletRequest request, HttpServletResponse response) {
		String ids=request.getParameter("id");
		String[] med_id=ids.split(",");
		if(med_id!=null && med_id.length>0) {
			request.setAttribute("message", userservice.openUser(med_id)>0 ? "启用成功！" : "启用失败！");
		}else {
			request.setAttribute("message","请选择启用的对象");
		}
	    request.setAttribute("users", userservice.getAllUsers());
	    return "redirect:/user/getUserListBypage?pageNo=1&pageSize=10";
	}
	
	//禁用可以
	@RequestMapping("/closeUser")
	public String closeUser(HttpServletRequest request, HttpServletResponse response) {
		String ids=request.getParameter("id");
		String[] med_id=ids.split(",");
		if(med_id!=null && med_id.length>0) {
			request.setAttribute("message", userservice.closeUser(med_id)>0 ? "禁用成功！" : "禁用失败！");
		}else {
			request.setAttribute("message","请选择禁用的对象");
		}
	    request.setAttribute("users", userservice.getAllUsers());
	    return "redirect:/user/getUserListBypage?pageNo=1&pageSize=10";
	}
	
	//修改密码可以重置密码为123456
	@RequestMapping("/repass")
	public String repass(HttpServletRequest request, HttpServletResponse response) {
		String ids=request.getParameter("id");
		String[] med_id=ids.split(",");
		if(med_id!=null && med_id.length>0) {
			request.setAttribute("message", userservice.rePass(med_id)>0 ? "修改密码成功！" : "修改密码失败！");
		}else {
			request.setAttribute("message","请选择修改的对象");
		}
	    request.setAttribute("users", userservice.getAllUsers());
	    return "redirect:/user/getUserListBypage?pageNo=1&pageSize=10";
	}
	//分页
	@RequestMapping("/getUserListBypage")
	public String getUserListBypage(int pageNo,int pageSize,HttpServletRequest request) {
		Pagination<User> page=new Pagination<User>(pageNo,pageSize);
		String name=request.getParameter("cname");
		String id=request.getParameter("men_id");
		userservice.getUserListByPage(page,name,id);
		
		request.setAttribute("userList", page);
		return "user/ListUser";
	}
	



}
