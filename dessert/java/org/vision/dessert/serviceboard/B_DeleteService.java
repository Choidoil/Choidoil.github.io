package org.vision.dessert.serviceboard;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.dessert.common.Constant;
import org.vision.dessert.common.IService;
import org.vision.dessert.model.dessertBoardDao;


public class B_DeleteService implements IService {
   
   private dessertBoardDao dao;
   SqlSession sqlSession = Constant.sqlSession;
   
   @Override
   public void execute(Model model) {
      dao = sqlSession.getMapper(dessertBoardDao.class);
      Map<String,Object> map = model.asMap();
      int num = (Integer) map.get("num");
      
      try {
         dao.delete(num);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

}