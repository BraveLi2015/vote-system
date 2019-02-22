package com.baizhi.votesys.service;

import com.baizhi.votesys.entity.Item;
import com.baizhi.votesys.entity.OptionDto;
import com.baizhi.votesys.entity.Subject;

public interface SubjectService {
    void insertSubject(Subject subject, OptionDto optionDto);

    void multiDelete(int[] ids);

    Subject getOptionBySubjectId(int subjectId);

    void insertItem(Item item);

    void insertNewOptions(int subjectId, int subjectType, int[] deletedOptionIds, OptionDto optionDto);
}
