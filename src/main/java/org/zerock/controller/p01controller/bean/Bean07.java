package org.zerock.controller.p01controller.bean;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class Bean07 {

	private String name;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate birth;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime inserted;
}
