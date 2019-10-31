package com.nuri.point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class pointDAO {
	
	// update
	public int update(Connection con, pointDTO pointDTO) throws Exception {
		int result = 0;
		
		String sql = "update point set name=?, kor=?, eng=?, math=?, total=?, avg=? where num =?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		st.setInt(7, pointDTO.getNum());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
		
	}
	
	
	// selectList
	
	public ArrayList<pointDTO> selectList(Connection con) throws Exception{
		ArrayList<pointDTO> ar = new ArrayList<pointDTO>();
		
		String sql = "select * from point order by num desc";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			pointDTO pointDTO = new pointDTO();
			pointDTO.setNum(rs.getInt(1));
			pointDTO.setName(rs.getString(2));
			pointDTO.setKor(rs.getInt(3));
			pointDTO.setEng(rs.getInt(4));
			pointDTO.setMath(rs.getInt(5));
			pointDTO.setTotal(rs.getInt(6));
			pointDTO.setAvg(rs.getDouble(7));
			ar.add(pointDTO);
		}
		
		rs.close();
		st.close();
		
		return ar;
	}
	
	// insert
	
	public int insert(Connection con, pointDTO pointDTO) throws Exception{
		int result = 0;
		
		String sql = "insert into point values(point_seq.nextval, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	// Delete
	
	public int delete(Connection con, pointDTO pointDTO) throws Exception {
		int result = 0;
		
		String sql = "delete point where num = ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, pointDTO.getNum());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	// selectOne
	
	
	 public pointDTO selectOne(Connection con, int num) throws Exception{
	 	pointDTO pointDTO = null;
	 	
	 	String sql ="select * from point where num = ?";
	 	
	 	PreparedStatement st = con.prepareStatement(sql);
	 	
	 	st.setInt(1, num);
	 	
	 	ResultSet rs = st.executeQuery();
	 	
	 	if(rs.next()) {
	 		pointDTO = new pointDTO();
	 		pointDTO.setNum(rs.getInt("num"));
	 		pointDTO.setName(rs.getString("name"));
	 		pointDTO.setKor(rs.getInt("kor"));
	 		pointDTO.setEng(rs.getInt("eng"));
	 		pointDTO.setMath(rs.getInt("math"));
	 		pointDTO.setTotal(rs.getInt("total"));
	 		pointDTO.setAvg(rs.getDouble("avg"));
	 	}
	 	
	 	rs.close();
	 	st.close();
	 	
	 	return pointDTO;
	 
	 }
	
	

}
