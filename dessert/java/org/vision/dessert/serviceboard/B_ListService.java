package org.vision.dessert.serviceboard;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.dessert.common.Constant;
import org.vision.dessert.common.IService;
import org.vision.dessert.model.dessertBoardDao;

public class B_ListService implements IService {
	private dessertBoardDao dao;
	SqlSession sqlSession = Constant.sqlSession;
	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(dessertBoardDao.class);
		try {
			model.addAttribute("list", dao.selectAll());
			model.addAttribute("list2", dao.selectAll2());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
