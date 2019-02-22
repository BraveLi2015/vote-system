package com.baizhi.votesys.service.impl;

import com.baizhi.votesys.dao.UserDao;
import com.baizhi.votesys.entity.User;
import com.baizhi.votesys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao ud;

    @Override
    public boolean getUserByUsername(String username) {
        User user = ud.getUserByUsername(username);
        if (user == null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Map getUserByUsernameAndPassword(User user) {
        Map map = new HashMap();
        User u = ud.getUserByUsernameAndPassword(user);
        if (u != null) {
            map.put("isLogin", true);
            map.put("user", u);
        } else {
            map.put("isLogin", false);
        }
        return map;
    }

    @Override
    public Map register(User user) {
        Map map = new HashMap();
        int i = ud.insertUser(user);
        if (i > 0) {
            map.put("isRegister", true);
            map.put("user", user);
        } else {
            map.put("isRegister", false);
        }
        return map;
    }
}
