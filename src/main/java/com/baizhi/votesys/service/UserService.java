package com.baizhi.votesys.service;

import com.baizhi.votesys.entity.User;

import java.util.Map;

public interface UserService {

    boolean getUserByUsername(String username);

    Map getUserByUsernameAndPassword(User user);

    Map register(User user);
}
