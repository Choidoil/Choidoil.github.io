package org.vision.dessert.servicedessert;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.dessert.common.Constant;
import org.vision.dessert.common.IService;
import org.vision.dessert.model.dessert;
import org.vision.dessert.model.dessertDao;

public class C_ListService implements IService {

	private dessertDao dao;
	SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		int category = 0;
		try {
			Map<String,Object> map = model.asMap();
			category = (int) map.get("category");
		} catch (Exception e1) {
			category = 0;
		} 
		
		
		try {
			dao = sqlSession.getMapper(dessertDao.class);
			String type = "";
			List<dessert> list = null;
			switch(category) {
			case 1:
				type="언어영역";
				list = dao.listByCategory(1);
				break;
			case 2:
				type="수리영역";
				list = dao.listByCategory(2);
				break;
			case 3:
				type="외국어영역";
				list = dao.listByCategory(3);
				break;
			default:
				type="모든";
				list = dao.selectAll();
			}
			model.addAttribute("list",list);
			model.addAttribute("type",type);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
