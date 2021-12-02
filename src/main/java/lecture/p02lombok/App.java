package lecture.p02lombok;

import lecture.p01lombok.Employee;
import lombok.extern.log4j.Log4j;

@Log4j
public class App {
	public static void main(String[] args) {
		Employee e1 = new Employee(3, "seoul", "korea");
		log.info(e1.toString());
		log.info(e1);
		
		log.debug(e1);
		log.info(e1);
		log.warn(e1);
		log.error(e1);
		log.fatal(e1);
	}
}
