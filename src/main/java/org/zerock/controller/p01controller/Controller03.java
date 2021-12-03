package org.zerock.controller.p01controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cont03")
public class Controller03 {
	
	@RequestMapping("/met01")
	public void method01(HttpServletRequest request) {
		System.out.println("method01 working");
		
		// 2. request 분석/가공
		String name = request.getParameter("name");
		String ageStr = request.getParameter("age");
		int age = Integer.parseInt(ageStr);
		
		System.out.println(name);
		System.out.println(age);
	}
	
	@RequestMapping("/met02")
	public void method02(String name, int age) {
		System.out.println("method02 working");
		
		System.out.println("name : "+name);
		System.out.println("age : "+age);
	}
	// /cont03/met02 : request 파라미터, address(String)와 id(Integer)를 받도록 메소드 작성
	@RequestMapping("/met03")
	public void method03(String address, int id) {
		System.out.println("address : "+ address);
		System.out.println("id : " + id);
	}
	@RequestMapping("/met04")
	public void method04(@RequestParam("name")String contactName) {
		System.out.println(contactName);
	}
	
	// url : /cont03/met05?country=korea&height=200
	@RequestMapping("/met05")
	public void method05(@RequestParam("country") String c, @RequestParam("height")Integer h) {
		System.out.println(c);
		System.out.println(h);
	}
	
	
	
	
	
	
	
	
	
}
