package org.zerock.service.project1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.project1.MemberVO;
import org.zerock.domain.project1.PageInfoVO;
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
	
	public List<MemberVO> getListPage(Integer page, Integer numberPerPage, Integer numberPerPagination) {
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

	public boolean hasID(String id) {
		MemberVO member = mapper.select(id);
		return member != null;
	}
	
}
