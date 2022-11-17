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
public class B_ContentService implements IService {

	private dessertBoardDao dao;
	private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		// TODO 목록의 제목을 클릭했을 때 보여줄 상세내용을 위한 서비스 
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		dao = sqlSession.getMapper(dessertBoardDao.class);
		try {
			dao.upHit(num);
			dessertBoard dto = dao.select(num);
			model.addAttribute("content",dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
