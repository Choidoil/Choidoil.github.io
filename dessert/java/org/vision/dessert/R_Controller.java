package org.vision.dessert;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.vision.dessert.common.Constant;
import org.vision.dessert.common.IService;
import org.vision.dessert.model.R_VIEW;
import org.vision.dessert.model.dessertReserve;
import org.vision.dessert.model.dessertReserveDao;
import org.vision.dessert.model.dessert;
import org.vision.dessert.model.dessertDao;
import org.vision.dessert.servicedessert.C_ListService;
import org.vision.dessert.servicereserve.R_DeleteService;
import org.vision.dessert.servicereserve.R_RegService;
@Controller
@RequestMapping("/reserve/*")
public class R_Controller {
   IService service;
   dessertDao dao;
   dessertReserveDao rdao;
   SqlSession sqlSession;
   
   @Autowired
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
      Constant.sqlSession = this.sqlSession;
      dao = sqlSession.getMapper(dessertDao.class);
      rdao = sqlSession.getMapper(dessertReserveDao.class);
   }
   
   @RequestMapping(value="/allReserveList")
   public String allReserveList(HttpServletRequest request,Model model) {
      // 서비스를 사용하지 않고 처리 해보겠습니다.
      System.out.println("총예약리스트 출력 서비스이용하지 않고 다오로 직접처리");
      List<R_VIEW> list = null;
      HttpSession session = request.getSession();
      //String memid = (String) session.getAttribute("id");
      try {
         list = rdao.getAllReserveViewData();//.selectAll();
         model.addAttribute("allData", list);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return "/reserve/AllReserveList";
   }
   
   
   
   
   
   @RequestMapping(value="/reserveList")
   public String reserveList(HttpServletRequest request,Model model) {
      // 서비스를 사용하지 않고 처리 해보겠습니다.
      List<R_VIEW> list = null;
      HttpSession session = request.getSession();
      String memid = (String) session.getAttribute("id");
      try {
         list = rdao.getReserveViewData(memid);
         
         model.addAttribute("id",memid);
         model.addAttribute("reserveData", list);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return "/reserve/ReserveList";
   }
   
   
   
   @RequestMapping(value="/delete",method=RequestMethod.GET)
   public String delete(Model model,HttpServletRequest request) {
      service = new R_DeleteService();
      int regno = Integer.parseInt(request.getParameter("regno"));
      model.addAttribute("regno",regno);
      // 예약삭제하는 서비스 수행시키기 
      service.execute(model);
      
      return "redirect:/";
   }
   
   
   
   @RequestMapping(value="/search",method=RequestMethod.GET)
   public String search(HttpServletRequest request,Model model) {
      // 여기선 서비스를 이용해본다. 
      int category = Integer.parseInt(request.getParameter("category"));
      model.addAttribute("category",category);
      service = new C_ListService();
      service.execute(model);
      return "/reserve/dessertSearchList";
   }
   
   @RequestMapping(value="/reserve",method=RequestMethod.GET)
   public String reverse(HttpServletRequest request,Model model) {
      String memid="";
      try {
         HttpSession session = request.getSession();
         memid=(String) session.getAttribute("id");
         if(memid==null) {
            return "/member/loginForm";
         }
         System.out.println("reserve()가 실행됩니다.");
         
         // 여기선 서비스를 이용해본다. 
         int no = Integer.parseInt(request.getParameter("no"));
         dessert vo = dao.selectVO(no);
         model.addAttribute("no",no);
         model.addAttribute("memid",memid);
         model.addAttribute("vo",vo);
      } catch (NumberFormatException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "/reserve/reserveForm";
       
   }
   
   @RequestMapping("reserveProc")
   public String reserveProc(HttpServletRequest request,Model model) {
      dessertReserve vo = new dessertReserve();
      int no = Integer.parseInt(request.getParameter("no"));
      String name = request.getParameter("name");
      String memid = request.getParameter("memid");
      String category = request.getParameter("category");
      String info = request.getParameter("info");
      int price = Integer.parseInt(request.getParameter("price"));
      
      vo.setRegno(0);//실제 디비에 등록될 때에는 dessert_RESERVE_SEQ.NEXTVAL을 사용 
      vo.setNo(no);
      vo.setName(name);
      vo.setCategory(category);
      vo.setPrice(price);
      vo.setInfo(info);
      vo.setMemid(memid);
      
      // 예약결과 화면 및 계산시 사용
      String img = request.getParameter("img");
     
   
      model.addAttribute("reserveVo",vo);
      model.addAttribute("price",price);
      model.addAttribute("img",img);
     
    
      
      service = new R_RegService();
      service.execute(model);// 예약정보 등록처리 
      
      
            
      return "/reserve/resultReserve";// 예약된 정보 확인 화면으로 가기 
   }
   
   
   
   
   
   @RequestMapping("reserveMain")
   public String reserveMain(Model model) {
		// 여기서도 서비스를 사용하지 않고 직접 다오를 사용해본다. 
		try {
			int nums = dao.getAllCount();
			// 최신에 등록된 3대 
			List<dessert> list = dao.selectAll();
			model.addAttribute("recentList", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}     
      
      return "/reserve/dessertReserveMain";
   }
   private static final Logger logger = LoggerFactory.getLogger(R_Controller.class);

   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      logger.info("예약관련 앱입니다.  The client locale is {}.", locale);
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      String formattedDate = dateFormat.format(date);
      model.addAttribute("serverTime", formattedDate );
      model.addAttribute("message","예약관련 앱입니다.");
      return "home";
   }
}