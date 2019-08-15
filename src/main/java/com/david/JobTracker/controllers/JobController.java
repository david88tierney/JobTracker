package com.david.JobTracker.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import com.david.JobTracker.models.Job;
import com.david.JobTracker.models.User;
import com.david.JobTracker.services.JobService;
import com.david.JobTracker.services.UserService;

@Controller

public class JobController {
	private UserService uS;
	private JobService jS;
	
	public JobController(UserService uS, JobService jS) {
		this.uS = uS;
		this.jS = jS;
	}
//	Will direct you to the page to add a job
	
	@GetMapping("/add")
    public String addRoute(@ModelAttribute("job") Job job, @ModelAttribute("user") User user, HttpSession session, Model model) {
//		model.addAttribute("users", uS.findAll());
//		model.addAttribute("user", uS.findById(user));
    	return "create";
    }
    
    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("job") Job job, BindingResult result, Model model, HttpSession session) {
//    	CODE HERE TO CREATE/ADD A JOB TO THE DB
    	
    		Job exists = jS.findTitle(job.getTitle());
    		
    		if(result.hasErrors()) return "landing";
    		if(exists != null) {
    			model.addAttribute("jobError", "Please tell us about the job you applied for.");
    			return "landing";
    		} else {
    			job.setUser(uS.findById((Long)session.getAttribute("user")));
    			jS.createJob(job);
    			return "redirect:/landing";
    	
    }
    	
    	

    	
    }

}
