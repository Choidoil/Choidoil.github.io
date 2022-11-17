package org.vision.dessert.servicereserve;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.dessert.common.Constant;
import org.vision.dessert.common.IService;
import org.vision.dessert.model.dessertReserve;
import org.vision.dessert.model.dessertReserveDao;

public class R_DeleteService implements IService {

	private dessertReserveDao dao;
	SqlSession sqlSession = Constant.sqlSession;
	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(dessertReserveDao.class);
		Map<String,Object> map = model.asMap();
		int regno = (Integer) map.get("regno");
		
				
		try {
			dao.reserveCancel(regno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


}
