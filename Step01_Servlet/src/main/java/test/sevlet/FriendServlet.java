package test.sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//DB 에서 불러온 친구 목록이라고 가정하자
		List<String> list=new ArrayList<String>();
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		list.add("주뎅이");
		list.add("덩어리");
		
		/*
		 * 위의 목록을 이용해서 친구 목록을 클라이언트에게 출력해 보세요.
		 * 
		 * -아래와 html 형식으로 출력해야 합니다.
		 * <ul>
		 * 		<li>김구라</li>
		 * 		<li>해골</li>
		 * 		.
		 * 		.
		 * </ul>
		 * -반드시 반복문을 활용하세요.
		 */
		
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정(웹브라우저에게 html 형식의 문자열을 응답할 거라고 미리 알린다.)
		resp.setContentType("text/html; charset=utf-8");
		
		//클라이언트에게 출력할 수 있는 객체의 참조값 얻어오기
		PrintWriter pw=resp.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=\"UTF-8\">");
		pw.println("<title>/friend/list</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>친구 목록 입니다</h1>");
		pw.println("<ul>");
		for(String tmp:list) {
			pw.println("<li>"+tmp+"</li>");
		}
		pw.println("</ul>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
