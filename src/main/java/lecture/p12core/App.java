package lecture.p12core;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		
		String path = "lecture/p12core/context.xml";
		ApplicationContext context = new ClassPathXmlApplicationContext(path);
		
		MyServlet s = context.getBean(MyServlet.class);
		MyDao d = context.getBean(MyDao.class);
		
		System.out.println(s);
		System.out.println(d);
		
		System.out.println(s.getMyDao());
	}
}
