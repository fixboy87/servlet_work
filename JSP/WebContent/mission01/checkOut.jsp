<%@page import="kosta.bean.Order"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Order> list = (ArrayList)session.getAttribute("list");
	if(list.equals(null)) {
		response.sendRedirect("login.jsp");

	} else {
		session.invalidate();
	}
	/*
		List<String> list = (List)session.getAttribute("productList");
		if(list == null) {
			out.println("선택한 상품이 없습니다.");
		} else {
			for(String fruit : list) {
				out.println("fruit + <br>");
			}
		}	
	*/
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<%
		int tot = 0;
		for(Order temp : list) {
			tot += temp.getPrice();
			out.print("<tr>");
			out.print("<td>" + temp.getProduct() + "</td>");
			out.print("<td>" + temp.getQty() + "</td>");
			out.print("<td>" + temp.getPrice() + "</td>");
			out.print("</tr>");
		}
	%>
	</table>
	<p>총합 : <%=tot %><p>;
	
	<a href="login.jsp">다시 하기</a>
</body>
</html>