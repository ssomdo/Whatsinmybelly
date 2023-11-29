package nutrition.calendar.mth;

import java.util.ArrayList;
import java.util.Calendar;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.io.IOException;


public class ShowCalendar
{
	public ArrayList<Integer> calCalendar(int yearValue, int monthValue)
	{
		ArrayList<Integer> result = new ArrayList<Integer>();
		
		Calendar cal = Calendar.getInstance();
		
		int w;
		int m;
		
		// 현재의 연, 월로부터 시작하는 요일 가져오기
		cal.set(yearValue, monthValue-1, 1);

		w = cal.get(Calendar.DAY_OF_WEEK);
		m = cal.getActualMaximum(Calendar.DATE);
		
		result.add(w);
		result.add(m);
		
		return result;
	}
}