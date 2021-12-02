package lecture.p01lombok;

import lombok.extern.java.Log;

@Log
public class App {

	public static void main(String[] args) {
		Customer c1 = new Customer();
		c1.setAddress("gangnam");
		c1.setId(1);
		c1.setCity("jeju");
		c1.setName("korea");
		
		System.out.println(c1.getAddress());
		System.out.println(c1.getCity());
		System.out.println(c1.getId());
		System.out.println(c1.getName());
		
		System.out.println(c1.toString());
		System.out.println(c1);
		
		Customer c2 = new Customer(2, "usa","ny","queens");
		System.out.println(c2);
		
		Employee emp1 = new Employee(1, "kim", "korea");
		System.out.println(emp1);
//		log.log(Level.INFO, emp1.toString());
		
		log.severe(emp1.toString());
		log.warning(emp1.toString());
		log.info(emp1.toString());
		log.config(emp1.toString());
		
	}
}
