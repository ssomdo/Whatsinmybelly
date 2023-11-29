package nutrition.calendar.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.ui.Model;

import nutrition.calendar.mth.ShowCalendar;

public class MainCon
{
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
