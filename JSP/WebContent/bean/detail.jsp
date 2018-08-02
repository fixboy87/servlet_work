<%@page import="kosta.bean.Board"%>
<%@page import="kosta.bean.BoardDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = request.getParameter("seq");
	int seq = 0;
	if(str != null) {
		seq = Integer.parseInt(str);
	}
	BoardDao2 dao = new BoardDao2();
	Board board = dao.getBoard(seq);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border: medium solid;
		margin: 3px;
		padding: 1px;
	}
	
	table th {
		border: thin solid;
		margin: 1px;
	}
	
	table td {
		border: thin solid;
		margin: 1px;
	}
</style>
</head>
<body>
	<h3>수정하기</h3>
	<a href="updateForm.jsp?seq=<%=board.getSeq()%>">수정</a>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	<%
		out.print("<tr>");
		out.print("<td>"+board.getSeq()+"</td>");
		out.print("<td>"+board.getTitle()+"</td>");
		out.print("<td>"+board.getWriter()+"</td>");
		out.print("<td>"+board.getRegdate()+"</td>");
		out.print("<td>"+board.getHitcount()+"</td>");
		out.print("</tr>");
	%>
	</table>
	<h2><%=board.getContents() %></h2>
</body>
</html>