package nutrition.calendar.mth;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Scanner;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.io.IOException;


public class ShowCalendar
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		Calendar cal = Calendar.getInstance();
		
		LocalDate currentDate = LocalDate.now();
		// 현재의 연, 월 가져오기
		int yearValue = currentDate.getYear();
        int monthValue = currentDate.getMonthValue();
        
		int w;
		int i;
		
		// 현재의 연, 월로부터 시작하는 요일 가져오기
		cal.set(yearValue, monthValue-1, 1);

		w = cal.get(Calendar.DAY_OF_WEEK);

		for (i=1; i<w; i++)
		{
			System.out.print("    ");				//-- ���� 4ĭ �߻�
		}

		// �׽�Ʈ(Ȯ��)
		//System.out.printf("%4d", 1);

		// Calendar Ŭ���� ��getActualMaximum()�� �޼ҵ� check
		for (i=1; i<=cal.getActualMaximum(Calendar.DATE); i++)
		{
			System.out.printf("%4d", i);
			w++;								//-- �ݺ����� �����ϸ� ��¥�� ������ ������
												//   ���ϵ� �Բ� ������ �� �ֵ��� ó��
			if (w%7==1)							//-- ������ ������ �Ͽ����� �� �� ����
				System.out.println();			//   ���� �� ��µ� �� �ֵ��� ó��
		}
		
		if (w%7!=1)
			System.out.println();				//-- �Ͽ��� ������ ������� �ʾ��� ��쿡��
												//   ������ �� �ֵ��� ó��
		

		System.out.println("============================");
	}
}