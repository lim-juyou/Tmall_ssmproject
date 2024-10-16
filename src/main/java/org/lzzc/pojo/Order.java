package org.lzzc.pojo;

import lombok.Getter;

import java.util.Date;
import java.util.List;

@Getter
public class Order {
    private Integer id;

    private String order_code;

    private String address;

    private String post;

    private String receiver;

    private String mobile;

    private String user_message;

    private Date create_date;

    private Date pay_date;

    private Date delivery_date;

    private Date confirm_date;

    private Integer user_id;

    private String status;

    /*如下是非数据库字段*/
    private List<OrderItem> orderItems;

    private User user;

    private float total;

    private int totalNumber;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setOrder_code(String order_code) {
        this.order_code = order_code == null ? null : order_code.trim();
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public void setPost(String post) {
        this.post = post == null ? null : post.trim();
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public void setUser_message(String user_message) {
        this.user_message = user_message == null ? null : user_message.trim();
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public void setPay_date(Date pay_date) {
        this.pay_date = pay_date;
    }

    public void setDelivery_date(Date delivery_date) {
        this.delivery_date = delivery_date;
    }

    public void setConfirm_date(Date confirm_date) {
        this.confirm_date = confirm_date;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public void setTotalNumber(int totalNumber) {
        this.totalNumber = totalNumber;
    }

}