package org.lzzc.pojo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class OrderItem {
    private Integer id;

    private Integer product_id;

    private Integer order_id;

    private Integer user_id;

    private Integer number;

    private Product product;

}