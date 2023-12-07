package nutrition.calendar.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import nutrition.calendar.dto.UserDTO;
import nutrition.calendar.imapper.IUserDAO;
import nutrition.calendar.mth.MakeNum;


@Controller
public class MainCon
{
	@Autowired
	private SqlSession sqlSesion;
	
	@RequestMapping(value="/whatsinmybelly.action", method=RequestMethod.GET)
	public String mainPage(Model model)
	{
		String result = "/WEB-INF/view/NutritionADay.jsp";
        
        return result;
	}
	
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
			int cal = user.getUser_cal();
			if (cal != 0)
			{
				int dcheck = udao.insertCal(cal, user_num);
				if (dcheck == 1)
					result = "redirect:adminmain.action";
			}
		}
        
        return result;
	}

}
