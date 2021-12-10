package org.zerock.mapper.project1;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.project1.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class BoardMapperTest {
	
	@Autowired
	public BoardMapper mapper;
	
	@Test
	public void mapperTest() {
		assertNotNull(mapper);
	}
	
	@Test
	public void insertTest() {
		BoardVO vo = new BoardVO();
		vo.setTitle("test title");
		vo.setContent("test content");
		vo.setWriter("test writer");
		
		int cnt = mapper.insert(vo);
		
		assertEquals(1, cnt);
	}
	
	@Test
	public void insertAndSelectTest() {
		BoardVO vo = new BoardVO();
		vo.setTitle("Test title" + Math.random());
		vo.setContent("Test content" + Math.random());
		vo.setWriter("test writer" + Math.random());
		
		mapper.insert(vo);
		
		assertNotNull(vo.getId());
		assertNotEquals(0,  vo.getId().intValue());
		
		BoardVO lastInserted = mapper.read(vo.getId());
		
		assertEquals(vo.getTitle(), lastInserted.getTitle());
		assertEquals(vo.getContent(), lastInserted.getContent());
		assertEquals(vo.getWriter(), lastInserted.getWriter());
		
	}

	@Test
	public void updateTest() {
		BoardVO vo = new BoardVO();
		vo.setTitle("Test title" + Math.random());
		vo.setContent("Test content" + Math.random());
		vo.setWriter("test writer" + Math.random());
		
		mapper.insert(vo);
		
		assertNotNull(vo.getId());
		assertNotEquals(0,  vo.getId().intValue());
		
		String newTitle="update title" + Math.random();
		String newContent = "update contenet" + Math.random();
		
		vo.setTitle(newTitle);
		vo.setContent(newContent);
		
		mapper.update(vo);
		
		BoardVO updatedVO = mapper.read(vo.getId());
		
		assertEquals(newTitle, updatedVO.getTitle());
		assertEquals(newContent, updatedVO.getContent());
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
