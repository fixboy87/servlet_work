<%@page import="kosta.bean.BoardDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8"); //1.인코딩
%>
<jsp:useBean id="board" class="kosta.bean.Board"/> <!-- 2. 해당 객체를 생성 id=클래스, class는 클래스파일위치와 동일-->

<jsp:setProperty property= "*" name="board"/> <!-- 3. * 를 이용하여 전달받은 모든 parameter들의 값으로 초기화 property는 parameter-->

<%
	BoardDao2 dao = BoardDao2.getInstance(); //4. dao객체를 호출하여 값이 넘어갔는지 확인
	int re = dao.insertBoard(board);
	
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