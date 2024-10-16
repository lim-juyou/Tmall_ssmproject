package cn.lgzz.controller;

import cn.lgzz.pojo.User;
import cn.lgzz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * User 控制器
 *
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
