package com.baizhi.votesys.dao;

import com.baizhi.votesys.entity.Item;
import com.baizhi.votesys.entity.Option;
import com.baizhi.votesys.entity.Subject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SubjectDao {
    int insertSubject(Subject subject);

    int insertOption(List<Option> optionList);

    void multiDelete(int[] ids);

    Subject getOptionsBySubjectId(int subjectId);

    void insertItem(Item item);

    void updateSubjectType(@Param("subjectId") int subjectId, @Param("subjectType") int subjectType);

    void updateOptionsType(int[] deletedOptionIds);
}
