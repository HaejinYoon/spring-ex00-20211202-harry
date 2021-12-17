package org.zerock.controller.p06controller_ajax;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cont13")

public class Controller13 {

		@RequestMapping("/met01")
		@ResponseBody // 리턴값이 곧 응답 내용
		public String method01() {
			System.out.println("cont13 met01 worked.");
			return "data only - hello" + Math.random();
		}
		
		@RequestMapping("/met02")
		@ResponseBody // 리턴값이 곧 응답 내용
		public void method02() {
			System.out.println("cont13 met02 worked.");
		}
		
		@RequestMapping("/met03")
		public String method03() {
			System.out.println("cont13 met03 worked.");
			return "view01";
		}
		
		@RequestMapping("/met04")
		@ResponseBody
		public String method04() {
			System.out.println("cont13 met04 worked.");
			return "hello This is Data Only";
		}
		
		@RequestMapping("/met05")
		@ResponseBody
		public String method05() {
			System.out.println("cont13 met05 worked.");
			return "hello This is Data Only";
		}
		
		@RequestMapping("/met06")
		@ResponseBody
		public String method06() {
			System.out.println("cont13 met06 worked.");
			return "random"+Math.random();
		}
		
		@RequestMapping("/met07")
		@ResponseBody
		public String method07() {
			int number = ((int)(Math.random() * 10)) +1;
			return number+"";
		}
		
		@RequestMapping("/met08")
		@ResponseBody
		public String method08() {
			return "hello met08";
		}
		
		@RequestMapping("/met09")
		@ResponseBody
		public String method09() {
			return "hello met09";
		}
}
