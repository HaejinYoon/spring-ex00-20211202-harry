package org.zerock.controller.p08controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/cont17")
public class Controller17 {
	
	@RequestMapping("/met01")
	public String method01() {
		return "hello";
	}
	
	// /board/123 바뀔 수 있는 경로를 중괄호로 받는다
	@RequestMapping("/met02/{id}")
	public String method02(@PathVariable("id") Integer id) {
		System.out.println(id);
		
		return "hello2";
	}
	
	@RequestMapping("/met03/{number}")
	public String method03(@PathVariable Integer number) {
		System.out.println(number);
		
		return "number : " + number;
	}
	
	@RequestMapping("/met04/{str}")
	public String method04(@PathVariable String str) {
		System.out.println(str);
		return str;
	}
	
	@RequestMapping("/met05/{id}/{city}")
	public String method05(@PathVariable Integer id, @PathVariable String city) {
		System.out.println("id : "+ id);
		System.out.println("city : "+city );
		return "hello";
	}
	
	@RequestMapping("/met06/{id}/city/{city}")
	public String method06(@PathVariable Integer id, @PathVariable String city) {
		System.out.println("id : "+ id);
		System.out.println("city : "+city );
		return "hello";
	}
}
