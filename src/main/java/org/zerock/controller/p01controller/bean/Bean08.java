package org.zerock.controller.p01controller.bean;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class Bean08 {

	private String name;
	private int age;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate moved;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime writed;
	
}
