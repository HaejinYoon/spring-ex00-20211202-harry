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
}
