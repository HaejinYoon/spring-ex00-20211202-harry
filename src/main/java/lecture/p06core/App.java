package lecture.p06core;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import lombok.extern.log4j.Log4j;

@Log4j
public class App {
	public static void main(String[] args) {
		
		String config = "lecture/p06core/context.xml";
		
		ApplicationContext context = new ClassPathXmlApplicationContext(config);
		
		MyServlet myServlet = context.getBean(MyServlet.class);
		MyDao myDao = context.getBean(MyDao.class);
		
		log.warn(myServlet);
		log.warn(myDao);
		
		log.warn(myServlet.getMyDao());
		
	}
}
