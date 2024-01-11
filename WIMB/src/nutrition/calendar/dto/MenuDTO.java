package nutrition.calendar.dto;

public class MenuDTO
{
	private int menu_num, menu_size, menu_cal;
	private String menu_name, cal_unit;
	
	
	public int getMenu_num()
	{
		return menu_num;
	}
	public void setMenu_num(int menu_num)
	{
		this.menu_num = menu_num;
	}
	
	public int getMenu_size()
	{
		return menu_size;
	}
	public void setMenu_size(int menu_size)
	{
		this.menu_size = menu_size;
	}
	
	public int getMenu_cal()
	{
		return menu_cal;
	}
	public void setMenu_cal(int menu_cal)
	{
		this.menu_cal = menu_cal;
	}
	
	public String getMenu_name()
	{
		return menu_name;
	}
	public void setMenu_name(String menu_name)
	{
		this.menu_name = menu_name;
	}
	
	public String getCal_unit()
	{
		return cal_unit;
	}
	public void setCal_unit(String cal_unit)
	{
		this.cal_unit = cal_unit;
	}
	
	
}
