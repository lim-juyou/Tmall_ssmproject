package org.lzzc.pojo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
public class Category {
    @Setter
    private Integer id;

    private String name;

    @Setter
    private List<Product> products;

    @Setter
    private List<List<Product>> productByRow;

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

}