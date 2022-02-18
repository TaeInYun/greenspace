package com.example.demo.db;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.AddressVO;
import com.example.demo.vo.MyWishVO;
import com.example.demo.vo.ProductVO;
 

public class DBManager {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader
			= Resources.getResourceAsReader("com/example/demo/db/sqlMapConfig.xml");
			
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	
	//-----------------------MemberVO---------------------------
	public static List<MemberVO> findAllMember(){
		SqlSession session = factory.openSession();
		List<MemberVO> list = session.selectList("member.findAll");
		session.close();
		return list;
	}
	
 
	//-----------------------ProductVO---------------------------
	public static List<ProductVO> findAll(){
		SqlSession session = factory.openSession();
		List<ProductVO> list= session.selectList("product.findAll");
		session.close();
		return list;
	}	

	public static ProductVO findByNo(int no) {
		SqlSession session = factory.openSession();
		ProductVO p = session.selectOne("product.findByNo", no);
		session.close();
		return p;		
	}
	
	public static int update(ProductVO b) {
		SqlSession session = factory.openSession(true);
		int re = session.update("product.update", b);
		session.close();
		return re;				
	}

	public static int delete() {
		SqlSession session  = factory.openSession();
		int re=session.delete("product.delete");
		session.commit();
		session.close();
		return re;
	}
	
	public static void updateHit(int no) {
		SqlSession session = factory.openSession();
		session.update("product.updateHit", no);
		session.commit();
		session.close();
	}
	
	//************MYWISH ( 장바구니, 위시리스트)
	
	public static List<MyWishVO> findByMember(int member_no){
		SqlSession session = factory.openSession();
		List<MyWishVO> list = session.selectList("myWish.findByMember", member_no);
		session.close();
		return list;
	}
	
	public static int cntOfCart(int member_no){
		SqlSession session = factory.openSession();
		int cnt = session.selectOne("myWish.cntOfCart", member_no);
		session.close();
		return cnt;
	}
	
	//************ Address ( 주소록 )
	public static AddressVO getMainAddress(int member_no) {
		SqlSession session = factory.openSession();
		AddressVO main =  session.selectOne("address.getMainAddress", member_no);
		session.close();
		return main;
	}
}