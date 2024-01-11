package nutrition.calendar.mth;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.io.BufferedReader;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import nutrition.calendar.dto.MenuDTO;

public class GetMenuInfo
{
	public MenuDTO searchMenu(String num) throws IOException, ParseException
	{
		// URL을 만들기 위한 StringBuilder.
		StringBuilder urlBuilder = new StringBuilder("http://openapi.foodsafetykorea.go.kr/api"); /*URL : keyId/serviceId/dataType/startIdx/endIdx*/
        
        // 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
		// 필수 입력 부분
        urlBuilder.append("/" + URLEncoder.encode("13e979ebbe47499197cb","UTF-8")); /*인증 Key*/
        urlBuilder.append("/" + URLEncoder.encode("I2790","UTF-8")); /*서비스 명*/
        urlBuilder.append("/" + URLEncoder.encode("json","UTF-8")); /*XML 또는 JSON*/
        urlBuilder.append("/" + URLEncoder.encode("1","UTF-8"));
        urlBuilder.append("/" + URLEncoder.encode("5","UTF-8"));
        // 검색 하기 위하여 추가 입력
        urlBuilder.append("/" + URLEncoder.encode("NUM","UTF-8") + "=" + URLEncoder.encode(num, "UTF-8")); /*식품 이름*/
        
        // URL 객체 생성.
        URL url = new URL(urlBuilder.toString());
        
        // 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        // 통신을 위한 메소드 SET.
        conn.setRequestMethod("GET");
        
        // 통신을 위한 Content-type SET. 
        conn.setRequestProperty("Content-type", "application/json");
        
        // 전달받은 데이터를 BufferedReader 객체로 저장.
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        // 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        // 객체 해제.
        rd.close();
        conn.disconnect();
        
        // JAVA에서 JSON 파싱
        // 문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성.
        JSONParser parser = new JSONParser();
        // 문자열을 JSON 형태로 JSONObject 객체에 저장.
        JSONObject obj = (JSONObject)parser.parse(sb.toString());
		 
        JSONObject iObj = (JSONObject)obj.get("I2790");
        JSONArray dataArr = (JSONArray)iObj.get("row");
        
        MenuDTO md = new MenuDTO();
        
    	JSONObject tObj = (JSONObject)dataArr.get(i);
    	value.add((String)tObj.get("DESC_KOR"));
    	value.add((String)tObj.get("NUTR_CONT1"));
    	value.add((String)tObj.get("SERVING_SIZE"));
        
        return sb2;
    }
}
