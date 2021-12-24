package org.zerock.controller.project1;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.project1.BoardVO;
import org.zerock.domain.project1.PageInfoVO;
import org.zerock.service.project1.BoardService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;

	@GetMapping("/home")
	public void home(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
		List<BoardVO> list = service.getList();

		model.addAttribute("list", list);
		model.addAttribute("page", page);
	}
	@GetMapping("/list")
	public void list(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
		
		Integer numberPerPage = 10; // 한 페이지의 레코드의 수
		Integer numberPerPagination = 10; // 한 페이지네이션안의 갯수
		// 3. business logic
		// 게시물(Board) 목록 조회
//		  List<BoardVO> list = service.getList();
		List<BoardVO> list = service.getListPage(page, numberPerPage, numberPerPagination);
		List<BoardVO> listAll = service.getList();
		
		PageInfoVO pageInfo = service.getPageInfo(page, numberPerPage, numberPerPagination);

		// 4.
		model.addAttribute("list", list);
		model.addAttribute("listAll", listAll);
		model.addAttribute("pageInfo", pageInfo);

		// 5. // jsp path : /WEB-INF/views/board/list.jsp }
	}

	@PostMapping("/list")
	public void list2(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model, @RequestParam(value = "search", defaultValue = "") String search) {
		System.out.println(search);

		Integer numberPerPage = 10; // 한 페이지의 레코드의 수
		Integer numberPerPagination = 10; // 한 페이지네이션안의 갯수
		 
		List<BoardVO> listSearch = service.getListSearchByTitle(search, page, numberPerPage, numberPerPagination);
		PageInfoVO pageInfo = service.getPageInfo(page, numberPerPage, numberPerPagination);
		  
		System.out.println(listSearch);
		model.addAttribute("listSearch", listSearch);
		model.addAttribute("pageInfo2", pageInfo);
	}
	// /board/get?id=10
	@GetMapping("/get")
	public void get(@RequestParam("id") Integer id, @RequestParam("page") Integer page, Model model) {
		service.updateViews(id);
		BoardVO board = service.get(id);
		
		String[] fileNames = service.getNamesByBoardId(id);
		model.addAttribute("board", board);
		model.addAttribute("currentPage", page);
		model.addAttribute("fileNames", fileNames);
	}

	@GetMapping("/modify")
	public void get2(@RequestParam("id") Integer id, @RequestParam("page") Integer page, Model model) {
		BoardVO board = service.get(id);
		
		String[] fileNames = service.getNamesByBoardId(id);
		model.addAttribute("board", board);
		model.addAttribute("currentPage", page);
		model.addAttribute("fileNames", fileNames);
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, String[] removeFile,  MultipartFile[] files, RedirectAttributes rttr, PageInfoVO page) {
		try {
			if (service.modify(board, removeFile, files)) {
				rttr.addFlashAttribute("result", "No." + board.getId() + " Modify success");
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			rttr.addFlashAttribute("result", "No." + board.getId() + " Modify error");
		}
		/*
		 * 수정된 게시물 조회로 redirect rttr.addAttribute("id", board.getId()); return
		 * "redirect:/board/get";
		 */
		return "redirect:/board/get?id="+board.getId()+"&page="+page.getCurrentPage();
	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(BoardVO board, MultipartFile[] files, RedirectAttributes rttr) {
		System.out.println("notice : "+board.getNotice());
		// 2. request 분석 가공 BoardVO board 명시하는 것으로 생략가능
		try {
			// 3.
			service.register(board, files);
			// 4. add attribute
			rttr.addFlashAttribute("result", "No." + board.getId() + " board registered successfully");
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			rttr.addFlashAttribute("result", "No." + board.getId() + " board had problem");
		}
		// 5. forward/ redirect
		// 책 : 목록으로 redirect
		return "redirect:/board/get?id="+board.getId()+"&page=1";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("id") Integer id, RedirectAttributes rttr, PageInfoVO page) {
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", "No." + id + " Deletion success");
		}
		return "redirect:/board/list?page="+page.getCurrentPage();
	}

}
