package com.nuri.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.util.ArrayList;

import org.junit.Test;

import com.nuri.notice.noticeDAO;
import com.nuri.notice.noticeDTO;
import com.nuri.util.DBConnector;

public class NoticeDAOTest{
	
	@Test
	public void noticeUpdate() throws Exception{
		noticeDAO noticeDAO = new noticeDAO();
		noticeDTO noticeDTO = new noticeDTO();
		Connection con = DBConnector.getConnection();
		
		noticeDTO.setNum(25);
		noticeDTO.setTitle("TITLE");
		noticeDTO.setWriter("CK");
		noticeDTO.setContents("CKCKCK");
		noticeDTO.setHit(0);
		
		int result = noticeDAO.update(con, noticeDTO);
		assertEquals(1, result);
		
		
	}
	
	//@Test
	public void noticeList() throws Exception {
		noticeDAO noticeDAO = new noticeDAO();
		Connection con = DBConnector.getConnection();
		ArrayList<noticeDTO> ar = new ArrayList<noticeDTO>();
		ar = noticeDAO.noticeList(con);
		assertEquals(5, ar.size());
	}
		
	
	
	//@Test
	public void noticeSelect() throws Exception{
		noticeDAO noticeDAO = new noticeDAO();
		Connection con = DBConnector.getConnection();
		noticeDTO noticeDTO = noticeDAO.noticeSelect(con, 2);
		
		assertNotNull(noticeDTO);
	}
	
	
	
}

