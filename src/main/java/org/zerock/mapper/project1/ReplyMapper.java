package org.zerock.mapper.project1;

import java.util.List;

import org.zerock.domain.project1.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> list(Integer boardId);

	public int insert(ReplyVO reply);
	
}
