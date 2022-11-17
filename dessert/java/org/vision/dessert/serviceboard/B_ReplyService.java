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

public class B_ReplyService implements IService {
private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		//TODO 댓글폼에서 전달받은 정보를 데이타베이스에 등록 
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		// 댓글을 등록하려면 본글의 등록번호를 알아야 함
		int num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("writer");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		// 댓글은 추가 정보가 필요 
		int ref = num;//Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
				
		dessertBoardDao dao = sqlSession.getMapper(dessertBoardDao.class);
		dessertBoard vo = new dessertBoard();
		vo.setWriter(writer);
		vo.setPassword(password);
		vo.setEmail(email);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setRef(ref);
		// 아래 2개 값은 질의에서 1씩 추가 할것임
		vo.setRe_step(re_step);
		vo.setRe_level(re_level);
	
		try {
			dao.insert2(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
