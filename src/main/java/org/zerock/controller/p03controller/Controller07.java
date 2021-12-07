package org.zerock.controller.p03controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.controller.p03controller.bean.Bean02;

@Controller
@RequestMapping("/cont07")
public class Controller07 {
	@RequestMapping("/met01")
	public String method01(RedirectAttributes rttr) {
		System.out.println("cont07 met01 working");
		
		rttr.addAttribute("name", "donald");
		rttr.addAttribute("address", "new york");
		rttr.addAttribute("age", 70);
		
//		return "redirect:/cont07/met02?name=john";
		return "redirect:/cont07/met02";
	}
	
	@RequestMapping("/met02")	
	public void method02() {
		System.out.println("cont07 met02 working on");
	}
	
	@RequestMapping("/met03")
	public String method03(RedirectAttributes rttr) {
		System.out.println("method03 working");
		
		rttr.addAttribute("id", 99);
		rttr.addAttribute("city", "seoul");
		rttr.addAttribute("country", "korea");
		
		return "redirect:/cont07/met04";
	}
	
	@RequestMapping("/met05")
	public String method05(HttpSession session) {
		System.out.println("method05 working");
		
		session.setAttribute("name", "trump");
		
		return "redirect:/cont07/met06";
	}
	
	@RequestMapping("/met06")
	public void method06(HttpSession session) {
		System.out.println("method06 working");
		System.out.println(session.getAttribute("name"));
		
	}
	
	@RequestMapping("/met07")
	public String method07(RedirectAttributes rttr) {
		System.out.println("method07 working");
		rttr.addFlashAttribute("address", "korea");
		
		return "redirect:/cont07/met08";
	}
	
	@RequestMapping("/met08")
	public void method08(Model model) {
		System.out.println(model.asMap().get("address"));
	}
	
	@RequestMapping("/met09")
	public String method09(RedirectAttributes rttr) {
		System.out.println("method09 working");
		Bean02 bean = new Bean02();
		bean.setCity("New York");
		bean.setAddress("Wall Street");
		rttr.addFlashAttribute("bean", bean);
		
		return "redirect:/cont07/met10";
	}
	
	@RequestMapping("/met10")
	public void method10(Model model) {
		System.out.println(model.asMap().get("bean"));
	}
	
}
