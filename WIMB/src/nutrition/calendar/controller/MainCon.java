package nutrition.calendar.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import nutrition.calendar.mth.ShowCalendar;

@Controller
public class MainCon
{
	@Autowired
	private SqlSession sqlSesion;
	
	@RequestMapping(value="/whatsinmybelly.action", method=RequestMethod.GET)
	public String mainPage(Model model)
	{
		String result = "";
		
		LocalDate currentDate = LocalDate.now();
		// 현재의 연, 월 가져오기
		int yearValue = currentDate.getYear();
        int monthValue = currentDate.getMonthValue();
        
        ShowCalendar sc = new ShowCalendar();
        
        ArrayList<Integer> cal = sc.calCalendar(yearValue, monthValue);
        
        return result;
	}

}
