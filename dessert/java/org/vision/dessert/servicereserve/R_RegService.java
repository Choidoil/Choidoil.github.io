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
import org.vision.dessert.model.dessert;
import org.vision.dessert.model.dessertDao;

public class R_RegService implements IService {

	private dessertReserveDao dao;
	SqlSession sqlSession = Constant.sqlSession;
	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(dessertReserveDao.class);
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		dessertReserve vo = (dessertReserve) map.get("reserveVo");
				
		try {
			dao.insert(vo);
			int regno = dao.getCurrval();
			model.addAttribute("currval",regno);
			model.addAttribute("reserveVo", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


}
