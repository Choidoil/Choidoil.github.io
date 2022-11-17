package org.vision.dessert.serviceboard;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.dessert.common.Constant;
import org.vision.dessert.common.IService;
import org.vision.dessert.model.dessertBoard;
import org.vision.dessert.model.dessertBoardDao;

public class B_WriteService implements IService {
	private SqlSession sqlSession = Constant.sqlSession;
	private dessertBoardDao dao;
	@Override
	public void execute(Model model) {
		// TODO 게시판폼에서 전달받은 정보를 데이타베이스에 등록
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		dao = sqlSession.getMapper(dessertBoardDao.class);
		dessertBoard vo = new dessertBoard();
		vo.setWriter(writer);
		vo.setEmail(email);
		vo.setSubject(subject);
		vo.setPassword(password);
		vo.setContent(content);
		try {
			dao.insert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
