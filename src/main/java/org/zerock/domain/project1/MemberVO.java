package org.zerock.domain.project1;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String password;
	private String email;
	private String address;
	private LocalDateTime inserted;
}
