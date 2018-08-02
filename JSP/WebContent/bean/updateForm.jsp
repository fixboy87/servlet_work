<%@page import="kosta.bean.Board"%>
<%@page import="kosta.bean.BoardDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = request.getParameter("seq");
	int seq = 0;
	if (str != null) {
		seq = Integer.parseInt(str);
	}
	BoardDao2 dao = BoardDao2.getInstance();
	Board board = dao.getBoard(seq);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateAction.jsp" method="post">
		<dl>
			<dt><input name="seq" value=<%=board.getSeq() %> type="hidden"></dt>
			<dt>제목 : <input name="title" value=<%=board.getTitle() %>></dt>
			<dt>글쓴이 : <%=board.getWriter() %></dt>
			<dt>내용 : <textarea name="contents"><%=board.getContents() %></textarea></dt>
		</dl>
		<input type="submit" value="수정완료">
	</form>
</body>
</html>