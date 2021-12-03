package lecture.p08coreExercise;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import lombok.extern.log4j.Log4j;

@Log4j
public class App {
	public static void main(String[] args) {

		String config = "lecture/p08coreExercise/context.xml";

		ApplicationContext context = new ClassPathXmlApplicationContext(config);

		Student student = context.getBean(Student.class); // not exception
		Teacher teacher = context.getBean(Teacher.class); // not exception

		log.warn(student);
		log.warn(teacher);
		
		log.warn("--- bean 이름으로 얻기 ----");
		
		log.warn(context.getBean("student"));
		log.warn(context.getBean("teacher"));
	}
}










