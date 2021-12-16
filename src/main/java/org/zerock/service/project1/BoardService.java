package org.zerock.service.project1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.project1.BoardVO;
import org.zerock.domain.project1.PageInfoVO;
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
		return mapper.delete(id) == 1;
	}

	public List<BoardVO> getList() {
		return mapper.getList();
	}

	public Boolean updateViews(Integer id) {
		return mapper.updateViews(id) == 1;
	}

	public List<BoardVO> getListPage(Integer page, Integer numberPerPage) {
		// sql에서 사용할 record 시작 번호(0-index)
		Integer from = (page - 1) * 10;
		return mapper.getListPage(from, numberPerPage);
	}

	public PageInfoVO getPageInfo(Integer page, Integer numberPerPage) {
		// 총 게시물 수
		Integer countRows = mapper.getCountRows();

		// 마지막 페이지 번호
		Integer lastPage = (countRows - 1) / numberPerPage + 1;

		// 페이지네이션 가장 왼쪽 번호
		Integer leftPageNumber = (page - 1) / 10 * 10 + 1;

		// 오른쪽 번호
		Integer rightPageNumber = (page - 1) / 10 * 10 + 10;
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
