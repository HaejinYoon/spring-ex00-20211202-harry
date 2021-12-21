package org.zerock.controller.project1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.project1.ReplyVO;
import org.zerock.service.project1.ReplyService;

import lombok.Setter;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	@Setter(onMethod_ = @Autowired)
	private ReplyService service;
	
	@GetMapping("/board/{boardId}")
	public List<ReplyVO> list(@PathVariable Integer boardId){
		
		return service.list(boardId);
	}
	
	@PostMapping("/write")
	public ReplyVO write(ReplyVO reply) {
		service.insert(reply);
		return null;
	}
}
