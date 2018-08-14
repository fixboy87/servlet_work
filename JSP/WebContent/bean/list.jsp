<%@page import="kosta.bean.ListModel"%>
<%@page import="kosta.bean.BoardService"%>
<%@page import="kosta.bean.Search"%>
<%@page import="kosta.bean.Recomment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kosta.bean.BoardDao2"%>
<%@page import="kosta.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%! List<Board> list = new ArrayList<Board>(); %>
<%
	request.setCharacterEncoding("utf-8");
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) pageNum = "1";
	int requestPage = Integer.parseInt(pageNum);

	BoardService service = BoardService.getInstance(); //4. dao객체를 호출하여 값이 넘어갔는지 확인

	ListModel listModel = service.listBoardService(requestPage, request);
	request.setAttribute("listModel", listModel);
	
	//list<board> = dao.listBoard(search);
	//request.setAttribute("list", list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border: medium solid;
		margin: 3px;
		padding: 1px;
	}
	
	table th {
		border: thin solid;
		margin: 1px;
	}
	
	table td {
		border: thin solid;
		margin: 1px;
	}
</style>
</head>
<body>
	<h3>글목록보기</h3>
	<a href="insert_form.jsp">글쓰기</a>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<!-- <th>내용</th> -->
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${listModel.list }">
				<tr>
					<td>${board.seq }</td>
					<c:if test="${board.fname != null }">
					<c:set var="head" value="${fn:substring(board.fname, 
											0, fn:length(board.fname)-4) }"></c:set>
					<c:set var="pattern" value="${fn:substring(board.fname, 
					fn:length(head) +1, fn:length(board.fname)) }"></c:set>
				
					<c:choose>
						<c:when test="${pattern == 'jpg' || pattern == 'gif' }">
							<img src="../upload/${head }_small.${pattern}">
						</c:when>
						<c:otherwise>
							<c:out value="NO IMAGE"></c:out>
						</c:otherwise>
					</c:choose>
				</c:if>
					<td><a href = "detail.jsp?seq=${board.seq }">${board.title }</a></td>
					<td>${board.writer }</td>
					<td>
						<fmt:parseDate var="dateString" value="${board.regdate }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${dateString }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${board.hitcount }</td>
				</tr>
			</c:forEach>
			<%--
			for(Board board: list) {
				--%>
					<!-- <%--
				<tr>
					<td><%=board.getSeq() %></td>
					<td><a href = "detail.jsp?seq=<%=board.getSeq()%>"><%=board.getTitle() %></a></td>
					<td><%=board.getWriter() %></td>
					<td><%=board.getRegdate() %></td>
					<td><%=board.getHitcount() %></td>
					 --%> -->
				<!-- out.print("<tr>");
				out.print("<td>"+board.getSeq()+"</td>");
				out.print("<td>"+board.getTitle()+"</td>");
				out.print("<td>"+board.getWriter()+"</td>");
				out.print("<td>"+board.getContents()+"</td>");
				out.print("<td>"+board.getRegdate()+"</td>");
				out.print("<td>"+board.getHitcount()+"</td>");
				out.print("</tr>"); -->
			<%--
			}
			--%>					
		</tbody>
		
	</table>
	<br><br>
	
	<!-- 페이징 처리 영역 -->
	<!-- 이전 -->
	<c:if test="${listModel.startPage >5 }">
		<a href="list.jsp?pageNum=${listModel.startPage-1 }">[이전]</a>
	</c:if>
	<!-- 페이지 목록 -->
	<c:forEach var="pageNo" begin="${listModel.startPage }" end="${listModel.endPage }">
		<c:if test="${listModel.requestPage == pageNo }"><b></c:if>
		<a href="list.jsp?pageNum=${pageNo }">[${pageNo }]</a>
		<c:if test="${listModel.requestPage == pageNo }"></b></c:if>
	</c:forEach>
	<!-- 이후 -->
	<c:if test="${listModel.endPage < listModel.totalPageCount }">
		<a href="list.jsp?pageNum=${listModel.startPage + 5 }">[이후]</a>
	</c:if>
	

		<form action= "list.jsp" method="post">
			<!-- <input type="hidden" name="temp" value="temp"> -->
			<input type="checkbox" name="area" value="title">제목 
			<input type="checkbox" name="area" value="writer">작성자
			<input type="text" name="searchKey" value="title"></input>
			<input type="submit" value="등록" >
		</form>
</body>
</html>