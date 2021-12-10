package org.zerock.controller.project1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.project1.BoardVO;
import org.zerock.service.project1.BoardService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		// 3. business logic
		// 게시물(Board) 목록 조회
		List<BoardVO> list = service.getList();
		
		// 4.
		model.addAttribute("list", list);
		
		// 5.
		// jsp path : /WEB-INF/views/board/list.jsp
	}
	// /board/get?id=10
	@GetMapping("/get")
	public void get(@RequestParam("id") Integer id, Model model) {
		BoardVO board = service.get(id);
		
		model.addAttribute("board", board);
	}
	
}













