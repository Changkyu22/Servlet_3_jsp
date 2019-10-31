package com.nuri.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class memberDAO {
	
	public int memberJoin(Connection con , memberDTO memberDTO ) throws Exception{
		
		int result =0;
		
		//SQL巩
		
		String sql="insert into login values(?,?,?,?,?,?) "; 
		
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
