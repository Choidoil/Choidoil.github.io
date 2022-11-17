package org.vision.dessert.servicedessert;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.dessert.common.Constant;
import org.vision.dessert.common.IService;
import org.vision.dessert.model.dessertMember;
import org.vision.dessert.model.dessertMemberDao;
import org.vision.dessert.model.dessert;
import org.vision.dessert.model.dessertDao;

public class C_RegService implements IService {
	
	private dessertDao dao;
	SqlSession sqlSession = Constant.sqlSession;
	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(dessertDao.class);
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		dessert dto = new dessert();
		dto.setName(request.getParameter("name"));
		dto.setCategory(Integer.parseInt(request.getParameter("category")));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setUsepeople(Integer.parseInt(request.getParameter("usepeople")));
		dto.setCompany(request.getParameter("company"));
		dto.setImg(request.getParameter("img"));
		dto.setInfo(request.getParameter("info"));
		
		try {
			dao.insert(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
