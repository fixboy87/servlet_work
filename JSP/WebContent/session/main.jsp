<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	String name = (String)session.getAttribute("name");
	if(name.isEmpty()) {
		response.sendRedirect("loginForm.jsp");
	} else {
		//name = URLDecoder.decode(str, "utf-8"); 이것 역시도 필요가 없다.
	}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=name %> 님 안녕하세요.<br>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>