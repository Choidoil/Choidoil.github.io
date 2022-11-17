package org.vision.dessert;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.vision.dessert.serviceboard.B_WriteService;
import org.vision.dessert.common.Constant;
import org.vision.dessert.common.IService;
import org.vision.dessert.serviceboard.B_ContentService;
import org.vision.dessert.serviceboard.B_DeleteService;
import org.vision.dessert.serviceboard.B_ListService;
import org.vision.dessert.serviceboard.B_ModifyService;
import org.vision.dessert.serviceboard.B_ReplyService;
import org.vision.dessert.serviceboard.B_ReplyViewService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/*")
public class B_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(B_Controller.class);
	IService service;
	SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}
	
	@RequestMapping("/reply")
	public String reply(Model model,HttpServletRequest request) {
		System.out.println("reply()");
		model.addAttribute("request", request);
		service = new B_ReplyService();
		service.execute(model);
			
		return "redirect:list";
	}


	@RequestMapping("/reply_view")
	public String reply_view(Model model,HttpServletRequest request) {
		System.out.println("reply_view() 실행");
		model.addAttribute("request", request);
		service = new B_ReplyViewService();
		service.execute(model);
		return "/board/reply_view";
	}
	
	
	
	@RequestMapping("/modify")
	public String modify(Model model,HttpServletRequest request) {
		System.out.println("board modify() 실행");
		model.addAttribute("request", request);
		service = new B_ModifyService();
		service.execute(model);
		return "redirect:list";
	}
	
	
	
	
	@RequestMapping(value ="/board_content_view", method = RequestMethod.GET)
	public String content_view(Model model,HttpServletRequest request) {
		System.out.println("board_content_view() 실행");
		model.addAttribute("request", request);
		service = new B_ContentService();
		service.execute(model);
		return "/board/board_content_view";
	}
	
	
	
	
	@RequestMapping("/boardwrite")
	public String write(Model model,HttpServletRequest request) 
			throws SQLException, IOException {
		System.out.println("boardwrite() 실행");
		model.addAttribute("request", request);
		service = new B_WriteService();
		service.execute(model);
		return "redirect:list";
	}
	
	
	
	@RequestMapping("/write_view")
	public String write_view(Model model) {
		System.out.println("write_view()");
		return "/board/write_view";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		service = new B_ListService();
		service.execute(model);
		model.addAttribute("message","렌트카 보드 앱입니다.!");
		return "/board/boardlist";
	}
	
	
	@RequestMapping("/list2")
	public String list2(Model model) {
		service = new B_ListService();
		service.execute(model);
		model.addAttribute("message","렌트카 보드 앱입니다.!");
		return "/board/boardlist2";
	}
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("렌트카 보드 입니다.! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("message","렌트카 보드 앱입니다.!");
		return "home";
	}
	
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
    public String delete(Model model,HttpServletRequest request) {
       service = new B_DeleteService();
       int NUM= Integer.parseInt(request.getParameter("num"));
       model.addAttribute("num",NUM);
       
       service.execute(model);
       
       return "redirect:list";
    }
	
	
}
