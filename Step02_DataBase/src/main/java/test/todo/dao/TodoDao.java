package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	private static TodoDao dao;
	private TodoDao() {}
	public static TodoDao getInstance() {
		if(dao==null) {
			dao=new TodoDao();
		}
		return dao;
	}
	//할일 한명의 정보를 리턴하는 메소드
	public TodoDto getData(int num) {
		TodoDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "SELECT * FROM todo"
					+ "	WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, num);
			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto=new TodoDto();
				dto.setNum(num);
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	//할일 한명의 정보를 수정하고 성공여부를 묻는 메소드
	public boolean update(TodoDto dto) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int flag = 0;
		try {
			//Connection Pool 에서 Connection 객체 하나 받아오기
			conn = new DbcpBean().getConn();
			//Select 문의 뼈대 구성하기
			String sql = "UPDATE todo"
					+ "	SET content=?, regdate=SYSDATE"
					+ "	WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩할게 있으면 하기
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNum());
			//sql 문 수행하고 ResultSet 객체 얻어내기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();//Connection 객체를 Connection Pool 에 반납하기
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//할일 한명의 정보를 삭제하고 성공여부를 묻는 메소드
	public boolean delete(int num) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int flag = 0;
		try {
			//Connection Pool 에서 Connection 객체 하나 받아오기
			conn = new DbcpBean().getConn();
			//Select 문의 뼈대 구성하기
			String sql = "DELETE FROM todo"
					+ "	WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩할게 있으면 하기
			pstmt.setInt(1, num);
			//sql 문 수행하고 ResultSet 객체 얻어내기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();//Connection 객체를 Connection Pool 에 반납하기
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//할일 한명의 정보를 추가하고 성공여부를 묻는 메소드
	public boolean insert(TodoDto dto) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int flag = 0;
		try {
			//Connection Pool 에서 Connection 객체 하나 받아오기
			conn = new DbcpBean().getConn();
			//Select 문의 뼈대 구성하기
			String sql = "INSERT INTO todo"
					+ " (num, content, regdate)"
					+ "	VALUES(todo_seq.NEXTVAL,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩할게 있으면 하기
			pstmt.setString(1, dto.getContent());
			//sql 문 수행하고 ResultSet 객체 얻어내기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();//Connection 객체를 Connection Pool 에 반납하기
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//전체 할일 목록을 리턴하는 메소드
	public List<TodoDto> getList(){
		List<TodoDto> list=new ArrayList<TodoDto>();
		TodoDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "SELECT * from todo"
					+ "	ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기

			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto=new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
}
