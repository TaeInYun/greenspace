package com.example.demo.db;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.ui.Model;

import com.example.demo.dao.ChallengeListDAO;
import com.example.demo.vo.AddressVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.CerBoardVO;
import com.example.demo.vo.ChallengeListVO;
import com.example.demo.vo.ChallengeUserVO;
import com.example.demo.vo.ChallengeVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.MyReviewVO;
import com.example.demo.vo.MyWishVO;
import com.example.demo.vo.OrderBillVO;
import com.example.demo.vo.Pro_add_optionVO;
import com.example.demo.vo.OrderListVO;
import com.example.demo.vo.OrdersProductVO;
import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.ProductVO;
import com.example.demo.vo.QnaVO;
import com.example.demo.vo.ReviewVO;
import com.example.demo.vo.WishListVO;
 
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
	
	public static List<ReviewVO> findAllReview(){
		SqlSession session = factory.openSession();
		List<ReviewVO> list = session.selectList("review.findAll");
		session.close();
		return list;
	}
	
	//상품번호 리뷰목록을 갖고 오는 sql
		public static List<ReviewVO> findAllReviewRate(int pro_no){
			SqlSession session = factory.openSession();
			List<ReviewVO> list = session.selectList("review.findAllRate", pro_no);
			session.close();
			return list;
		}
	
	public static ReviewVO findAllReviewDetail(int no) {
		SqlSession session = factory.openSession();
		ReviewVO r = session.selectOne("review.findAllDetail", no);
		session.close();
		return r;
	}
	
	public static int insertReview(ReviewVO r) {
		
		SqlSession session  = factory.openSession();
		int re=session.insert("review.insert",r);
		session.commit();
		session.close();
		return re;
	}
	
	
	public static int updateReview(ReviewVO r) {
		SqlSession session = factory.openSession(true);
		int re = session.update("review.update", r);
		session.commit();
		session.close();
		return re;				
	}	
	
	public static int deleteReview(int no) {
		SqlSession session  = factory.openSession();
		int re=session.delete("review.delete", no);
		session.commit();
		session.close();
		return re;
	}
	
	public static void updateReviewHit(int no) {
		System.out.println(no);
		SqlSession session = factory.openSession();
		session.update("review.updateHit", no);
		session.commit();
		session.close();
	}
	
	//-----------------------QnaVO---------------------------
	
	public static List<QnaVO> findAllQna(){
		SqlSession session = factory.openSession();
		List<QnaVO> list = session.selectList("qna.findAll");
		session.close();
		return list;
	}
	
	public static List<QnaVO> findAllQnaList(){
		SqlSession session = factory.openSession();
		List<QnaVO> list = session.selectList("qna.findAllList");
		session.close();
		return list;
	}
	   
	public static QnaVO findAllQnaDetail(int no) {
		SqlSession session = factory.openSession();
		QnaVO r = session.selectOne("qna.findAllDetail", no);
		session.close();
		return r;
	}
	
	public static List<QnaVO> findAllQnaSearch(HashMap map){
		SqlSession session = factory.openSession();
		List<QnaVO> list = session.selectList("qna.findAllSearch",map);
		session.close();
		return list;
	}
	
	public static int getTotalRecordQna(HashMap map) {
		SqlSession session = factory.openSession();
		int no = session.selectOne("qna.totalRecord", map);
		session.close();
		return no;
	}
	
	//-----------------------MyReviewVO---------------------------
		public static List<MyReviewVO> findAllMyReview(){
			SqlSession session = factory.openSession();
			List<MyReviewVO> list = session.selectList("myreview.findAll");
			session.close();
			return list;
		}
		
		public static List<MyReviewVO> findAllMyReviewRate(){
			SqlSession session = factory.openSession();
			List<MyReviewVO> list = session.selectList("myreview.findAllRate");
			session.close();
			return list;
		}
		
		
	
	
	
	//-----------------------MYWISH ( 장바구니, 위시리스트)------------------------
	public static List<MyWishVO> findByMember(int member_no){
		SqlSession session = factory.openSession();
		List<MyWishVO> list = session.selectList("myWish.findByMember", 1);
		session.close();
		return list;
	}
	public static MyWishVO getProInfoForOrder(HashMap map){
		SqlSession session = factory.openSession();
		MyWishVO list = session.selectOne("myWish.getProInfoForOrder", map);
		session.close();
		return list;
	}
	
	public static int cntOfCart(int member_no){
		SqlSession session = factory.openSession();
		int cnt = session.selectOne("myWish.cntOfCart", member_no);
			session.close();
			return cnt;
	}
	
	public static CartVO findByCartNo(HashMap map){
		SqlSession session = factory.openSession();
		CartVO c = session.selectOne("cart.findByCartNo", map);
		session.close();
		return c;
	}
	
	//-----------------------ProductVO---------------------------
	//관리자 상품 리스트
	public static List<ProductVO> findAll(HashMap map){
		SqlSession session = factory.openSession();
		List<ProductVO> list= session.selectList("product.findAll",map);
		session.close();
		return list;
	}	
	
	
	public static int getTotalRecord(HashMap map) {
		SqlSession session = factory.openSession();
		int no = session.selectOne("product.totalRecord", map);
		session.close();
		return no;
	}
	
 
	public static List<ProductVO> findAll_home(HashMap map){
		SqlSession session = factory.openSession();
		List<ProductVO> list= session.selectList("product.findAll_home", map);
		session.close();
		return list;
	}	
	
	//상품 상세 
	public static ProductVO findByNo(int no) {
		SqlSession session = factory.openSession();
		ProductVO p = session.selectOne("product.findByNo", no);
		session.close();
		return p;		
	}
	
	
	public static List<ProductVO> findOption(int no){
		SqlSession session = factory.openSession();
		List<ProductVO> list= session.selectList("product.findOption",no);
		session.close();
		return list;
	}	
	
	public static int findOptionView(int no){
		SqlSession session = factory.openSession();
		int re= session.selectOne("product.findOptionView",no);
		session.close();
		return re;
	}	
 
	public static ProductVO findOptionName(int no){
		SqlSession session = factory.openSession();
		ProductVO list= session.selectOne("product.findOptionName",no);
		session.close();
		return list;
	}	
 	
 
	 	public static List<ProductVO> findOptionDetailName(HashMap map){
		SqlSession session = factory.openSession();
		List<ProductVO> list= session.selectList("product.findOptionDetailName",map);
		session.close();
		return list;
	}
 	 
  
	public static List<ProductVO> findDBOption(){
		SqlSession session = factory.openSession();
		List<ProductVO> list= session.selectList("product.findDBOption");
		session.close();
		return list;
	}	
	
	public static List<ProductVO> findDBDetailOption(String pro_option_code){
		SqlSession session = factory.openSession();
		List<ProductVO> list= session.selectList("product.findDBDetailOption", pro_option_code);
		session.close();
		return list;
	}
	
	
	
	public static int update(ProductVO b) {
		SqlSession session = factory.openSession(true);
		int re = session.update("product.update", b);
		session.commit();
		session.close();
		return re;				
	}	
	public static int updateStockcuzBuy(HashMap map) {
		SqlSession session = factory.openSession(true);
		int re = session.update("product.updateStockcuzBuy", map);
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
	
	public static void updateHit(int no) {
		SqlSession session = factory.openSession();
		session.update("product.updateHit", no);
		session.commit();
		session.close();
	}
	
	public static int insert(ProductVO p) {		
		SqlSession session  = factory.openSession();
		int re=session.insert("product.insert",p);
		session.commit();
		session.close();
		return re;
	}
	
	
	
	
	
	//------------------------상품 자체 옵션(Pro_add_optionVO)--------------
	public static int deletePro_add_option(int no) {
		SqlSession session = factory.openSession();
		int re=session.delete("pro_add_option.delete", no);
		session.commit();
		session.close();
		return re;
	}
	public static Integer findProAddPriceNo(HashMap map) {
		SqlSession session = factory.openSession();
		Integer re = session.selectOne("pro_add_option.findProAddPriceNo", map);
		if(re == null) {
			re = 0;
		}
		session.close();
		return re;
	}
	public static int findProAddOptionNoForWishList(HashMap map) {
		SqlSession session = factory.openSession();
		int no = session.selectOne("pro_add_option.findProAddOptionNoForWishList", map);
		session.close();
		return no;
	}
	
	
	public static int insertPro_add_option(Pro_add_optionVO po) {		
		SqlSession session  = factory.openSession();
		int re=session.insert("pro_add_option.insert",po);
		session.commit();
		session.close();
		return re;
	}

	public static List<Pro_add_optionVO> findOptionByProNo(int no) {	 
		SqlSession session = factory.openSession();
		List<Pro_add_optionVO> list= session.selectList("pro_add_option.findOptionByProNo", no);
		session.close();
		return list;
	}
 
	//------------------Address ( 주소록 )------------------------
 
	public static AddressVO getMainAddress(int member_no) {
		SqlSession session = factory.openSession();
		AddressVO main =  session.selectOne("address.getMainAddress", member_no);
		session.close();
		return main;
	}
	
	public static List<AddressVO> findAllAddress() {
		SqlSession session = factory.openSession();
		List<AddressVO> list =  session.selectList("address.findAll");
		session.close();
		return list;
	}
	
	public static AddressVO findAllAddressDetail(int no) {
		SqlSession session = factory.openSession();
		AddressVO a = session.selectOne("address.findAllDetail", no);
		session.close();
		return a;
	}
	
	public static AddressVO allMainAddress(int member_no) {
		SqlSession session = factory.openSession();
		AddressVO main =  session.selectOne("address.allMainAddress", member_no);
		session.close();
		return main;
	}
	
	public static List<AddressVO> allSubAddress(int member_no) {
		SqlSession session = factory.openSession();
		List<AddressVO> sub =  session.selectList("address.allSubAddress", member_no);
		session.close();
		return sub;
	}
	
    public static int insertAddress(AddressVO a) {
		
		SqlSession session  = factory.openSession();
		int re=session.insert("address.insert",a);
		session.commit();
		session.close();
		return re;
	}
	
	
	public static int updateAddress(AddressVO a) {
		SqlSession session = factory.openSession(true);
		int re = session.update("address.update", a);
		session.commit();
		session.close();
		return re;				
	}	
	
	
	public static int updateMainBtnAddress(AddressVO a) {
		SqlSession session = factory.openSession(true);
		int re = session.update("address.updatemainbtn", a);
		session.commit();
		session.close();
		return re;				
	}
	public static int updateSubBtnAddress(AddressVO a) {
		SqlSession session = factory.openSession(true);
		int re = session.update("address.updatesubbtn", a);
		session.commit();
		session.close();
		return re;				
	}
	
	//---------------------메인베송지로 변경하면 나머지 서브로 
	public static void updateBtnAddress(int member_no) {
		SqlSession session = factory.openSession();
		session.update("address.updatebtn", member_no);
		session.commit();
		session.close();
						
	}
	
	public static int deleteAddress(int no) {
		SqlSession session  = factory.openSession();
		int re=session.delete("address.delete", no);
		session.commit();
		session.close();
		return re;
	}
	
	
	//************ Cart ( 장바구니 )
	public static int insertCart(CartVO c) {
		SqlSession session = factory.openSession();
		int re = session.insert("cart.insert", c);
		session.commit();
		session.close();
		return re;
	}
	
	public static int deleteCart(int no) {
		SqlSession session = factory.openSession();
		int re = session.delete("cart.delete",no);
		session.commit();
		session.close();
		return re;
	}
	
	public static int isCart(HashMap map) {
		SqlSession session = factory.openSession();
		int re= session.selectOne("cart.isCart", map);
		session.close();
		return re;
	}
	
	public static int updateQty(HashMap map) {
		SqlSession session = factory.openSession();
		int re = session.update("cart.updateQty", map);
		session.commit();
		session.close();
		return re;
	}
	
	//-----------------Member ( 회원관련 )------------------------
	
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
	
	public static int checkNickname(String nickname) {
		SqlSession session = factory.openSession();
		int cnt = session.selectOne("member.checkNickname",nickname);
		session.close();
		return cnt;
	}	
	
	public static int checkEmail(String email) {
		SqlSession session = factory.openSession();
		int cnt = session.selectOne("member.checkEmail",email);
		session.close();
		return cnt;
	}		
	
	public static String findIdByEmail(HashMap<String,String> m) { 
		SqlSession session = factory.openSession();
		String id = session.selectOne("member.findIdByEmail", m);
		session.close();
		return id;
	}
	
	public static String findIdByPhone(HashMap<String,String> m) { 
		SqlSession session = factory.openSession();
		String id = session.selectOne("member.findIdByPhone", m);
		session.close();
		return id;
	}
	public static int findPwdByEmail(HashMap<String,String> m) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("member.findPwdByEmail", m);
		session.close();
		return re;
	}
	
	public static int findPwdByPhone(HashMap<String,String> m) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("member.findPwdByPhone", m);
		session.close();
		return re;
	}
	public static MemberVO getMemberInfo(int member_no) {
		SqlSession session = factory.openSession();
		MemberVO m = session.selectOne("member.mainMemberInfo", member_no);
		session.close();
		return m;
	}


	public static String updatePwd(HashMap<String,String> m) {
		SqlSession session = factory.openSession();
		String re = session.selectOne("member.updatePwd", m);
		session.close();
		return re;
	}
	
	public static int buyProduct(HashMap map) {
		SqlSession session = factory.openSession();
		int re = session.update("member.buyProduct", map);
		session.commit();
		session.close();
		return re;
	}

	
	
	
	/*-------- 회원 목록 -------*/
	public static List<MemberVO> findAllMember(){
		SqlSession session = factory.openSession();
		List<MemberVO> list= session.selectList("member.findAll");
		session.close();
		return list;
	}	



	

	//--------------------OrderListVO관련--------------
	/*  주문 조회 로그인 */
	public static OrderListVO LoginByOrderId(String name,String id) {

		HashMap map = new HashMap();
		map.put("receiver_name", name);
		map.put("ord_id", id);
		SqlSession session = factory.openSession();
		OrderListVO o = session.selectOne("orderList.LoginByOrderId", map);
		session.close();
		return o;
	}
	
	public static OrderListVO initOrderInfo(int member_no) {
		
		SqlSession session = factory.openSession();
		OrderListVO o = session.selectOne("orderList.initOrderInfo", member_no);
		session.close();
		return o;
	}
	
	public static List<OrderListVO> findAllOrderListByMemberNo(int member_no) {
		
		SqlSession session = factory.openSession();
		List<OrderListVO> o = session.selectList("orderList.findAllOrderListByMemberNo", member_no);
		session.close();
		return o;
	}
	
	
	
	//--------------------OrdersVO관련--------------
	public static int getCntOfToday() {
		SqlSession session = factory.openSession();
		int cnt = session.selectOne("orders.getCntOfToday");
		session.close();
		return cnt;
	}
	
	public static int insertOrders(OrdersVO o) {
		SqlSession session = factory.openSession();
		int cnt = session.insert("orders.insertOrders", o);
		session.commit();
		session.close();
		return cnt;
	}
	public static int getTotalPay(HashMap map) {
		SqlSession session = factory.openSession();
		Integer re = session.selectOne("orders.getTotalPay", map);
		session.close();
		return re;
	}
	public static OrderBillVO billOfOrder(HashMap map) {
		SqlSession session = factory.openSession();
		OrderBillVO ob = session.selectOne("orders.billOfOrder", map);
		session.close();
		return ob;
	}
	
	
	
	//--------------------OrdersProductVO관련--------------
	public static int insertOrdersProduct(HashMap map) {
		SqlSession session = factory.openSession();
		int cnt = session.insert("ordersProduct.insertOrdersProduct", map);
		session.commit();
		session.close();
		return cnt;
	}
	
	
	
	//---------------Challenge (챌린지 관련) ----------

	/*관리자 - 챌린지 목록*/
	public static List<ChallengeVO> findAllChg(){
		SqlSession session = factory.openSession();
		List<ChallengeVO> list= session.selectList("challenge.findAll");
		session.close();
		return list;
	}		
	
	/* 관리자 챌린지 항목 추가 */
	public static int insertChg(ChallengeVO c) {
		SqlSession session  = factory.openSession();
		int re=session.insert("challenge.insert",c);
		session.commit();
		session.close();
		return re;
	}	
	
	/* 관리자 챌린지 항목 상세 */
	public static ChallengeVO findChgByNo(int no) {
		SqlSession session = factory.openSession();
		ChallengeVO c = session.selectOne("challenge.findByNo", no);
		session.close();
		return c;		
	}	
	
	/*관리자 - 챌린지 항목 수정*/
	public static int updateChg(ChallengeVO c) {
		SqlSession session = factory.openSession(true);
		int re = session.update("challenge.update", c);
		session.commit();
		session.close();
		return re;				
	}	
	
	/*관리자 - 챌린지 항목 삭제*/
	public static int deleteChg(int no) {
		SqlSession session  = factory.openSession();
		int re=session.delete("challenge.delete", no);
		session.commit();
		session.close();
		return re;
	}
	
	/*관리자 -챌린지 3개 랜덤가져오기*/
	public static List<ChallengeVO> selectChgRandom(){
		SqlSession session = factory.openSession();
		List<ChallengeVO> list= session.selectList("challenge.selectChgRandom");
		session.close();
		return list;
	}
	
	/*관리자 - 챌린지리스트 추가 하기 */
	public static int insertChglist(HashMap map) {
		SqlSession session  = factory.openSession();
		int re=session.insert("challengelist.insert", map);
		session.commit();
		session.close();
		return re;
	}
	
	/*관리자 - 오늘챌린지리스트 불러오기 */
	public static List<ChallengeListVO> todayChgList(){
		SqlSession session = factory.openSession();
		List<ChallengeListVO> list= session.selectList("challengelist.todayChgList");
		session.close();
		return list;
	}	
	
	/*관리자 - 내일챌린지리스트 불러오기 */
	public static List<ChallengeListVO> tomorrowChgList(){
		SqlSession session = factory.openSession();
		List<ChallengeListVO> list= session.selectList("challengelist.tomorrowChgList");
		session.close();
		return list;
	}	
	
	
	/*관리자 - 어제챌린지리스트 불러오기 */
	public static List<ChallengeListVO> yesterdayChgList(){
		SqlSession session = factory.openSession();
		List<ChallengeListVO> list= session.selectList("challengelist.yesterdayChgList");
		session.close();
		return list;

	}	
	
	//---------------회원 Challenge --------------------
	/* 회원 챌린지리스트 불러오기 */
	public static List<ChallengeListVO> findChglist(int member_no){
		SqlSession session = factory.openSession();
		List<ChallengeListVO> list= session.selectList("challengelist.findByNo",member_no);
		session.close();
		return list;
	}	
	
	/* 회원 챌린지 도전상태 변경 */
	public static int updateChgStatus(ChallengeListVO c) {
		SqlSession session = factory.openSession();
		int re = session.update("challengelist.updateChgStatus", c);
		session.commit();
		session.close();
		return re;				
	}	

	/* 회원 챌린지완료 클릭시 ING-> STA로 도전상태 변경 */
	public static int updateChgStatusSTA(int member_no) {
		SqlSession session = factory.openSession();
		int re = session.update("challengelist.updateChgStatusSTA", member_no);
		session.commit();
		session.close();
		return re;				
	}	
	
	
	//--------------ChallengeUser (완료한 챌린지만 담는 테이블) ----------------
	/* 완료한 챌린지만 insert */
	public static int insertEndChg(int member_no) {
		SqlSession session  = factory.openSession();
		int re=session.insert("challengeuser.insert",member_no);
		session.commit();
		session.close();
		return re;
	}	
	
	
	//------------------회원 완료된 챌린지 목록 ----------------------
	public static List<ChallengeUserVO> listChgUserByMemberNO(int member_no){
		SqlSession session = factory.openSession();
		List<ChallengeUserVO> list= session.selectList("challengeuser.listChgUserByMemberNO",member_no);
		session.close();
		return list;
	}		
	
	
	
	//------------------챌린지 인증게시판 목록 ----------------------
	public static List<CerBoardVO> findCerBoard(){
		SqlSession session = factory.openSession();
		List<CerBoardVO> list= session.selectList("cerboard.findAll");
		session.close();
		return list;
	}		

	
	//------------------챌린지 인증게시판 등록 ----------------------
	public static int insertCerBoard(CerBoardVO c) {
		SqlSession session  = factory.openSession();
		int re=session.insert("cerboard.insert",c);
		session.commit();
		session.close();
		return re;
	}	

	
	//---------------WishList (위시리스트 관련) ----------
	public static List<WishListVO> findByMemberWish(int member_no){
		SqlSession session = factory.openSession();
		List<WishListVO> list = session.selectList("wishList.findByMember", member_no);
		session.close();
		return list;
	}
	public static int cntOfWishList(int member_no){
		SqlSession session = factory.openSession();
		int cnt = session.selectOne("wishList.cntOfWishList", member_no);
		session.close();
		return cnt;
	}
	public static int deleteWishList(int no){
		SqlSession session = factory.openSession();
		int re = session.delete("wishList.deleteWishList", no);
		session.commit();
		session.close();
		return re;
	}
	public static int insertWishList(WishListVO w) {
		SqlSession session = factory.openSession();
		int re = session.insert("wishList.insert", w);
		session.commit();
		session.close();
		return re;
	}
	public static int isWishList(WishListVO w) {
		SqlSession session = factory.openSession();
		int cnt = session.selectOne("wishList.isWishList", w);
		session.close();
		return cnt;
	}
	
	

	 
}