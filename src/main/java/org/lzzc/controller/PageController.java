package org.lzzc.controller;

import org.lzzc.pojo.OrderItem;
import org.lzzc.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 专门用于前台页面跳转的控制器
 *  @Author: lim
 *
 */
@Controller
@RequestMapping("")
public class PageController {
	@Autowired
	OrderItemService orderItemService;

	@RequestMapping("/loginPage")
	public String loginPage() {
		return "loginPage";
	}

	@RequestMapping("/registerSuccessPage")
	public String registerSuccessPage() {
		return "registerSuccessPage";
	}

	@RequestMapping("/registerPage")
	public String registerPage() {
		return "registerPage";
	}

	@RequestMapping("/test")
	public String testPage(Model model) {
		List<OrderItem> orderItems = orderItemService.getByOrderId(1);
		model.addAttribute("orderItems", orderItems);
		return "buyPage";
	}

	@RequestMapping("/payPage")
	public String payPage() {
		return "alipay";
	}

	@RequestMapping("/admin")
	public String admin() {
		return "admin/index";
	}
}
