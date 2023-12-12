package nutrition.calendar.mth;

import java.util.ArrayList;
import java.util.Calendar;

import nutrition.calendar.dto.MonthDTO;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.io.IOException;


public class ShowCalendar
{
	public MonthDTO calCalendar(MonthDTO mdto)
	{
		Calendar cal = Calendar.getInstance();
		
		int w;
		int m;
		
		// 현재의 연, 월로부터 시작하는 요일 가져오기
		cal.set(mdto.getYear(), mdto.getMonth()-1, 1);

		w = cal.get(Calendar.DAY_OF_WEEK)-1;
		m = cal.getActualMaximum(Calendar.DATE);
		
		mdto.setStart_date(w);
		mdto.setEnd_day(m);
		mdto.setEnd_date((7-(w+m)%7));
		
		return mdto;
	}
}