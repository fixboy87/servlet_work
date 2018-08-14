<%@page import="kosta.bean.Recomment"%>
<%@page import="kosta.bean.BoardDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq;
	String str = request.getParameter("seq");
	if(str == null) response.sendRedirect("list.jsp");
	else seq = Integer.parseInt(str);
	
	BoardDao2 dao = BoardDao2.getInstance();
	//Recomment reply = dao.insertRecomment(seq);
	
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