package com.baizhi.votesys.entity;

import java.util.Arrays;

public class Item {
    private int itemId;
    private int userId;
    private int subjectId;
    private int[] optionIds;

    public Item() {
    }

    public Item(int itemId, int userId, int subjectId, int[] optionIds) {
        this.itemId = itemId;
        this.userId = userId;
        this.subjectId = subjectId;
        this.optionIds = optionIds;
    }

    @Override
    public String toString() {
        return "Item{" +
                "itemId=" + itemId +
                ", userId=" + userId +
                ", subjectId=" + subjectId +
                ", optionIds=" + Arrays.toString(optionIds) +
                '}';
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public int[] getOptionIds() {
        return optionIds;
    }

    public void setOptionIds(int[] optionIds) {
        this.optionIds = optionIds;
    }
}
