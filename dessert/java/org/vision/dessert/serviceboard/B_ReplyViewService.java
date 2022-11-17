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

public class B_ReplyViewService implements IService {

private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		//TODO 게시판폼에서 전달받은 정보를 데이타베이스에 등록 
		try {
			Map<String,Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			int num = Integer.parseInt(request.getParameter("num"));
			dessertBoardDao dao = sqlSession.getMapper(dessertBoardDao.class);
			dao.upHit(num);
			dessertBoard dto = dao.select(num);
			model.addAttribute("reply_view", dto);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
