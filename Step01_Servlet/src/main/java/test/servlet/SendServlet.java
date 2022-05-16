package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class SendServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트가 전송한 요청 파라미터 추출하기
		String msg=req.getParameter("msg");
		System.out.println("전송된 문자열:"+msg);
		//간단한 임시 응답
		PrintWriter pw=resp.getWriter();
		pw.println("oh!!!");
		pw.close();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg=req.getParameter("msg");
		//콘솔창에 출력하기
		System.out.println("나는 get" + msg);
		
		PrintWriter pw=resp.getWriter();
		pw.println("oh get!!!");
		pw.println("who are you?");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String msg=req.getParameter("msg");
		//콘솔창에 출력하기
		System.out.println("나는 post" + msg);
		
		PrintWriter pw=resp.getWriter();
		pw.println("oh post!!!");
		pw.println("who are you?");
		pw.close();
	}
}