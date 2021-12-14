package org.zerock.mapper.project1;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.project1.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class MemberMapperTest {

	@Autowired
	public MemberMapper mapper;

	@Test
	public void mapperTest() {
		String id = "member" + (new Date()).getTime();
		String password = "newpassword" + (new Date()).getTime();
		String address = "jeju" + (new Date()).getTime();
		String email = id + "@gmail.com";
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setAddress(address);
		vo.setEmail(email);
		// insert test
		int cnt = mapper.insert(vo);
		assertEquals(1, cnt);
		// select test
		MemberVO s = mapper.select(id);

		assertEquals(id, s.getId());
		assertEquals(password, s.getPassword());
		assertEquals(address, s.getAddress());
		assertEquals(email, s.getEmail());
		
		// update test
		String newPassword = "newPassword";
		String newAddress = "newAddress";
		String inserted = s.getInserted();
		
		s.setPassword(newPassword);
		s.setAddress(newAddress);
		
		cnt = mapper.update(s);
		assertEquals(1, cnt);
		MemberVO t = mapper.select(id);
		
		assertEquals(id, t.getId());
		assertEquals(newPassword, t.getPassword());
		assertEquals(newAddress, t.getAddress());
		assertEquals(email, t.getEmail());
		assertEquals(inserted, t.getInserted());
		//list test (지우기 전)
		List<MemberVO> list1 = mapper.list();
		int size1 = list1.size();
		for (MemberVO item : list1) {
			assertNotNull(item.getId());
			assertNotNull(item.getAddress());
			assertNotNull(item.getPassword());
			assertNotNull(item.getEmail());
			assertNotNull(item.getInserted());
		}
		
		// delete test
		cnt = mapper.delete(id);
		assertEquals(1, cnt);
		
		assertNull(mapper.select(id));
		
		// list test(지운 후)
		List<MemberVO> list2 = mapper.list();
		int size2 = list2.size();
		
		assertEquals(size1 -1, size2);
		
	}

	@Test
	public void updateTest() {
		MemberVO vo = new MemberVO();

		vo.setId("member" + (new Date()).getTime());
		vo.setPassword("newpassword2");
		vo.setAddress("seoul2");
		vo.setEmail("member2@google.com");

		mapper.insert(vo);

		assertNotNull(vo.getId());
		assertNotEquals(null, vo.getId().toString());

		vo.setPassword("newpassword22222");
		vo.setAddress("Busan");
		vo.setEmail("member12@google.com");

		mapper.update(vo);

		MemberVO updatedVO = mapper.select(vo.getId());

		assertEquals("newpassword22222", updatedVO.getPassword());
		assertEquals("Busan", updatedVO.getAddress());
		assertEquals("member12@google.com", updatedVO.getEmail());

	}

	@Test
	public void deleteTest() {
		String id = "member" + (new Date()).getTime();
		String password = "newpassword" + (new Date()).getTime();
		String address = "jeju" + (new Date()).getTime();
		String email = id + "@gmail.com";
		
		MemberVO vo = new MemberVO();
		
		vo.setId(id);
		vo.setPassword(password);
		vo.setAddress(address);
		vo.setEmail(email);
// insert test
		int cnt = mapper.insert(vo);
		assertEquals(1, cnt);

		int deleteCnt = mapper.delete(vo.getId());
		assertEquals(1, deleteCnt);

	}

}
