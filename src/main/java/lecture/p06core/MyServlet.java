package lecture.p06core;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class MyServlet {
	
	private MyDao myDao;
	
//	public MyServlet(MyDao myDao) {
//		this.myDao = myDao;
//	}
}
