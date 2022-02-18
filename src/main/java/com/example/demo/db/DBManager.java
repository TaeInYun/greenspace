package com.example.demo.db;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.MyWishVO;

public class DBManager {
	
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/example/demo/db/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
	}
	
	public static List<MyWishVO> findByMember(){
		SqlSession session = factory.openSession();
		List<MyWishVO> list = session.selectList("myWish.findByMember");
		session.close();
		return list;
	}
}
