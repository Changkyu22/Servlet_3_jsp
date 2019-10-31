package com.nuri.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Random;

import org.junit.Test;

import com.nuri.notice.noticeDAO;
import com.nuri.notice.noticeDTO;
import com.nuri.point.pointDAO;
import com.nuri.point.pointDTO;
import com.nuri.util.DBConnector;

public class PointDAOTest {
	
	@Test
	public void noticeSelect() throws Exception{
		noticeDAO noticeDAO = new noticeDAO();
		Connection con = DBConnector.getConnection();
		noticeDTO noticeDTO = noticeDAO.noticeSelect(con, 2);
		
		assertNotNull(noticeDTO);
	}
	
	
	//@Test
	public void pointUpdate() throws Exception {
		pointDAO pointDAO = new pointDAO();
		pointDTO pointDTO = new pointDTO();
		Connection con = DBConnector.getConnection();
		
		pointDTO.setNum(99);
		pointDTO.setName("SUJI");
		pointDTO.setKor(20);
		pointDTO.setEng(44);
		pointDTO.setMath(55);
		pointDTO.setTotal(60);
		pointDTO.setAvg(20.0);
		
		int result = pointDAO.update(con, pointDTO);
		assertEquals(1, result);
			
		
	}
	
	//@Test
	public void insertTest() throws Exception{
		pointDAO pointDAO = new pointDAO();
		Connection con = DBConnector.getConnection();
		
		for(int i=0; i<10; i++) {
			Random random = new Random();
			pointDTO pointDTO = new pointDTO();
			pointDTO.setName("name"+i);
			pointDTO.setKor(random.nextInt(101));
			pointDTO.setEng(random.nextInt(101));
			pointDTO.setMath(random.nextInt(101));
			pointDTO.setTotal(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
			pointDTO.setAvg(pointDTO.getTotal()/3.0);
			pointDAO.insert(con, pointDTO);
			Thread.sleep(500);
		}
		con.close();
	}

	
	//@Test
	public void test4() throws Exception {
		pointDAO pointDAO = new pointDAO();
		Connection con = DBConnector.getConnection();
		ArrayList<pointDTO> ar = new ArrayList<pointDTO>();
		ar = pointDAO.selectList(con);
		assertNotEquals(6, ar.size());
	}
	
	
	//@Test
	public void test3() throws Exception{
		pointDAO pointDAO = new pointDAO();
		Connection con = DBConnector.getConnection();
		pointDTO pointDTO = new pointDTO();
		pointDTO = pointDAO.selectOne(con, 21);
		assertNotNull(pointDTO);
		
	}
	
	//@Test
	public void test2() throws Exception{
		Connection con = DBConnector.getConnection();
		assertNotNull(con);
		
	}
	
	
	
	//@Test
	public void test() throws Exception{
		pointDAO pointDAO = new pointDAO();
		pointDTO pointDTO = new pointDTO();
		Connection con = DBConnector.getConnection();
		int result = pointDAO.delete(con, pointDTO);
		System.out.println(result);
		
		// 단정문
		assertEquals(1, result);
	}

}
