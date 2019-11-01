package com.nuri.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class memberDAO {
	
// update
	
	public int memberUpdate(Connection con, memberDTO memberDTO) throws Exception{
		int result = 0;
			
		String sql = "update login set pw=?, name=?, email=?, phone=?, grade=? where id=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getName());
		st.setString(3, memberDTO.getEmail());
		st.setString(4, memberDTO.getPhone());
		st.setInt(5, memberDTO.getGrade());
		st.setString(6, memberDTO.getId());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
		
	}
	
	
	
	
	public memberDTO memberlogin(Connection con, memberDTO memberDTO) throws Exception{
//		memberDTO memberDTO2 = null;
		
		String sql ="select * from login where id=? and pw=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
//			memberDTO2 = new memberDTO();
//			memberDTO2.setId(rs.getString("id")); 
//			memberDTO2.setPw(rs.getString("pw"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setGrade(rs.getInt("grade"));
		}else {
			memberDTO = null;
		}
		
		rs.close();
		st.close();
		
		
		
		return memberDTO;
		
	}
	
	public int memberJoin(Connection con , memberDTO memberDTO ) throws Exception{
		
		int result =0;
		
		//SQL巩
		
		String sql="insert into login values(?,?,?,?,?,0)"; 
		
		//固府傈价
		PreparedStatement st = con.prepareStatement(sql);
		
		//蔼悸泼
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		st.setInt(6, memberDTO.getGrade());
		
		
		//弥辆 傈价
		result =st.executeUpdate();
		
		st.close();
		
		return result;
	}
}
