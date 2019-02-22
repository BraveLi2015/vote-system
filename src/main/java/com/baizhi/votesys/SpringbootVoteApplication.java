package com.baizhi.votesys;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.baizhi.votesys.dao")
public class SpringbootVoteApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootVoteApplication.class, args);
    }

}
