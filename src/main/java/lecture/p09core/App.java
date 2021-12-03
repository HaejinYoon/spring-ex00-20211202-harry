package lecture.p09core;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		
		String config = "lecture/p09core/context.xml";
		
		ApplicationContext context = new ClassPathXmlApplicationContext(config);
		
		MyServlet myServlet = context.getBean(MyServlet.class);
		MyDao myDao = context.getBean(MyDao.class);
		
		System.out.println(myServlet);
		System.out.println(myDao);
		
		System.out.println(myServlet.getMyDao());
	}
}
