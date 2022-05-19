package test.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.food.dto.FoodDto;
import test.util.DbcpBean;



public class FoodDao {
	private static FoodDao dao;
	private FoodDao() {}
	public static FoodDao getInstance() {
		if(dao==null) {
			dao=new FoodDao();
		}
		return dao;
	}
	

	public boolean insert(FoodDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int updatedRowCount=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO food"
					+ " (num,name,addr)"
					+ " VALUES(food_seq.nextval,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			updatedRowCount=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(updatedRowCount>0) {
			return true;
		}else {
			return false;
		}
	}
	public boolean update(FoodDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int updatedRowCount=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="UPDATE food"
					+ " SET name=?, addr=?"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			updatedRowCount=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(updatedRowCount>0) {
			return true;
		}else {
			return false;
		}
	}
	public boolean delete(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int updatedRowCount=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="DELETE FROM food"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			updatedRowCount=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
			}catch(Exception e) {}
		}
		if(updatedRowCount>0) {
			return true;
		}else {
			return false;
		}
	}
	public FoodDto getData(int num) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		FoodDto dto=null; //
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT name,addr FROM food"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new FoodDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
		return dto;
	}
	public List<FoodDto> getList(){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		List<FoodDto> list=new ArrayList<>();
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT num,name,addr FROM food"
					+ " ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				FoodDto md=new FoodDto();
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
	public FoodDto getRandom(int num) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		FoodDto dto=null; //
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT name,addr FROM"
					+ " (SELECT * FROM food"
					+ " ORDER BY DBMS_RANDOM.VALUE)"
					+ " WHERE ROWNUM <=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new FoodDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
		return dto;
	}
}
