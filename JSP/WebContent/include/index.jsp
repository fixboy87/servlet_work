<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="pages/header.jsp" %>
<%@ include file="pages/menu.jsp" %>
<%@ include file="pages/footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#imageSection {
	width : 90%;
	height : 200px;
	background-color: aqua;
	clear: both;
	margin-bottom: 30px;
}

#imageSection>#image {
	background-position: center;
	background-image: url("http://blogfiles1.naver.net/20140813_156/choo4260_1407890726402miVGC_PNG/1407890722663_109%2Bjpg.png");
}

#bodySection {
	width : 65%;
	background-color: lightgray;
}

#menuSection {
	width : 30%;
	height : 500px;
	float : left;
	background-color: red;
}

#pageSection {
	width : 60%;
	height : 40%;
}

#footerSection {
	clear: both;
	height : 200px; 
	margin-top : 30px;
}

#first {
	display : inline;
	float: left;
	background-color: maroon;
	color: white;
}

#second {
	display : inline;
	background-color: maroon;
	color: white;
}

#third {
	display : inline;
	float: right;
	background-color: maroon;
	color: white;
}
</style>
</head>
<body>
	<h1>첫 페이지</h1>
</body>
</html>