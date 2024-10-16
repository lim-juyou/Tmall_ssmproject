package org.lzzc.pojo;

import lombok.Getter;
import lombok.Setter;

@Getter
public class Property {
    @Setter
    private Integer id;

    private String name;

    @Setter
    private Integer category_id;

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

}