package org.vision.dessert;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.vision.dessert.model.dessertMember;
import org.vision.dessert.model.dessertMemberDao;

//spring-test 사용
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class TestOfdessertMemberDao {
	@Autowired
	private SqlSession sqlSession;
	private dessertMemberDao dao;
	
	@Before
	public void init() {
		System.out.println("start test...");
		dao = sqlSession.getMapper(dessertMemberDao.class);
	}
	@Test
	public void connectionTest() {
		try {
			List<dessertMember> list = dao.selectAll();
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void batchTest() {
		dessertMember a = new dessertMember("hgd", "1234","hgd@naver.com","010-2323-3232","20대","실업자","보드,서핑,바둑,컴퓨터게임");
		dessertMember b = new dessertMember("hgs", "1234","hgs@naver.com","010-2323-4343","10대","학생","바느질,걸래빨기,요리");
		List<dessertMember> list = Arrays.asList(a,b);
		
		try {
			dao.batch(list);
			dessertMember res1 = dao.select("hgd");
			dessertMember res2 = dao.select("hgs");
			assertEquals(res1,a);
			assertEquals(res2,b);
			//------------
			dao.delete("hgd");
			dao.delete("hgs");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
	}
	
	
	@After
	public void tearDown() {
		System.out.println("bye~~~~~~~~");
	}
}
