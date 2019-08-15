package com.david.JobTracker.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.david.JobTracker.models.Job;
import com.david.JobTracker.repositories.JobRepository;

@Service
public class JobService {

	private final JobRepository jR;
	
	public JobService(JobRepository jR) {
		this.jR = jR;
	}

	public Job createJob(Job x) {
		return jR.save(x);
	}
	
	public void deleteJob(Job x) {
		jR.delete(x);
	}
	
	public List<Job> allJobs(){
		return jR.findAll();
	}
	
	public Job updateJob(Job x) {
		return jR.save(x);
		}
	
	public Job findTitle(String title) {
		return jR.findByTitle(title);
	}

	
}
