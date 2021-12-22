package org.zerock.service.project1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.project1.BoardVO;
import org.zerock.domain.project1.PageInfoVO;
import org.zerock.mapper.project1.BoardMapper;
import org.zerock.mapper.project1.ReplyMapper;

import lombok.Setter;

@Service
public class BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	public boolean register(BoardVO board) {
		return mapper.insert(board) == 1;
	}

	public BoardVO get(Integer id) {
		return mapper.read(id);
	}

	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	}

	@Transactional
	public boolean remove(Integer id) {
		// 1. 게시물 달린 댓글 지우기
		replyMapper.deleteByBoardId(id);
		
		// 2. 게시물 지우기
		return mapper.delete(id) == 1;
	}

	public List<BoardVO> getList() {
		return mapper.getList();
	}

	@Transactional
	public Boolean updateViews(Integer id) {
		return mapper.updateViews(id) == 1;
	}

	public List<BoardVO> getListPage(Integer page, Integer numberPerPage, Integer numberPerPagination) {
		// sql에서 사용할 record 시작 번호(0-index)
		Integer from = (page - 1) * numberPerPage;
		return mapper.getListPage(from, numberPerPage, numberPerPagination);
	}

	public PageInfoVO getPageInfo(Integer page, Integer numberPerPage, Integer numberPerPagination) {
		// 총 게시물 수
		Integer countRows = mapper.getCountRows(); 

		// 마지막 페이지 번호
		Integer lastPage = (countRows - 1) / numberPerPage + 1;

		// 페이지네이션 가장 왼쪽 번호
		Integer leftPageNumber = (page - 1) / numberPerPagination * numberPerPagination + 1;

		// 오른쪽 번호
		Integer rightPageNumber = (page - 1) / numberPerPagination * numberPerPagination + numberPerPagination;
		rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;

		// 이전 페이지 버튼 존재 유무
		Boolean hasPrevButton = leftPageNumber != 1;

		// 다음 페이지 버튼 존재 유무
		Boolean hasNextButton = rightPageNumber != lastPage;

		PageInfoVO pageInfo = new PageInfoVO();

		pageInfo.setLastPage(lastPage);
		pageInfo.setCountRows(countRows);
		pageInfo.setCurrentPage(page);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setHasPrevButton(hasPrevButton);
		pageInfo.setHasNextButton(hasNextButton);

		return pageInfo;
	}

//	public List<BoardVO> getListPaging() {
//		return mapper.getListPaging();
//	}
//	
//	public int getTotal() {
//		return mapper.getTotal();
//	}
}
