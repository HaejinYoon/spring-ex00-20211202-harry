package org.zerock.domain.project1;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String password;
	private String email;
	private String address;
	private LocalDateTime inserted;
	private String nickname;
	private Integer numberOfBoard;
	
	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
}
