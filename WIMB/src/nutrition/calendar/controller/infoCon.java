package nutrition.calendar.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import nutrition.calendar.imapper.IUserDAO;

@Controller
public class infoCon
{
	@Autowired
	private SqlSession sqlSession;
	
	// 아이디 중복 확인
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
	
	// 전화번호 중복 확인
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
	
	// 아이디 찾기
	@RequestMapping(value="/findid.action", method=RequestMethod.POST)
		@ResponseBody
	public String findId(@RequestParam("user_name") String user_name, @RequestParam("user_tel") String user_tel)
	{
		String result = "";
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		
		String user_id = udao.findId(user_name, user_tel);
		
		if (user_id != null && !user_id.isEmpty())
			result = "{\"count\":\""+user_id+"\"}";
		else
			result = "{\"count\":\"0\"}";
		
		return result;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/findpw.action", method=RequestMethod.POST)
		@ResponseBody
	public String findPw(@RequestParam("user_id") String user_id, @RequestParam("user_tel") String user_tel)
	{
		String result = "";
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		
		int check = udao.findPw(user_id, user_tel);
		
		if (check == 1)
		{
			udao.resetPw(user_id, user_tel);
			result = "{\"count\":\"1\"}";
		}
		else
			result = "{\"count\":\"0\"}";
		
		return result;
	}
}
