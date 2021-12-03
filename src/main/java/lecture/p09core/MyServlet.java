package lecture.p09core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyServlet {
	
	private MyDao myDao;

	public MyDao getMyDao() {
		return myDao;
	}

	@Autowired
	public void setMyDao(MyDao myDao) {
		this.myDao = myDao;
	}
	
	
}
