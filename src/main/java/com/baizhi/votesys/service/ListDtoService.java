package com.baizhi.votesys.service;


import com.baizhi.votesys.entity.ListDto;

import java.util.Map;

public interface ListDtoService {
    Map getByPage(ListDto listDto, int page, int pageSize);
}
