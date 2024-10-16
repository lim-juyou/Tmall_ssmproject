package org.lzzc.pojo;

import lombok.Getter;
import lombok.Setter;

@Getter
public class Product {
	@Setter
    private Integer id;

	private String name;

	private String sub_title;

	@Setter
    private Float price;

	@Setter
    private Integer sale;

	@Setter
    private Integer stock;

	@Setter
    private Integer category_id;

	@Setter
    private Integer reviewCount;

    public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

    public void setSub_title(String sub_title) {
		this.sub_title = sub_title == null ? null : sub_title.trim();
	}

    public Integer getSaleXReviewCount() {
		return this.reviewCount * this.sale;
	}
}