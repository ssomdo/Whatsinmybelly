package nutrition.calendar.imapper;

import org.apache.ibatis.annotations.Param;

public interface IKcalDAO
{
	// 유저의 요일별 총 칼로리 가져오기
	public int getKcal(@Param("user_num")String user_num, @Param("day")String day);
	
	// 식사 고유 번호 가져오기
	public int getMealNum(@Param("meal")String meal);
	
	// 식단 테이블에 존재하는 식단인지 확인
	public int checkMenu(@Param("menu_num")int menu_num);
	// 식단 테이블에 존재하지 않는 식단이라면 추가
	public int insertMenu();
}
