<%@page import="kosta.bean.BoardDao2"%>
<%@page import="kosta.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="kosta.bean.Board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
	
<%
	BoardDao2 dao = BoardDao2.getInstance();
	int re = dao.updateBoard(board);
	if(re==1) {
		response.sendRedirect("list.jsp");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>