package com.baizhi.votesys.entity;

public class ListDto {
    private int subjectId;
    private String subjectTitle;
    private int optionCount;
    private int votePersonCount;
    private int voteStatus;

    public ListDto() {
    }

    public ListDto(int subjectId, String subjectTitle, int optionCount, int votePersonCount, int voteStatus) {
        this.subjectId = subjectId;
        this.subjectTitle = subjectTitle;
        this.optionCount = optionCount;
        this.votePersonCount = votePersonCount;
        this.voteStatus = voteStatus;
    }

    @Override
    public String toString() {
        return "ListDto{" +
                "subjectId=" + subjectId +
                ", subjectTitle='" + subjectTitle + '\'' +
                ", optionCount=" + optionCount +
                ", votePersonCount=" + votePersonCount +
                ", voteStatus=" + voteStatus +
                '}';
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubjectTitle() {
        return subjectTitle;
    }

    public void setSubjectTitle(String subjectTitle) {
        this.subjectTitle = subjectTitle;
    }

    public int getOptionCount() {
        return optionCount;
    }

    public void setOptionCount(int optionCount) {
        this.optionCount = optionCount;
    }

    public int getVotePersonCount() {
        return votePersonCount;
    }

    public void setVotePersonCount(int votePersonCount) {
        this.votePersonCount = votePersonCount;
    }

    public int getVoteStatus() {
        return voteStatus;
    }

    public void setVoteStatus(int voteStatus) {
        this.voteStatus = voteStatus;
    }
}
