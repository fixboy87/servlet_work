<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kosta.bean.BoardDao2"%>
<%@page import="kosta.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! List<Board> list = new ArrayList<Board>(); %>
<%
	BoardDao2 dao = BoardDao2.getInstance(); //4. dao객체를 호출하여 값이 넘어갔는지 확인
	list = dao.listBoard();
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
	<h3>글목록보기</h3>
	<a href="insert_form.jsp">글쓰기</a>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<!-- <th>내용</th> -->
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<%
			for(Board board: list) {
				%>
				<tr>
					<td><%=board.getSeq() %></td>
					<td><a href = "detail.jsp?seq=<%=board.getSeq()%>"><%=board.getTitle() %></a></td>
					<td><%=board.getWriter() %></td>
					<td><%=board.getRegdate() %></td>
					<td><%=board.getHitcount() %></td>
				<!-- out.print("<tr>");
				out.print("<td>"+board.getSeq()+"</td>");
				out.print("<td>"+board.getTitle()+"</td>");
				out.print("<td>"+board.getWriter()+"</td>");
				out.print("<td>"+board.getContents()+"</td>");
				out.print("<td>"+board.getRegdate()+"</td>");
				out.print("<td>"+board.getHitcount()+"</td>");
				out.print("</tr>"); -->
			<%
			}
			%>					
		</tbody>
	</table>
</body>
</html>