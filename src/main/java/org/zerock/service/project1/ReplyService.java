package org.zerock.service.project1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.project1.ReplyVO;
import org.zerock.mapper.project1.ReplyMapper;

import lombok.Setter;

@Service
public class ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	public List<ReplyVO> list(Integer boardId){
		return mapper.list(boardId);
	}

	public boolean insert(ReplyVO reply) {
		return mapper.insert(reply) == 1 ;
	}
}
