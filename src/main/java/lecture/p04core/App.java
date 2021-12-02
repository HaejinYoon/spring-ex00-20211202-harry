package lecture.p04core;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import lombok.extern.log4j.Log4j;

@Log4j
public class App {
	public static void main(String[] args) {
		
		String contextFilePath = "lecture/p04core/context.xml";
		ApplicationContext context = new ClassPathXmlApplicationContext(contextFilePath);
		
		MyServlet s1 = context.getBean(MyServlet.class);
		MyDao d1 = context.getBean(MyDao.class);
		log.warn(s1);
		log.warn(d1);
		
		log.warn(s1.getMyDao());
	}
}
