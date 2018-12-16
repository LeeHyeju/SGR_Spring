package com.project.sgr;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class HomeController {

	@RequestMapping("/main.do")
	public String main(HttpSession session) throws Exception {
		System.out.println("메인창 실행");
		String id = (String)session.getAttribute("id");

		return "main/main";
	}
}
