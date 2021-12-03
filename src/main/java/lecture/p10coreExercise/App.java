package lecture.p10coreExercise;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		
		String config = "lecture/p10coreExercise/context.xml";
		
		ApplicationContext context = new ClassPathXmlApplicationContext(config);
		
//		Computer computer = context.getBean(Computer.class);
//		Memory memory = context.getBean(Memory.class);
		
		System.out.println(context.getBean("computer"));
		System.out.println(context.getBean("memory"));
		
		System.out.println(context.getBean(Computer.class).getMemory());
	}
}
