package com.nuri.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.nuri.member.memberDAO;
import com.nuri.member.memberDTO;
import com.nuri.util.DBConnector;

public class memberDAOTest {

	@Test	
	public void memberDelete()throws Exception {
		memberDAO memberDAO = new memberDAO();
		memberDTO memberDTO = new memberDTO();
		
		Connection con = DBConnector.getConnection();
		
		memberDTO.setId("aaa");
		int result = memberDAO.memberDelete(con, memberDTO);
		assertEquals(1, result);
	}
	
	//@Test
	public void memberUpdate()throws Exception {
		memberDAO memberDAO = new memberDAO();
		memberDTO memberDTO = new memberDTO();
		
		Connection con = DBConnector.getConnection();
		
		memberDTO.setPhone("010-0000-0000");
		memberDTO.setEmail("ckck@naver.com");
		memberDTO.setGrade(3);
		memberDTO.setName("admin");
		memberDTO.setPw("asdasd");
		memberDTO.setId("aaa");
		int result = memberDAO.memberUpdate(con, memberDTO);
		assertEquals(1, result);
	}
	
	//@Test
	public void test() throws Exception{
		memberDAO memberDAO = new memberDAO();
		memberDTO memberDTO = new memberDTO();

		Connection con = DBConnector.getConnection();
		
		memberDTO.setId("youngha");
		memberDTO.setPw("youngha");
		memberDTO = memberDAO.memberlogin(con, memberDTO);
		assertNotNull(memberDTO);
	}

}
