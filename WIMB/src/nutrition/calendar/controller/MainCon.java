package nutrition.calendar.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import nutrition.calendar.dto.MonthDTO;
import nutrition.calendar.dto.TotalKcalDTO;
import nutrition.calendar.dto.UserDTO;
import nutrition.calendar.imapper.IUserDAO;
import nutrition.calendar.mth.GetApi;
import nutrition.calendar.mth.MakeNum;
import nutrition.calendar.mth.ShowCalendar;


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
		HttpSession session = request.getSession();
		
		String result = "/WEB-INF/view/NutritionADayPerson.jsp";
		
		ShowCalendar sc = new ShowCalendar();
		IUserDAO udao = sqlSesion.getMapper(IUserDAO.class);
		
		String user_num = (String)session.getAttribute("user_num");
		
		// 세션에 설정되어 있는 사용자 번호로 사용자 이름과 아이디 찾기
		UserDTO udto = udao.findInfo(user_num);
		
		// 사용자 이름과 아이디 model 활용하여 전송
		model.addAttribute("user_name", udto.getUser_name());
		model.addAttribute("user_id", udto.getUser_id());
		
		// 달력 구성하기 위해 정보 가져오기
		LocalDate currentDate = LocalDate.now();
		// 현재의 연, 월 가져오기
		int yearValue = currentDate.getYear();
        int monthValue = currentDate.getMonthValue();
        int dayValue = currentDate.getDayOfMonth();
        
        MonthDTO mdto = new MonthDTO();
        mdto.setYear(yearValue);
        mdto.setMonth(monthValue);
        mdto.setSelect_day(dayValue);
        
        MonthDTO cal = sc.calCalendar(mdto);
        
        // 달력 생성에 필요한 정보 모델 통하여 전송
        model.addAttribute("cal", cal);
       
        // 사용자가 이전에 등록한 요일별 총 칼로리 모델 통하여 전송
        ArrayList<TotalKcalDTO> tklist = new ArrayList<TotalKcalDTO>();
        
        for (int i=0; i<cal.getEnd_day(); i++)
        {
        	String day = "";
        	
        	TotalKcalDTO tkdto = new TotalKcalDTO();
        	
        	tkdto.setDay(i);
        	
        	if (i<10)
        		day = mdto.getYear() + "-" + mdto.getMonth() + "-0" + i;
        	else
        		day = mdto.getYear() + "-" + mdto.getMonth() + "-" + i;
        	tkdto.setKcal(udao.getKcal(user_num, day));
        	
        	tklist.add(tkdto);
        }
        
        model.addAttribute("tklist", tklist);
		
        
        return result;
	}
	
	// 검색어 추천 기능
	@RequestMapping(value="/whatsinmybelly/foodsearch.action", method=RequestMethod.POST)
		@ResponseBody
	public String searchMenu(@RequestParam("name") String name)
	{
		
		String result = "";
		
		GetApi ga = new GetApi();
		
		try
		{
			result += "{\"list\":\""+ga.recomMenu(name)+"\"}";
			
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/whatsinmybelly/logout.action", method = {RequestMethod.GET})	
	public String logout(HttpServletRequest requset)
	{
		HttpSession session = requset.getSession();
		
		String result = "";
		
		session.removeAttribute("user_num");
		
		result = "redirect:/whatsinmybelly.action";
		
		return result;
	}

}
