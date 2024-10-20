package org.lzzc.service;

import org.lzzc.mapper.OrderItemMapper;
import org.lzzc.pojo.Order;
import org.lzzc.pojo.OrderItem;
import org.lzzc.pojo.OrderItemExample;
import org.lzzc.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * OrderItemService 实现类
 *
	* @author lim
 */
@Service
public class OrderItemServiceImpl implements OrderItemService {

	@Autowired
	OrderItemMapper orderItemMapper;

	@Autowired
	ProductService productService;

	@Override
	public void add(OrderItem orderItem) {
		orderItemMapper.insert(orderItem);
	}

	@Override
	public OrderItem getById(Integer id) {
		OrderItem orderItem = orderItemMapper.selectByPrimaryKey(id);
		setProduct(orderItem);
		return orderItem;
	}

	@Override
	public List<OrderItem> getByOrderId(Integer order_id) {
		OrderItemExample example = new OrderItemExample();
		example.or().andOrder_idEqualTo(order_id);
		List<OrderItem> result = orderItemMapper.selectByExample(example);
		setProduct(result);
		return result;
	}

	@Override
	public void update(OrderItem orderItem) {
		orderItemMapper.updateByPrimaryKey(orderItem);
	}

	@Override
	public List<OrderItem> listByUserId(Integer user_id) {
		OrderItemExample example = new OrderItemExample();
		example.or().andUser_idEqualTo(user_id);
		List<OrderItem> result = orderItemMapper.selectByExample(example);
		setProduct(result);
		return result;
	}

	@Override
	public List<OrderItem> listForCart(Integer user_id) {
		OrderItemExample example = new OrderItemExample();
		example.or().andUser_idEqualTo(user_id).andOrder_idIsNull();
		List<OrderItem> result = orderItemMapper.selectByExample(example);
		setProduct(result);
		return result;
	}

	public void setProduct(List<OrderItem> ois) {
		for (OrderItem oi : ois) {
			setProduct(oi);
		}
	}

	private void setProduct(OrderItem oi) {
		Product p = productService.get(oi.getProduct_id());
		oi.setProduct(p);
	}

	@Override
	public void delete(Integer id) {
		orderItemMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void fill(List<Order> orders) {
		for (Order o : orders) {
			fill(o);
		}
	}

	@Override
	public void fill(Order order) {
		OrderItemExample example = new OrderItemExample();
		example.or().andOrder_idEqualTo(order.getId());
		example.setOrderByClause("id desc");
		List<OrderItem> orderItems = orderItemMapper.selectByExample(example);
		setProduct(orderItems);

		float total = 0;
		int totalNumber = 0;
		for (OrderItem oi : orderItems) {
			total += oi.getNumber() * oi.getProduct().getPrice();
			totalNumber += oi.getNumber();
		}
		order.setTotal(total);
		order.setTotalNumber(totalNumber);
		order.setOrderItems(orderItems);
	}
}
