package com.example.demo.db;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.AddressVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.MyWishVO;
import com.example.demo.vo.ProductVO;
 

public class DBManager {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/example/demo/db/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	
			
	//-----------------------ReviewVO---------------------------
	
	public static List<MyWishVO> findAllMyReview(){
		SqlSession session = factory.openSession();
		List<MyWishVO> list = session.selectList("review.findAll");
		session.close();
		return list;
	}
	
	public static List<MyWishVO> findAllMyReviewRate(){
		SqlSession session = factory.openSession();
		List<MyWishVO> list = session.selectList("review.findAllRate");
		session.close();
		return list;
	}
	
	
	//-----------------------MyReviewVO---------------------------
		public static List<MyWishVO> findAllReview(){
			SqlSession session = factory.openSession();
			List<MyWishVO> list = session.selectList("myreview.findAll");
			session.close();
			return list;
		}
	
	
	
		//************MYWISH ( 장바구니, 위시리스트)
		public static List<MyWishVO> findByMember(int member_no){
			SqlSession session = factory.openSession();
			List<MyWishVO> list = session.selectList("myWish.findByMember", 1);
			session.close();
			return list;
		}
		
		public static int cntOfCart(int member_no){
			SqlSession session = factory.openSession();
			int cnt = session.selectOne("myWish.cntOfCart", member_no);
			session.close();
			return cnt;
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
		session.commit();
		session.close();
		return re;				
	}	
	
	public static int delete(int no) {
		SqlSession session  = factory.openSession();
		int re=session.delete("product.delete", no);
		session.commit();
		session.close();
		return re;
	}

	public static int insert(ProductVO p) {
		
		SqlSession session  = factory.openSession();
		int re=session.insert("product.insert",p);
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
	
	//************ Address ( 주소록 )
	public static AddressVO getMainAddress(int member_no) {
		SqlSession session = factory.openSession();
		AddressVO main =  session.selectOne("address.getMainAddress", member_no);
		session.close();
		return main;
	}
	
	//------------MemberVO--------------
	public static int insertMember(MemberVO m) {
		SqlSession session = factory.openSession();
		int re = session.insert("member.insert",m);
		session.commit();
		session.close();
		return re;
	}
	
	public static MemberVO findById(String id) {
		SqlSession session = factory.openSession();
		MemberVO m = session.selectOne("member.findById", id);
		session.close();
		return m;
	}
	
	public static int checkId(String id) {
		SqlSession session = factory.openSession();
		int cnt = session.selectOne("member.checkId",id);
		session.close();
		return cnt;
	}
	
	
}

