package com.david.JobTracker.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.david.JobTracker.services.JobService;
import com.david.JobTracker.services.UserService;
import com.david.JobTracker.models.Job;
import com.david.JobTracker.models.User;

@Controller
public class UserController {
	private UserService uS;
	private JobService jS;
	
	public UserController(UserService uS, JobService jS) {
		this.uS = uS;
		this.jS = jS;
	}
	
	@GetMapping("/")
	public String logReg(@ModelAttribute("user") User user, @ModelAttribute("job") Job job) {
		return "landing";
	}
	
	@GetMapping("/loginPage")
	public String loginPage(@ModelAttribute("user") User user) {
		return "login";
	}
	
	@GetMapping("/home")
	public String homePage(@ModelAttribute("user") User user) {
		return "landing";
	}
	
	@GetMapping("/registerPage")
	public String registerPage(@ModelAttribute("user") User user) {
		return "register";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult res, Model model) {
		if(res.hasErrors()) {
			return "register";
		} else {
			if(!user.getPassword().equals(user.getConfirm())) {
				model.addAttribute("userError", "Passwords dont match");
				return "register";
			} else {
				String pw = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
				user.setPassword(pw);
				
				User exists= uS.findByEmail(user.getEmail());
				if(exists != null) {
					model.addAttribute("userError", "A user with this email already exists");
					return "register";
				} else {
					uS.create(user);
					return "redirect:/landing";
				}
			}
		}
	}
	
	@PostMapping("/login")
	public String login( @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
		if(email.length() < 1) {
			model.addAttribute("loginError", "Invalid Credentials");
			model.addAttribute("user", new User());
			return "login";
		}
		if(password.length() < 8) {
			model.addAttribute("loginError", "Invalid Credentials");
			model.addAttribute("user", new User());
			return "login";
		}
		
		User u = uS.findByEmail(email);
		
		if(u == null) {
			model.addAttribute("loginError", "Invalid Credentials");
			model.addAttribute("user", new User());
			return "login";
		} else {
			boolean matches = BCrypt.checkpw(password, u.getPassword());
			
			if(matches) {
				session.setAttribute("user", u.getId());
				session.setAttribute("username", u.getName());
				return "redirect:/landing";
				} else {
					model.addAttribute("loginError", "Invalid Credentials");
					model.addAttribute("user", new User());
					return "login";
				}
			}
		}
	
	@GetMapping("/landing")
	public String postLogin(Model model, HttpSession session, @ModelAttribute("job") Job job) {
		Long id = (Long) session.getAttribute("user");
		
		
		if(id == null) {
			return "redirect:/";
		} else {
			
			User u = uS.findById(id);
			model.addAttribute("user", u);
			List<Job> jobs = jS.allJobs();
			model.addAttribute("jobs", jobs);
			return "landing";
		}
	}
	
	@GetMapping("/deleteSession")
	public String deleteSession(HttpSession session) {
		session.invalidate();
		return "landing";
	}

	

	


}
