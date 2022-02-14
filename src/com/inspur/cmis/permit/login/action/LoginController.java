package com.inspur.cmis.permit.login.action;

import com.inspur.cmis.permit.login.model.LoginBean;
import com.inspur.cmis.permit.login.service.LoginService;
import com.inspur.common.util.ConstUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/login")
public class LoginController {

    private static final Logger log = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    LoginService loginService;
    @Resource
    HttpServletRequest request;

    @RequestMapping("/userLogin")
    public ModelAndView userLogin(LoginBean bean, Model model) {

        log.debug("LoginController userLogin bean=" + bean);
        LoginBean user = loginService.userLogin(bean);
        if(user == null){
        	 request.getSession().setAttribute("msg","用户密码错误！");
        }
        request.getSession().setAttribute(ConstUtils.USER_SESSION_KEY, user);
        request.getSession().setAttribute("loginName",user.getCname()); //在session中保存登录名
        return new ModelAndView("redirect:/login/main");
    }

    @RequestMapping("/main")
    public ModelAndView loginMain() {

        return new ModelAndView("main");
    }
    //获取 

}
