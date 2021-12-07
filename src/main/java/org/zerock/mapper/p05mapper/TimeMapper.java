package org.zerock.mapper.p05mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
	@Select("Select NOW()")
	public String getTime();
	
	@Select("SELECT CustomerName FROM Customers WHERE CustomerID = 1")
	public String getCustomerName();
	
	@Select("SELECT LastName FROM Employees WHERE EmployeeID = 1")
	public String getLastName();
	
	@Select("SELECT LastName FROM Employees WHERE EmployeeID = #{id}")
	public String getLastNameById(Integer id);
	
	@Select("SELECT CustomerName FROM Customers WHERE CustomerID = #{id}")
	public String getCustomerNameById(Integer id);
	
	@Select("SELECT CustomerName FROM Customers")
	public List<String> getCustomerNames();

	@Select("SELECT LastName FROM Employees")
	public List<String> getLastNames();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
