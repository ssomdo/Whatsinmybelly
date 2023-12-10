package nutrition.calendar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import nutrition.calendar.dto.UserDTO;
import nutrition.calendar.imapper.IUserDAO;
import nutrition.calendar.mth.MakeNum;


@Controller
public class MainCon
{
	@Autowired
	private SqlSession sqlSesion;
	
	// 첫 화면 접속
	@RequestMapping(value="/whatsinmybelly.action", method=RequestMethod.GET)
	public String mainPage(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		
		String result = "/WEB-INF/view/NutritionADay.jsp";
		
		Object failAttribute = session.getAttribute("fail");
		
		if (failAttribute != null && failAttribute.equals("fail"))
		{
			model.addAttribute("fail", "fail");
			session.removeAttribute("fail");
		}
        
        return result;
	}
	
	// 회원가입
	@RequestMapping(value="/joinsend.action", method=RequestMethod.POST)
	public String joinSend(HttpServletRequest request, UserDTO user)
	{
		String result = "";
		
		MakeNum mn = new MakeNum();
		String user_num = mn.randStr();
		
		user.setUser_num(user_num);
		
		IUserDAO udao = sqlSesion.getMapper(IUserDAO.class);
		
		int check = udao.join(user);
		
		if (check == 1)
		{
			int cal = user.getUser_kcal();
			if (cal != 0)
				udao.insertCal(cal, user_num);
			
			result = "redirect:whatsinmybelly.action";
		}
        
        return result;
	}
	
	// 로그인
	@RequestMapping(value="whatsinmybelly/login.action", method=RequestMethod.POST)
	public String login(HttpServletRequest request, UserDTO user)
	{
		HttpSession session = request.getSession();
		
		String result = "";
		
		IUserDAO udao = sqlSesion.getMapper(IUserDAO.class);
		
		String user_num = udao.login(user);
		
		if (user_num != null && !user_num.isEmpty())
		{
			session.setAttribute("user_num", user_num);
			result = "redirect:user.action";
		}
		else
		{
			session.setAttribute("fail", "fail");
			result = "redirect:/whatsinmybelly.action";
		}
		
		return result;
	}
	
	// 로그인 후 정보가 담긴 페이지로 이동
	@RequestMapping(value="/whatsinmybelly/user.action", method=RequestMethod.GET)
	public String userPage(HttpServletRequest request, Model model)
	{		
		String result = "/WEB-INF/view/NutritionADayPerson.jsp";
        
        return result;
	}

}
