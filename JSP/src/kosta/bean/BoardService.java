package kosta.bean;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardService { //jsp -> service -> dao
	private static final int PAGE_SIZE = 2;
	private static BoardService service = new BoardService();
	private static BoardDao2 dao;
	
	
	public static BoardService getInstance() {
		dao = BoardDao2.getInstance();
		return service;
	}
	
	public int insertBoardService(HttpServletRequest request) throws Exception {
		Board board = new Board();
		
		//파일업로드(경로, 파일크기, 인코딩방식, 파일이름 중첩시 정책)
		@SuppressWarnings("deprecation")
		String uploadPath = request.getRealPath("upload");
		int size = 20 * 1024 * 1024; // 20 MB
		
		MultipartRequest multi = 
				new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
		
		board.setTitle(multi.getParameter("title"));
		board.setWriter(multi.getParameter("writer"));
		board.setContents(multi.getParameter("contents"));
		
		//파일업로드시
		if(multi.getFilesystemName("fname") != null){
			String fname = multi.getFilesystemName("fname");
			board.setFname(fname);
			
			//썸네일 이미지(jpg, gif)  aaa.gif => aaa_small.gif
			String pattern = fname.substring(fname.indexOf(".")+1);//gif
			String headName = fname.substring(0, fname.indexOf("."));//aaa
			
			System.out.println("pattern: " + pattern);
			System.out.println("headName: " + headName);
			
			//원본 File객체
			String imagePath = uploadPath + "\\" + fname;
			File src = new File(imagePath);
			
			//썸네일 이미지 File객체
			String thumImagePath = uploadPath + "\\" + headName + "_small." + pattern;
			File dest = new File(thumImagePath);
			
			if(pattern.equals("jpg") || pattern.equals("gif")){
				ImageUtil.resize(src, dest, 100, ImageUtil.RATIO); //섬네일 생성
			}
			
		}else{
			board.setFname("");
		}
		
		return dao.insertBoard(board);
	}
	
	public ListModel listBoardService(int requestPage ,HttpServletRequest request) { 
		HttpSession session = request.getSession(); //jsp가 아닌 경우 session을 request 객체에서 구현한다.
		
		Search search = new Search();
		
		//새로운 검색 시도
/*		if(request.getParameter("temp")!=null || 
				request.getParameter("pageNum")== null) {
			session.removeAttribute("search");
		}*/
		
		//검색시
		if(request.getParameter("area")!=null) {
			session.removeAttribute("search");
			search.setArea(request.getParameterValues("area"));
			search.setSearchKey("%" +request.getParameter("searchKey") + "%");
			session.setAttribute("search", search);
		} else if((Search)session.getAttribute("search") != null) {
			//검색 후 페이징을 클릭
			search = (Search)session.getAttribute("search");
		}
		
		
		//페이지당 글갯수, 총글갯수, 총페이지수, 현재페이지, 시작페이지, 마지막페이지
		//startRow, endRow => 데이터 출력(List)
		
		//총글갯수 구하기
		int totalCount = dao.countBoard(search);

		//총 페이지수 구하기
		int totalPageCount = totalCount/PAGE_SIZE;
		if(totalCount%PAGE_SIZE > 0) totalPageCount++;
		
		//시작 페이지 구하는 공식 : 
		//(시작페이지 = 현재페이지 - (현재페이지 - 1) % pagenation 갯수
		int startPage = requestPage - (requestPage-1) % 5;
		
		//마지막 페이지 구하기
		int endPage = startPage + 4;
		if(endPage > totalPageCount) endPage = totalPageCount;
		
		//시작글 구하기 = (현재 페이지 -1 ) * 페이지 당 글갯수
		int startRow = (requestPage -1) * PAGE_SIZE;
		
		List<Board> list = dao.listBoard(search, startRow);
		ListModel listModel = new ListModel(list, requestPage, totalPageCount, startPage, endPage);
		
		return listModel;
	}
}
