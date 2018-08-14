<%@page import="kosta.bean.Order"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	
    %>
    <jsp:useBean id="order" class="kosta.bean.Order"/>
    <jsp:setProperty property="*" name="order"/>
    <%
    	
   		
    	List<Order> list = (ArrayList)session.getAttribute("list");
    	//String product = request.getParameter("product");
    	list.add(order);
    	session.setAttribute("list", list);
    	
    	System.out.println("add.jsp"+list);
    	
    	response.sendRedirect("selProduct.jsp");
    	
    	/*
    		String product = request.getParameter("product");
    		List<String> list = (List)session.getAttribute("productList");
    		
    		if(list == null) {
    			list = new ArrayList<String>();
    			session.setAttribute("productList",list);
    		}
    		list.add(list);
    	*/
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="javascript:history.back()">뒤로가기</a>
	<%-- <%=product %> --%>
</body>
</html>