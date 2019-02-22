package com.baizhi.votesys.dao;

import com.baizhi.votesys.entity.ListDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ListDtoDao {
    List<ListDto> getByPage(@Param("listDto") ListDto listDto, @Param("start") int start, @Param("end") int end);

    int getCount(@Param("listDto") ListDto listDto);
}
