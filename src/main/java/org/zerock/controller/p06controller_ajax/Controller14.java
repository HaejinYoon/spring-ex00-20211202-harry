package org.zerock.controller.p06controller_ajax;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cont14")
public class Controller14 {
	@RequestMapping("/met01")
	@ResponseBody
	public String method01(@RequestParam("name") String name) {
		System.out.println("cont14 met01 worked");
		System.out.println(name);
		return "hello";
	}
	
	@RequestMapping("/met02")
	@ResponseBody
	public String method02(@RequestParam("city") String city) {
		System.out.println(city);
		return "hello met02";
	}
	
	@RequestMapping("/met03")
	@ResponseBody
	public String method03(@RequestParam("city") String city, @RequestParam("name") String name) {
		System.out.println("city : "+city);
		System.out.println("name : " + name);
		return "hello met03";
	}
	
	@RequestMapping("/met04")
	@ResponseBody
	public String method04(@RequestParam("data1") String data1) {
		System.out.println(data1);
		return "hello met04";
	}
	
	@RequestMapping("/met05")
	@ResponseBody
	public String method05(@RequestParam("name") String name, @RequestParam("address") String address) {
		System.out.println("name : " +name);
		System.out.println("address : "+address);
		return "hello met05";
	}
	
}
