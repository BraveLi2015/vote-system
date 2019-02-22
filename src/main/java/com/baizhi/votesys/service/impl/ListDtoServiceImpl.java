package com.baizhi.votesys.service.impl;

import com.baizhi.votesys.dao.ListDtoDao;
import com.baizhi.votesys.entity.ListDto;
import com.baizhi.votesys.service.ListDtoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ListDtoServiceImpl implements ListDtoService {

    @Autowired
    private ListDtoDao ldd;

    @Override
    public Map getByPage(ListDto listDto, int page, int pageSize) {
        Map map = new HashMap();
        int start = (page - 1) * pageSize + 1;
        int end = page * pageSize;
        List<ListDto> listDtoList = ldd.getByPage(listDto, start, end);
        map.put("rows", listDtoList);

        int count = ldd.getCount(listDto);
        map.put("total", count);
        return map;
    }
}
