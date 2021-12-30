package org.zerock.domain.project1;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class ReplyVO {
	private Integer id;
	private Integer boardId;
	private String memberId;
	private String reply;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	private Boolean own;
	
	private Integer adminQuali;
	private String nickName;
	private Integer replyCount;
	
	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	public String getUpdated() {
		return this.updated.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	public String getCustomInserted() {
		// 현재일시
		LocalDateTime now = LocalDateTime.now(ZoneId.of("+09:00"));
		
		LocalDateTime beforeOneDayFromNow = now.minusDays(1);
		
		if(inserted.isBefore(beforeOneDayFromNow)) {
			return inserted.toLocalDate().toString();
		} else {
			return inserted.toLocalTime().toString();
		}
	}
	
	public String getCustomUpdated() {
		// 현재일시
		LocalDateTime now = LocalDateTime.now(ZoneId.of("+09:00"));
		
		LocalDateTime beforeOneDayFromNow = now.minusDays(1);
		
		if(updated.isBefore(beforeOneDayFromNow)) {
			return updated.toLocalDate().toString();
		} else {
			return updated.toLocalTime().toString();
		}
	}
}
