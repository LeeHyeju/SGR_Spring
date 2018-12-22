package com.project.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	@RequestMapping("/error/err404.do")
	public String error404() {
		// /WEB-INF/views + error/err404 + .jsp
		return "error/err404";
	}

	@RequestMapping("/error/noPermission.do")
	public String noPermission() {
		// /WEB-INF/views + error/noPermission + .jsp
		return "error/noPermission";
	}
}
