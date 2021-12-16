package org.zerock.domain.project1;

import lombok.Data;

@Data
public class PageInfoVO {

	private Integer lastPage; // 마지막 페이지 번호
	private Integer countRows; // 총 레코드 수
	private Integer currentPage; // 현재 페이지 번호
	private Integer leftPageNumber; // 페이지네이션 왼쪽
	private Integer rightPageNumber; // 페이지네이션 오른쪽
	private Boolean hasPrevButton; // 이전 페이지 버튼 존재 유무
	private Boolean hasNextButton; // 다음 페이지 버튼 존재 유무
}
