package org.zerock.mapper.project1;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.project1.BoardVO;

public interface BoardMapper {
	
	// all 
	public List<BoardVO> getList();
	
	// 새 게시물 입력 & get generated key
	public int insert(BoardVO board);
	
	// id(pk)로 하나의 게시물 조회
	public BoardVO read(Integer id);
	
	// id(pk)로 하나의 게시물 삭제
	public int delete(Integer id);
	
	// 하나의 게시물 수정
	public int update(BoardVO board);
	
	// 조회수
	public int updateViews(Integer id);
	
	// Pagination
	public List<BoardVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage, Integer numberPerPagination);
	
	// 총 게시물 수
	public Integer getCountRows();

	public int deleteByMemberId(String memberId);

	public Integer[] selectByMemberId(String memberId);
	
//	//pagination
//	public List<BoardVO> getListPaging();
//	
//	// 게시물 총 갯수
//	public int getTotal();
		
}
