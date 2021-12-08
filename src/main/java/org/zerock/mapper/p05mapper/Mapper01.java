package org.zerock.mapper.p05mapper;

import java.util.List;

import org.zerock.controller.p05controller.bean.Bean09;
import org.zerock.controller.p05controller.bean.Bean16;

public interface Mapper01 {
	public Bean16 getSupplierOne();
	
	public Bean09 getEmployeeNameOne();
	
	public List<Bean09> getEmployeeNameList();
	
	public List<Bean16> getSupplierList();
	
	public String getEmployeeLastNameOne();
	
	public String getEmployeeFirstNameOne();
}
