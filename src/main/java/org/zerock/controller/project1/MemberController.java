package org.zerock.controller.project1;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.project1.MemberVO;
import org.zerock.domain.project1.PageInfoVO;
import org.zerock.service.project1.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@RequestMapping("/idcheck")
	@ResponseBody
	public String idcheck(String id) {
		
		boolean has = service.hasID(id);
		if (has) {			
			return "unable";
		}else {
			return "able";
		}
	}
	
	@RequestMapping("/nickcheck")
	@ResponseBody
	public String nickcheck(String nickname) {
		boolean has = service.hasNick(nickname);
		if (has) {			
			return "unable";
		}else {
			return "able";
		}
	}
	
	@RequestMapping("/nickcheckinfo")
	@ResponseBody
	public String nickcheckinfo(String nickname, String nicknameOriginal, MemberVO member) {
		boolean has = service.hasNick(nickname);
		if (has) {
			if(nicknameOriginal.equals(member.getNickname())) { // 원래 닉네임과 같으면 쓸수 있으면 
				return "able";
			}else {
				return "unable";
			}
		}else {
			return "able";
		}
	}
	
	@GetMapping("/signup")
	public void signup() {
		
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute("member") MemberVO member, RedirectAttributes rttr, Model model) {
		MemberVO m = service.read(member.getId());
		
		if(m == null) {
			boolean ok = service.register(member);
			
			if(ok) {
				rttr.addFlashAttribute("result", "Sign-up Completed.");
				return "redirect:/member/login";
			}else {
				return "redirect:/member/signup";
			}
		} else {
			model.addAttribute("alertMessage", "ID is already exists.");
			return null;
		}
	}
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String login(String id, String password, HttpSession session) {
		// service 사용해서 아이디로 멤버vo 얻고
		MemberVO vo = service.read(id);
		if (vo ==null) {
			//login failed
			return null;
		}
		// 얻어온 멤퍼vo의 패스워드와 입력한 패스워드가 같은 지 확인
		boolean correctPassword = password.equals(vo.getPassword());
		
		// 멤버vo가 널이거나 패스워드가 다르면 로그인 실패
		if(!correctPassword) {
			//login failed
			return null;
		}
		// 멤버vo가 널이 아니고 패스워드가 일치하면 로그인 성공
		// login success
		session.setAttribute("loggedInMember", vo);
		
		return "redirect:/board/home";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 세션 invalidate
		session.invalidate();
		// /board/list redirect
		return "redirect:/board/home";
	}

	@GetMapping("/info")
	public String info(HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		//로그아웃 상태일 때
		if(vo==null) {
			return "redirect:/member/login";
		}
		// 로그인 상태일 때
		return null;
	}
	
	@PostMapping("/info")
	public String info(MemberVO member, HttpSession session, RedirectAttributes rttr) {
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		//로그아웃 상태일 때
		if(vo==null) {
			return "redirect:/member/login";
		}
		// 로그인된 상태
		boolean ok = service.modify(member);
		
		if(ok) {
			rttr.addFlashAttribute("result", "Modification Success");
			session.setAttribute("loggedInMember", service.read(member.getId()));
		} else {
			rttr.addFlashAttribute("result", "Modification Failed");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(String id, HttpSession session, RedirectAttributes rttr) {
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		//로그아웃 상태일 때
		if(vo==null) {
			return "redirect:/member/login";
		}
		// 로그인된 상태
		service.remove(id);
		
		session.invalidate();
		
		rttr.addFlashAttribute("result", "Membership Expired");
		
		return "redirect:/board/home";
	}
	@GetMapping("/list")
	public String list(@RequestParam(value="page", defaultValue="1")Integer page, Model model) {
//		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
//		
//		if(vo == null) {
//			return "redirect:/member/login";
//		}
		
		Integer numberPerPage = 5; // 한 페이지의 레코드의 수
		 Integer numberPerPagination = 5; // 한 페이지네이션안의 갯수
		 
		List<MemberVO> list = service.getListPage(page, numberPerPage, numberPerPagination);
		PageInfoVO pageInfo = service.getPageInfo(page, numberPerPage, numberPerPagination);
		
		model.addAttribute("memberList", list);
		model.addAttribute("pageInfo", pageInfo);
		
		return null;
	}
}
