package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Test {
	
	@RequestMapping(value="/test.do", method=RequestMethod.GET)
	public String test() throws Exception{
		
		return "/test";
	}
	
	
}
