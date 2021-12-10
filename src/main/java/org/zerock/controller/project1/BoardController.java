package org.zerock.controller.project1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("id") Integer id, Model model) {
		BoardVO board = service.get(id);
		
		model.addAttribute("board", board);
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", board.getId()+" Modify success");
		}
		/* 수정된 게시물 조회로 redirect 
		rttr.addAttribute("id", board.getId());
		return "redirect:/board/get";
		*/
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		// 2. request 분석 가공 BoardVO board 명시하는 것으로 생략가능
		// 3. 
		service.register(board);
		// 4. add attribute
		rttr.addFlashAttribute("result", board.getId()+" board registered successfully");
		// 5. forward/ redirect
		// 책 : 목록으로 redirect
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") Integer id, RedirectAttributes rttr) {
		if(service.remove(id)) {
			rttr.addFlashAttribute("result", id+" Deletion success");
		}
		return "redirect:/board/list";
	}
	
}













