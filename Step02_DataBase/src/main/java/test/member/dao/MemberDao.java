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
 */
public class MemberDao {
	//전체 회원 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		List<MemberDto> list=new ArrayList<>();
		try {
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
				if(conn!=null)conn.close();
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			}catch(Exception e) {}
		}
		return list;
	}
}
