package com.baizhi.votesys.service.impl;


import com.baizhi.votesys.dao.SubjectDao;
import com.baizhi.votesys.entity.Item;
import com.baizhi.votesys.entity.Option;
import com.baizhi.votesys.entity.OptionDto;
import com.baizhi.votesys.entity.Subject;
import com.baizhi.votesys.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class
SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectDao sd;

    @Override
    public void insertSubject(Subject subject, OptionDto optionDto) {
        sd.insertSubject(subject);
        List<Option> optionList = optionDto.getOptionList();
        for (Option option : optionList) {
            option.setSubjectId(subject.getId());
        }
        sd.insertOption(optionList);
    }

    @Override
    public void multiDelete(int[] ids) {
        sd.multiDelete(ids);
    }

    @Override
    public Subject getOptionBySubjectId(int subjectId) {
        return sd.getOptionsBySubjectId(subjectId);
    }

    @Override
    public void insertItem(Item item) {
        sd.insertItem(item);
    }

    @Override
    public void insertNewOptions(int subjectId, int subjectType, int[] deletedOptionIds, OptionDto optionDto) {
        sd.updateSubjectType(subjectId, subjectType);
        sd.updateOptionsType(deletedOptionIds);
        List<Option> optionList = optionDto.getOptionList();
        if (optionList.size() > 0) {
            for (Option option : optionList) {
                option.setSubjectId(subjectId);
            }
            sd.insertOption(optionList);
        }
    }
}
