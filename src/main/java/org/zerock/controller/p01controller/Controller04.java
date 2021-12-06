package org.zerock.controller.p01controller;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.controller.p01controller.bean.Bean01;
import org.zerock.controller.p01controller.bean.Bean02;

@Controller
@RequestMapping("/cont04")
public class Controller04 {
	@RequestMapping("/met01")
	public void method01(String name, String city) {
		System.out.println(name);
		System.out.println(city);
	}
	
	@RequestMapping("/met02")
	public void method02(HttpServletRequest request) {
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		
		Bean01 bean = new Bean01();
		bean.setName(name);
		bean.setCity(city);
		System.out.println(bean); // 잘 들어왔나 확인
		
		// 3. business logic
		
		// 4. add attributes
		
		// 5. forward / redirect
	}
	
	@RequestMapping("/met03")
	public void method03(Bean01 bean) {
		System.out.println("met03 : " + bean);
	}
	
	@RequestMapping("/met04")
	public void method04(Bean02 bean) {
		System.out.println(bean);
	}
	
	@RequestMapping("/met10")
	public void method10(@RequestParam("date")
	//@DateTimeFormat(pattern="yyy-MM-dd") 
	@DateTimeFormat(iso = ISO.DATE)
	LocalDate date) {
		System.out.println(date);
	}
	@RequestMapping("/met11")
	public void method11(@RequestParam("dateTime") @DateTimeFormat(iso=ISO.DATE_TIME) LocalDateTime dateTime) {
		System.out.println(dateTime);
	}
}
