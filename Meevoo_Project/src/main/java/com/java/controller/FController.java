package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FController {

	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/generic")
	public String generic() {
		return "generic";
	}
	
	@RequestMapping("/elements")
	public String elements() {
		return "elements";
	}
	
	@PostMapping("/main")
	public String main() {
		return "main";
	}

	/*
	 * @RequestMapping("/club/clubView") public String clubView() { return
	 * "club/clubView"; }
	 */
	
	

}
