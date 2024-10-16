package org.lzzc.pojo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
public class ReferalLink {
    @Setter
    private Integer id;

    private String text;

    private String link;

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }
}