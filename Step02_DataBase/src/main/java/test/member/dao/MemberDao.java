package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;
/*
 * Connection 객체 얻어오는 방법
 * 
 * Connection conn = new DbcpBean().getConn();
 * 
 * Web Server Application 에서 DB 연동을 하기 위해 Connection 객체를 얻어와야 하는데
 * 
 * 해당 작업은 DB 에 원격 접속을 해서 계정과 비밀번호를 전달하고 인증을 받아야하는 작업이기 때문에
 * 
 * 시간이 다소(1초이내) 소요되는 무거운 작업이다.
 * 
 * 따라서 Connection 객체를 미리 여러개 만들어 놓고 필요한 곳에서 잠시 사용하고
 * 
 * 닫아 버리는게 아니고 다시 반납하는 구조로 사용할 필요가 있다.
 * 
 * 그렇게 사용하는 방법은 
 * 
 * tomcat.apache.org 사이트에서 설정하라는 대로 하면 된다.
 * 
 * 이게 바로 DBCP Bean 의 개념이다.
 */
//Application 전역에서 MemberDao 객체는 오직 하나만 생성되도록 만들기

public class MemberDao {
	//자신의 참조값을 저장할 static 필드
	private static MemberDao dao;
	//외부세어 객체를 생성하지 못하도록 막기
	private MemberDao() {}
	
	//자신의 참조값을 리턴해주는 public static 메소드 만들기
	public static MemberDao getInstance() {
		//최초 호출될때는 dao 가 null 이다
		if(dao==null) {
			//객체를 생성해서 static 필드에 담아 놓는다.
			dao=new MemberDao();
		}
		//static 필드에 있는 참조값을 리턴해준다.
		return dao;
	}
   //회원 한명의 정보를 리턴하는 메소드
   public MemberDto getData(int num) {
      
      MemberDto dto=null;
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = new DbcpBean().getConn();
         //select 문의 뼈대 구성하기
         String sql = "SELECT name, addr"
               + " FROM member"
               + " WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         //? 에 값 바인딩 할게 있으면 하기
         pstmt.setInt(1, num);
         //sql 문 수행하고 ResultSet 객체 얻어내기
         rs = pstmt.executeQuery();
         //만일 select 된 row 가 있으면 커서를 한칸 내려서 
         if (rs.next()) {
            //커서가 위치한 곳의 회원 정보를 MemberDto 객체를 생성해서 담는다.
            dto=new MemberDto();
            dto.setNum(num);
            dto.setName(rs.getString("name"));
            dto.setAddr(rs.getString("addr"));
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
	   
	//회원 한명의 정보를 수정하고 성공여부를 리턴하는 메소드
	public boolean update(MemberDto dto) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int flag = 0;
		try {
			//Connection Pool 에서 Connection 객체 하나 받아오기
			conn = new DbcpBean().getConn();
			//Select 문의 뼈대 구성하기
			String sql = "UPDATE member"
					+ " SET name=?, addr=?"
					+ "	WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩할게 있으면 하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
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
	//회원 한명의 정보를 삭제 하고 성공 여부를 리턴하는 메소드
	public boolean delete(int num) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int flag = 0;
		try {
			//Connection Pool 에서 Connection 객체 하나 받아오기
			conn = new DbcpBean().getConn();
			//Select 문의 뼈대 구성하기
			String sql = "DELETE FROM member"
					+ " WHERE num=?";
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
	
	
	
	//회원 한명의 정보를 추가 하고 성공 여부흫 리턴하는 메소드
	public boolean insert(MemberDto dto){
		PreparedStatement pstmt = null;
		Connection conn = null;
		int flag = 0;
		try {
			//Connection Pool 에서 Connection 객체 하나 받아오기
			conn = new DbcpBean().getConn();
			//Select 문의 뼈대 구성하기
			String sql = "INSERT INTO member(num,name,addr)"
					+ " VALUES(member_seq.nextval,?,?)";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩할게 있으면 하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
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
	//전체 회원 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		List<MemberDto> list=new ArrayList<>();
		try {
			//Connection Pool 에서 Connection 객체 하나 받아오기
			conn=new DbcpBean().getConn();
			//Select 문의 뼈대 구성하기
			String sql="SELECT num,name,addr FROM member"
					+ " ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			//? 에 값 바인딩할게 있으면 하기
			
			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDto md=new MemberDto();
				md.setNum(rs.getInt("num"));
				md.setName(rs.getString("name"));
				md.setAddr(rs.getString("addr"));
				list.add(md);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {       
			try {
				if(conn!=null)conn.close();//Connection 객체를 Connection Pool 에 반납하기
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			}catch(Exception e) {}
		}
		return list;
	}
}
