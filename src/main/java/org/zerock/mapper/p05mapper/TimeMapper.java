package org.zerock.mapper.p05mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.controller.p05controller.bean.Bean09;
import org.zerock.controller.p05controller.bean.Bean10;
import org.zerock.controller.p05controller.bean.Bean11;
import org.zerock.controller.p05controller.bean.Bean12;
import org.zerock.controller.p05controller.bean.Bean13;
import org.zerock.controller.p05controller.bean.Bean14;
import org.zerock.controller.p05controller.bean.Bean15;

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
	
	@Select("SELECT EmployeeID, LastName, FirstName FROM Employees WHERE EmployeeID = 1")
	public Bean09 getEmployeeName();
	
	@Select("SELECT CustomerName, ContactName FROM Customers WHERE CustomerID = 1")
	public Bean10 getName();
	
	@Select("SELECT CustomerID AS id, customerName FROM Customers WHERE CustomerID = 1")
	public Bean11 getCustomerInfo();
	
	@Select("SELECT EmployeeID AS id, LastName AS lname, FirstName AS fname FROM Employees WHERE EmployeeID=2")
	public Bean12 getEmployeeInfo();
	
	@Select("SELECT EmployeeID, LastName, FirstName, BirthDate, Photo, Notes FROM Employees WHERE EmployeeID = #{id}")
	public Bean13 getEmployeeById(Integer id);

	@Select("SELECT CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country FROM Customers WHERE CustomerID = #{id} ")
	public Bean14 getCustomerById(Integer id);
	
	@Select("SELECT CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country FROM Customers ")
	public List<Bean14> getCustomers();
	
	@Select("SELECT EmployeeID, LastName, FirstName, BirthDate, Photo, Notes FROM Employees ")
	public List<Bean13> getEmployees();
	
	@Select("SELECT p.ProductName, c.CategoryName, Unit, Price FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID")
	public List<Bean15> getProductsInfo();
	
	public List<Bean15> getProductsInfo2();
	
	
	
	
	
	
	
	
	
	
	
	
	
}
