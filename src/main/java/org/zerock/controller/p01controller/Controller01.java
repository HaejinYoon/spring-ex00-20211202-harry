package org.zerock.controller.p01controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cont01")
public class Controller01 {
	// "/cont01"
	@RequestMapping("")
	public void method00() {
		System.out.println("method00 working");
	}
	// "/cont01/met01"
	@RequestMapping("/met01")
	public void method01() {
		System.out.println("method01 working");
	}
	// "cont01/met01"
	@RequestMapping("/met02")
	public void method02() {
		System.out.println("method02 working");
	}
	
	// "/cont01/met03", "/cont01/met04" 
	@RequestMapping({"/met03", "/met04"})
	public void  method03() {
		System.out.println("method03 working");
	}
	
	// "/cont/met05", "/cont01/met06"로 요청이 왔을 때 일하는 메소드 method05 작성
	
	@RequestMapping({"/met05", "/met06"})
	public void method05() {
		System.out.println("method 05 working");
	}
}
