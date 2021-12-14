package org.zerock.service.project1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.project1.MemberVO;
import org.zerock.mapper.project1.MemberMapper;

import lombok.Setter;

@Service
public class MemberService {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	public boolean register(MemberVO member) {
		try {
			return mapper.insert(member) ==1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public MemberVO read(String id) {
		return mapper.select(id);
	}
	
	public boolean modify(MemberVO member) {
		return mapper.update(member)==1;
	}
	
	public boolean remove(String id) {
		return mapper.delete(id) == 1;
	}
	
	public List<MemberVO> getList() {
		return mapper.list();
	}
	
}
