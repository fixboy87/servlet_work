<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_id = "kosta";
	String m_pass = "1234";

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	String m_name = "홍길동";
	//String name = URLEncoder.encode(m_name, "utf-8"); 서버간의 정보전달 -> 인코딩을 할 필요가 없다.
	
	if(m_id.equals(id) && m_pass.equals(pass)) {
		session.setAttribute("name", m_name);
		
		response.sendRedirect("main/main.jsp");
	} else response.sendRedirect("loginForm.jsp");
	
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