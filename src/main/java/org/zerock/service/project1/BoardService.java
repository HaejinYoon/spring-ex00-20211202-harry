package org.zerock.service.project1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.project1.BoardVO;
import org.zerock.mapper.project1.BoardMapper;

import lombok.Setter;

@Service
public class BoardService {

	@Setter(onMethod_ = @Autowired)	
	private BoardMapper mapper;
	
	public boolean register(BoardVO board) {
		return mapper.insert(board) == 1;
	}
	
	public BoardVO get(Integer id) {
		return mapper.read(id);
	}
	
	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	}
	
	public boolean remove(Integer id) {
		return mapper.delete(id) ==1 ;
	}
	
	public List<BoardVO> getList() {
		return mapper.getList();
	}
	
	public Boolean updateViews(Integer id) {
		return mapper.updateViews(id)==1;
	}
}
