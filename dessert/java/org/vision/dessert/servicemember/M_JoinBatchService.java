package org.vision.dessert.servicemember;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.dessert.common.Constant;
import org.vision.dessert.common.IService;
import org.vision.dessert.model.dessertMember;
import org.vision.dessert.model.dessertMemberDao;

public class M_JoinBatchService implements IService {
	private dessertMemberDao dao;
	SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
		dao = sqlSession.getMapper(dessertMemberDao.class);
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String data = request.getParameter("batchData");
		System.out.println(data);
		String rows[] = data.split("\n");
		dessertMember aman=null;
		List<dessertMember> list=new ArrayList<>();
		for(String x:rows) {
			String meminfo[] = x.split(",");
			aman = new dessertMember(meminfo[0],
					meminfo[1],meminfo[2],meminfo[3],meminfo[4],meminfo[5],meminfo[6]
					);
			list.add(aman);
		}
		try {
			dao.batch(list);
		} catch (SQLException e) {
			System.err.println("배치처리 실패!:아이디가 중복등으로 인함");
			return;
		}

	}

}
