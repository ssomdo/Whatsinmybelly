package nutrition.calendar.dto;

public class UserDTO
{
	private String user_name, user_num, user_id, tel, user_pw;
	private int user_kcal;
	
	
	public String getUser_name()
	{
		return user_name;
	}
	public void setUser_name(String user_name)
	{
		this.user_name = user_name;
	}
	
	public String getUser_num()
	{
		return user_num;
	}
	public void setUser_num(String user_num)
	{
		this.user_num = user_num;
	}
	
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	
	public String getUser_id()
	{
		return user_id;
	}
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
	
	public String getUser_pw()
	{
		return user_pw;
	}
	public void setUser_pw(String user_pw)
	{
		this.user_pw = user_pw;
	}
	
	public int getUser_kcal()
	{
		return user_kcal;
	}
	public void setUser_kcal(int user_kcal)
	{
		this.user_kcal = user_kcal;
	}
	
	
}
