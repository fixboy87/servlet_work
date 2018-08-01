<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String path = "/message/notice.txt";
	String fullPath = application.getRealPath(path);
	
//	out.println(fullPath);
	
	try {
		BufferedReader br = new BufferedReader(new FileReader(fullPath));
		String str = "";
		
		while((str = br.readLine()) != null) {
			out.println(str + "<br>");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
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