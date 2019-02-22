package com.baizhi.votesys.dao;

import com.baizhi.votesys.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User getUserByUsername(@Param("username") String username);

    User getUserByUsernameAndPassword(User user);

    int insertUser(User user);
}
