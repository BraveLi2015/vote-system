package com.baizhi.votesys.controller;

import com.baizhi.votesys.entity.User;
import com.baizhi.votesys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService us;

    @RequestMapping("/checkUsername")
    public @ResponseBody
    boolean checkUsername(String name) {
        return us.getUserByUsername(name);
    }

    @RequestMapping("/login")
    public @ResponseBody
    Map login(User user, HttpSession session) {
        //System.out.println("user = " + user);
        Map map = us.getUserByUsernameAndPassword(user);
        session.setAttribute("user", map.get("user"));
        //System.out.println("session = " + session.getAttribute("user"));
        return map;
    }

    @RequestMapping("/register")
    public @ResponseBody
    Map register(User user, HttpSession session) {
        Map map = us.register(user);
        session.setAttribute("user", map.get("user"));
        return map;
    }
}
