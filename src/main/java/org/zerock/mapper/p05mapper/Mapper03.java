package org.zerock.mapper.p05mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.controller.p05controller.bean.Bean17;
import org.zerock.controller.p05controller.bean.Bean18;

public interface Mapper03 {
	public int insertCustomer(@Param("customerName") String customerName, @Param("contactName") String contactName);

	public int insertSupplier(@Param("supplierName") String supplierName, @Param("contactName") String contactName);
	
	public int insertCustomer2(Bean17 bean);
	
	public int insertSupplier2(Bean18 bean);

	public int insertCustomer3(Bean17 bean);

	public int insertSupplier3(Bean18 bean);
	
	public int updateCustomer(Bean17 bean);

	public int updateSupplier(Bean18 bean);
	
	public int deleteCustomer(Integer id);
	
	public int deleteSupplier(Integer id);
}
