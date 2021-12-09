package org.zerock.controller.p05controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.controller.p05controller.bean.Bean17;
import org.zerock.controller.p05controller.bean.Bean18;
import org.zerock.mapper.p05mapper.Mapper03;

import lombok.Setter;

@Controller
@RequestMapping("/cont12")
public class Controller12 {
	@Setter(onMethod_ = @Autowired)
	private Mapper03 mapper;

	@RequestMapping("/met01")
	public void method01() {
		String customerName = "ironman";
		String contactName = "tony";
		
		mapper.insertCustomer(customerName, contactName);
		
	}
	
	@RequestMapping("/met02")
	public void method02() {
		String supplierName = "captain";
		String contactName = "steve";
		
		mapper.insertSupplier(supplierName, contactName);
		
	}
	
	@RequestMapping("/met03")
	public void method03() {
		// 2. request
		Bean17 bean = new Bean17();
		bean.setContactName("peter");
		bean.setCustomerName("spiderman");
		bean.setAddress("queens");
		bean.setCity("ny");
		bean.setPostalCode("2222");
		bean.setCountry("USA");
		
		// 3. business logic
		mapper.insertCustomer2(bean);
	}
	
	@RequestMapping("/met04")
	public void method04() {
		// 2. request
		Bean18 bean = new Bean18();
		bean.setContactName("peter");
		bean.setSupplierName("spiderman");
		bean.setAddress("queens");
		bean.setCity("ny");
		bean.setPostalCode("2222");
		bean.setCountry("USA");
		bean.setPhone("01011112222");
		
		// 3. business logic
		mapper.insertSupplier2(bean);
	}
	
	@RequestMapping("/met05")
	public void method05() {
		// 2. request
		Bean17 bean = new Bean17();
		bean.setContactName("marvel");
		bean.setCustomerName("danvers");
		bean.setAddress("gangnam");
		bean.setCity("seoul");
		bean.setPostalCode("99990");
		bean.setCountry("france");
		
		//3. 
		//insert하기전 id
		System.out.println("하기전 : " + bean.getId()); //null or 0
		
		mapper.insertCustomer3(bean);
		System.out.println("한 후 : "+bean.getId()); // key
	}
	
	@RequestMapping("/met06") 
	public void method06() {
		// 2
		Bean18 bean = new Bean18();
		bean.setAddress("yeoksam");
		bean.setCity("incheon");
		bean.setContactName("deadpool");
		bean.setSupplierName("wade");
		bean.setCountry("uk");
		bean.setPostalCode("3333");
		bean.setPhone("111");
		
		// 3
		System.out.println("하기 전 : "+bean.getSupplierID()); // null or 0
		mapper.insertSupplier3(bean);
		System.out.println("한 후 : "+bean.getSupplierID()); // key
	}
	
	@RequestMapping("/met07") 
	public void method07() {
		// 2
		Bean17 bean = new Bean17();
		bean.setId(113);
		bean.setContactName("widow");
		bean.setCustomerName("nat");
		bean.setAddress("jongro");
		bean.setCity("dokdo");
		bean.setPostalCode("77778");
		bean.setCountry("korea");
		
		// 3
		int cnt = mapper.updateCustomer(bean);
		System.out.println(cnt);
	}
	
	@RequestMapping("/met08") 
	public void method08() {
		// 2
		Bean18 bean = new Bean18();
		bean.setSupplierID(112);
		bean.setAddress("yeoksam");
		bean.setCity("incheon");
		bean.setContactName("deadpool");
		bean.setSupplierName("wade");
		bean.setCountry("uk");
		bean.setPostalCode("3333");
		bean.setPhone("111");
		
		// 3
		int cnt = mapper.updateSupplier(bean);
		System.out.println(cnt);
	}
	
	
	
}












