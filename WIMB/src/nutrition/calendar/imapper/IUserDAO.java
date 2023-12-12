package nutrition.calendar.imapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import nutrition.calendar.dto.UserDTO;

public interface IUserDAO
{
	// 아이디 중복 확인
	public int idCheck(String user_id);
	// 전화번호 중복 확인
	public int telCheck(String user_tel);
	
	// 회원 등록(사용자 난수 번호는 트리거 적용)
	public int join(UserDTO user);
	
	// 칼로리 등록
	public String insertCal(@Param("t_calorie")int t_calorie, @Param("user_num")String user_num);
	
	// 로그인 성공 시 유저 번호 가져오기
	public String login(UserDTO user);
	
	// 아이디 찾기
	public String findId(@Param("user_name")String user_name, @Param("tel")String tel);
	// 비밀번호 찾기
	public int findPw(@Param("user_id")String user_id, @Param("tel")String tel);
	// 비밀번호 초기화
	public int resetPw(@Param("user_id")String user_id, @Param("tel")String tel);
	
	// 설정된 세션으로 유저 이름과 아이디 찾기
	public UserDTO findInfo(String user_num);
}
