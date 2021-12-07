package org.zerock.controller.p04controller;

import java.sql.Connection;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.controller.p04controller.dao.CustomerDao;

import lombok.Setter;

@Controller
@RequestMapping("/cont08")
public class Controller08 {
	
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	
	@Setter(onMethod_ = @Autowired)
	private CustomerDao dao;
	
	@RequestMapping("/met01")
	public void method01() {
		System.out.println(dataSource);
	}
	
	@RequestMapping("/met02")
	public void method02(Integer id) {
		System.out.println(dao);
		try(Connection con = dataSource.getConnection()){
			System.out.println(dao.getNameById(con, id));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}












