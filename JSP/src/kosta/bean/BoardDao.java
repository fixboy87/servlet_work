package kosta.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private static BoardDao dao = new BoardDao();
	
	public static BoardDao getInstance() {
		return dao;
	}
	
	//DBCP방식으로 Connection 객체 구하기
	public Connection getConnection() {
		DataSource ds = null;
		
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Board getBoard (int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Board board = new Board();
		String sql = "select * from board where seq = ";
		sql += seq;
		System.out.println(sql);
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			/*pstmt.setInt(1, seq);*/
			
			rs.next();
			board.setSeq(rs.getInt("seq"));
			board.setTitle(rs.getString("title"));
			board.setWriter(rs.getString("writer"));
			board.setContents(rs.getString("contents"));
			board.setRegdate(rs.getString("regdate"));
			board.setHitcount(rs.getInt("hitcount"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	
	public List<Board> listBoard () {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board";
		List<Board> list = new ArrayList<Board>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				//--------- 객체 생성 --------------------
				Board board = new Board();
				
				//--------- 객체 초기화 ------------------
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContents(rs.getString("contents"));
				board.setRegdate(rs.getString("regdate"));
				board.setHitcount(rs.getInt("hitcount"));
				
				//---------- 리스트에 추가 ----------------
				list.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public int insertBoard (Board board){
		Connection conn = null;
		PreparedStatement pstmt = null;

		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "kosta186";
		String password = "1234";
		String sql = "insert into board values( board_seq.nextval, ?, ?, ?, sysdate, 0 )"; // ? = 커맨드 객체
		int re = -1; //-1 : 데이터 값에 변화가 없다. -> 변경 실패
		
		try {
			// 1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. Connection 객체 생성 (DB 연결)
			conn = DriverManager.getConnection(url, user, password);
			
			// 3. PrepareStatement 객체생성
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContents());
			
			// 4. ResultSet 객체생성
			re = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	
}
