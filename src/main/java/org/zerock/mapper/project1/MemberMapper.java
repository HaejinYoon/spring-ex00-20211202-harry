package org.zerock.mapper.project1;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.project1.MemberVO;

public interface MemberMapper {
	
	public int insert(MemberVO member);
	
	public MemberVO select(String id);
	
	public int update(MemberVO member);
	
	public int delete(String id);
	
	public List<MemberVO> list(); // 연습삼아

	// Pagination
	public List<MemberVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage, Integer numberPerPagination);
		
	// 총 회원 수
	public Integer getCountRows();
	
	// nickname으로 회원 검색
	public MemberVO selectByNickname(String nickname);

}
