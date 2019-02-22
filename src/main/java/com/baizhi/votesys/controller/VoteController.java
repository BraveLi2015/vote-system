package com.baizhi.votesys.controller;


import com.baizhi.votesys.entity.*;
import com.baizhi.votesys.service.ListDtoService;
import com.baizhi.votesys.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.Map;

@Controller
@RequestMapping("/voteSubject")
public class VoteController {

    @Autowired
    private ListDtoService lds;

    @Autowired
    private SubjectService ss;

    @RequestMapping("/getVoteSubjectByPage")
    public @ResponseBody
    Map getVoteSubjectByPage(ListDto listDto, int page, int rows) {
        return lds.getByPage(listDto, page, rows);
    }

    @RequestMapping("/vote")
    public String vote(Item item, HttpSession session) {
        User user = (User) session.getAttribute("user");
        int userId = 22;
        if (user != null) {
            userId = user.getId();
        }
        item.setUserId(userId);
        ss.insertItem(item);
        return "redirect:/subjectList.jsp";
    }

    @RequestMapping("/getOptionsBySubjectId")
    public String getOptionsBySubjectId(int subjectId, Map map) {
        Subject subject = ss.getOptionBySubjectId(subjectId);
        map.put("subject", subject);
        return "vote";
    }

    @RequestMapping("/getMaintainSubjectBySubjectId")
    public @ResponseBody
    Subject getMaintainSubjectBySubjectId(int subjectId) {
        Subject subject = ss.getOptionBySubjectId(subjectId);
        return subject;
    }

    @RequestMapping("/addSubject")
    public @ResponseBody
    boolean addVoteSubject(Subject subject, OptionDto optionDto) {
        try {
            ss.insertSubject(subject, optionDto);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @RequestMapping("/multiDelete")
    public @ResponseBody
    boolean multiDelete(int[] ids) {
        System.out.println(ids);
        ss.multiDelete(ids);
        return true;
    }

    @RequestMapping("/maintain")
    public @ResponseBody
    boolean maintain(int subjectId, int subjectType, int[] deletedOptionIds, OptionDto optionDto) {
        /*System.out.println("***********" + subjectId);
        System.out.println("$$$$$$$$$$$" + subjectType);
        System.out.println("&&&&&&&&&&&" + optionDto);*/
        System.out.println("*****************" + Arrays.toString(deletedOptionIds));
        try {
            ss.insertNewOptions(subjectId, subjectType, deletedOptionIds, optionDto);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
