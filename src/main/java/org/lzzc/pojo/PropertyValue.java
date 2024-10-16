package org.lzzc.pojo;

import lombok.Data;

@Data
public class PropertyValue {
    private Integer id;

    private Integer product_id;

    private Integer property_id;

    private String value;

    private Property property;


}