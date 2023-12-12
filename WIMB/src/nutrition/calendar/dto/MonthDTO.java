package nutrition.calendar.dto;

public class MonthDTO
{
	private int year, month, end_day, select_day;
	private int start_date, end_date;
	
	public int getYear()
	{
		return year;
	}
	public void setYear(int year)
	{
		this.year = year;
	}

	public int getMonth()
	{
		return month;
	}
	public void setMonth(int month)
	{
		this.month = month;
	}

	public int getEnd_day()
	{
		return end_day;
	}
	public void setEnd_day(int end_day)
	{
		this.end_day = end_day;
	}
	
	public int getSelect_day()
	{
		return select_day;
	}
	public void setSelect_day(int select_day)
	{
		this.select_day = select_day;
	}

	public int getStart_date()
	{
		return start_date;
	}
	public void setStart_date(int start_date)
	{
		this.start_date = start_date;
	}

	public int getEnd_date()
	{
		return end_date;
	}
	public void setEnd_date(int end_date)
	{
		this.end_date = end_date;
	}
	
	
}
