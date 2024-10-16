package org.lzzc.pojo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
public class Review {
    @Setter
    private Integer id;

    private String content;

    @Setter
    private Integer user_id;

    @Setter
    private Integer product_id;

    @Setter
    private Date createDate;

    @Setter
    private User user;

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

}