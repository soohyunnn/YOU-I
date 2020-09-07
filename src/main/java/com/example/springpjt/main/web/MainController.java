package com.example.springpjt.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main() throws Exception{
		System.out.println("main()");
		return "main/main.tiles"; 
	}
	
	@RequestMapping(value="/introduce/introduce.do", method=RequestMethod.GET)
	public String introduce() throws Exception{
		System.out.println("introduce()");
		return "introduce/introduce.tiles"; 
	}
	
	

}
