package org.zerock.controller.project1;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.zerock.domain.project1.MemberVO;
import org.zerock.domain.project1.ReplyVO;
import org.zerock.service.project1.ReplyService;

import lombok.Setter;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	@Setter(onMethod_ = @Autowired)
	private ReplyService service;
	
	@GetMapping("/board/{boardId}")
	public List<ReplyVO> list(@PathVariable Integer boardId, HttpSession session){
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		List<ReplyVO> list = service.list(boardId);
		if(loggedIn != null) {
			for (ReplyVO reply : list) {
				String writerId = reply.getMemberId();
				reply.setOwn(loggedIn.getId().equals(writerId)); // 로그인한 사람과 댓글 작성자가 같을 때 true
			}
		}
		
		return list;
	}
	
	@PostMapping("/write")
	public ResponseEntity<String> write(ReplyVO reply, @SessionAttribute(value="loggedInMember", required = false) MemberVO logged) {
		// 로그인한 멤버
//		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");
		if (logged !=null && logged.getId().equals(reply.getMemberId())) {
			service.insert(reply);
			return ResponseEntity.status(HttpStatus.OK).build();
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();			
		}
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<String>  modify(@PathVariable Integer id, @RequestBody ReplyVO  reply, @SessionAttribute(value="loggedInMember", required = false) MemberVO logged) {
//		System.out.println(id);
//		System.out.println(reply.getReply());
		// 로그인한 멤버
//		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");
		
		// 댓글 조회
		ReplyVO old = service.readById(id);
		// 로그인된 멤버의 아이디와 댓글 작성한 사람 아이디가 같을 때만 또는 관리자일 때
		if ((logged !=null && logged.getId().equals(old.getMemberId()))||logged.getAdminQuali()==1) {
			// 업데이트
			old.setReply(reply.getReply());
			service.update(old);
			
			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<String> remove(@PathVariable Integer id, @SessionAttribute(value="loggedInMember", required = false) MemberVO logged) {
		// 로그인한 멤버
//		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");
				
		// 댓글 조회
		ReplyVO old = service.readById(id);
		// 로그인된 멤버의 아이디와 댓글 작성한 사람 아이디가 같을 때만 또는 관리자일 때
		if ((logged !=null && logged.getId().equals(old.getMemberId()))||logged.getAdminQuali()==1) {
			// 삭제
			service.delete(id);
			
			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	@GetMapping("/count/{id}")
	public Integer countReplyList(@PathVariable Integer id) {
		return service.countReplyList(id);
	}
}
