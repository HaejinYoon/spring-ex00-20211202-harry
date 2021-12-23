package org.zerock.controller.project1;

import java.io.IOException;
import java.util.Arrays;
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
	public void home() {
		
	}
	
	@GetMapping("/list")
	public void list(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
//		  if(page == null) {
//			  page=1;
//		  }
		Integer numberPerPage = 10; // 한 페이지의 레코드의 수
		Integer numberPerPagination = 10; // 한 페이지네이션안의 갯수
		// 3. business logic
		// 게시물(Board) 목록 조회
//		  List<BoardVO> list = service.getList();
		List<BoardVO> list = service.getListPage(page, numberPerPage, numberPerPagination);
		PageInfoVO pageInfo = service.getPageInfo(page, numberPerPage, numberPerPagination);

		// 4.
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);

		// 5. // jsp path : /WEB-INF/views/board/list.jsp }
	}

//	@GetMapping("/list")
//	public int getTotal(Model model) {
//		return 3;
//	}

//	  public List<BoardVO> getListPaging(Model model, int page, int rowPerPage) {
//	  List<BoardVO> list = service.getListPaging();
//	  
//	  int endPage=1;
//	  
//	  
//	  rowPerPage = 10;
//	  
//	  list=getListPaging(model, page, rowPerPage); int total = getTotal(model);
//	  endPage = ((total-1) / rowPerPage) + 1;
//	  
//	  model.addAttribute("list", list); return list; }

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
		System.out.println(Arrays.toString(removeFile));
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
		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("id") Integer id, RedirectAttributes rttr, PageInfoVO page) {
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", "No." + id + " Deletion success");
		}
		return "redirect:/board/list?page="+page.getCurrentPage();
	}

}
