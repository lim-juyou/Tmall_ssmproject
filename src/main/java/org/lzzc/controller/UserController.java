package org.lzzc.controller;

import org.lzzc.pojo.User;
import org.lzzc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * User 控制器
 *@Author: lim
 *
 */
@Controller
@RequestMapping(value = "/admin" )
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/listUser")
	public String list(Model model) {
		List<User> users = userService.list();
		model.addAttribute("users", users);
		return "admin/listUser";
	}

	@RequestMapping("/editUser")
	public String edit(Model model, Integer id) {
		User user = userService.get(id);
		model.addAttribute("user", user);
		return "admin/editUser";
	}

	@RequestMapping("/updateUser")
	public String update(Integer id, String password) {
		userService.updatePassword(id, password);
		return "redirect:listUser";
	}
}
