<%@page import="kosta.bean.Recomment"%>
<%@page import="kosta.bean.Board"%>
<%@page import="kosta.bean.BoardDao"%>
<%@page import="kosta.bean.BoardDao2"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<% 
      String str = request.getParameter("seq");
 /*   0넘어오면 넘버오버 입세션?? */ 
      int seq = 0;
      BoardDao2 dao = BoardDao2.getInstance();
      Board board = new Board();
       if(str!=null){
         seq=Integer.parseInt(str);
         
         board=dao.getBoard(seq);//7. dao에서 호출
      
         request.setAttribute("board", board);
      }
       
      String r_str = request.getParameter("r_seq");
      int r_seq = 0;
      Recomment recomment = new Recomment();
      if(r_str!=null) {
    	  r_seq = Integer.parseInt(r_str);
    	  recomment = dao.getRecomment(seq);
    	  
    	  request.setAttribute("recomment", recomment);
      }
      
      
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h4>글목록 세부보기</h4>
   <ul>
      <li>글번호 : ${board.seq}</li>
      <li>제목 : ${board.title}</li>
      <li>작성자 : ${board.writer}</li>
      <li><a href="download.jsp?filename=${board.fname }">${board.fname }</a></li>
      <li>내용 : ${board.contents}</li>
   </ul>

<a href="updateForm.jsp?seq=${board.seq }">수정하기</a>
<a href="delete.jsp?seq=${board.seq }">삭제하기</a>


<br><br>

	<ul>
		<li>답글번호 : ${recomment.seq }</li>
		<li>제목 : ${recomment.title }</li>
		<li>작성자 : ${recomment.writer }</li>
		<li>내용 : ${recomment.content }</li>
		<li>등록일 : </li>
	</ul>
<a href="replyAction.jsp?seq=${board.seq }">댓글달기</a>
</body>
</html>