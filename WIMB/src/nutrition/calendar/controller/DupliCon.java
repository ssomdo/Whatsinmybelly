package nutrition.calendar.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.tracing.dtrace.Attributes;

import nutrition.calendar.imapper.IUserDAO;

@Controller
public class DupliCon
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/idduplicheck.action", method=RequestMethod.POST)
		@ResponseBody
	public String idCheck(@RequestParam("user_id") String user_id)
	{
		String result = "";
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		
		int count = udao.idCheck(user_id);
		
		result += "{\"count\":\""+count+"\"}";
		
		return result;
	}

	@RequestMapping(value="/telduplicheck.action", method=RequestMethod.POST)
		@ResponseBody
	public String telCheck(@RequestParam("user_tel") String user_tel)
	{
		String result = "";
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		
		int count = udao.telCheck(user_tel);
		
		result += "{\"count\":\""+count+"\"}";
		
		return result;
	}
}
